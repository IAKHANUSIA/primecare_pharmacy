Imports System
Imports System.Data
Imports System.Data.OleDb
Imports System.IO
Imports System.Net
Imports System.Text
Imports System.Web.Configuration
Imports System.Web.UI

Partial Public Class Services_WeightManagementPage
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
    End Sub

    Protected Sub btnSubmitBooking_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSubmitBooking.Click
        Try
            Dim fullName As String = txtBookingName.Text.Trim()
            Dim phone As String = txtBookingPhone.Text.Trim()
            Dim email As String = txtBookingEmail.Text.Trim()
            Dim serviceType As String = If(ddlServiceType IsNot Nothing, ddlServiceType.SelectedValue, "Weight Management")
            Dim preferredDate As String = txtBookingDate.Text.Trim()
            Dim notes As String = txtBookingNotes.Text.Trim()

            Dim jsonPayload As String = String.Format(
                "{{""FormType"":""Appointment Booking"",""FullName"":""{0}"",""Phone"":""{1}"",""Email"":""{2}"",""ServiceType"":""{3}"",""PreferredDate"":""{4}"",""Notes"":""{5}""}}",
                SanitizeJson(fullName), SanitizeJson(phone), SanitizeJson(email), SanitizeJson(serviceType), SanitizeJson(preferredDate), SanitizeJson(notes))

            SaveBookingLocally("Appointment Booking", fullName, phone, email, serviceType, "", preferredDate, notes)
            SaveBookingToAccessDB("Appointment Booking", fullName, phone, email, serviceType, "", preferredDate, notes)

            SendToGoogleSheet(jsonPayload)

            pnlMessage.CssClass = "alert alert-success"
            lblStatusMessage.Text = "<strong>Thank you!</strong> Your appointment request has been submitted successfully. Our pharmacy team will contact you shortly to confirm."
            ClearBookingForm()
            pnlMessage.Visible = True

        Catch ex As Exception
            pnlMessage.CssClass = "alert alert-danger"
            lblStatusMessage.Text = "An error occurred while submitting your request: " & Server.HtmlEncode(ex.Message)
            pnlMessage.Visible = True
        End Try
    End Sub

    Protected Sub btnSubmitPrescription_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSubmitPrescription.Click
        Try
            Dim fullName As String = txtRxName.Text.Trim()
            Dim phone As String = txtRxPhone.Text.Trim()
            Dim email As String = txtRxEmail.Text.Trim()
            Dim rxNumber As String = txtRxNumber.Text.Trim()
            Dim notes As String = txtRxNotes.Text.Trim()

            Dim jsonPayload As String = String.Format(
                "{{""FormType"":""Prescription Refill/Transfer"",""FullName"":""{0}"",""Phone"":""{1}"",""Email"":""{2}"",""PrescriptionNo"":""{3}"",""Notes"":""{4}""}}",
                SanitizeJson(fullName), SanitizeJson(phone), SanitizeJson(email), SanitizeJson(rxNumber), SanitizeJson(notes))

            SaveBookingLocally("Prescription Refill/Transfer", fullName, phone, email, "", rxNumber, "", notes)
            SaveBookingToAccessDB("Prescription Refill/Transfer", fullName, phone, email, "", rxNumber, "", notes)

            SendToGoogleSheet(jsonPayload)

            pnlMessage.CssClass = "alert alert-success"
            lblStatusMessage.Text = "<strong>Prescription Request Received!</strong> We are processing your prescription request."
            ClearRxForm()
            pnlMessage.Visible = True

        Catch ex As Exception
            pnlMessage.CssClass = "alert alert-danger"
            lblStatusMessage.Text = "Error submitting prescription: " & Server.HtmlEncode(ex.Message)
            pnlMessage.Visible = True
        End Try
    End Sub

    Private Sub SaveBookingLocally(ByVal formType As String, ByVal fullName As String, ByVal phone As String, ByVal email As String, ByVal serviceType As String, ByVal rxNo As String, ByVal preferredDate As String, ByVal notes As String)
        ' Handled centrally in BookingDatabase
    End Sub

    Private Sub SaveBookingToAccessDB(ByVal formType As String, ByVal fullName As String, ByVal phone As String, ByVal email As String, ByVal serviceType As String, ByVal rxNo As String, ByVal preferredDate As String, ByVal notes As String)
        BookingDatabase.SaveBooking(Server, formType, fullName, phone, email, serviceType, rxNo, preferredDate, notes)
    End Sub

    Private Function SendToGoogleSheet(ByVal jsonString As String) As Boolean
        Dim googleSheetUrl As String = WebConfigurationManager.AppSettings("GoogleSheetWebAppUrl")
        If String.IsNullOrEmpty(googleSheetUrl) OrElse googleSheetUrl.Contains("EXAMPLE_KEY") Then
            Return False
        End If

        Try
            Dim request As HttpWebRequest = CType(WebRequest.Create(googleSheetUrl), HttpWebRequest)
            request.Method = "POST"
            request.ContentType = "application/json"
            request.Timeout = 10000
            request.AllowAutoRedirect = True

            Dim byteArray As Byte() = Encoding.UTF8.GetBytes(jsonString)
            request.ContentLength = byteArray.Length

            Using dataStream As Stream = request.GetRequestStream()
                dataStream.Write(byteArray, 0, byteArray.Length)
            End Using

            Using response As HttpWebResponse = CType(request.GetResponse(), HttpWebResponse)
                Using reader As New StreamReader(response.GetResponseStream())
                    Dim responseText As String = reader.ReadToEnd()
                    Return responseText.Contains("success")
                End Using
            End Using
        Catch ex As Exception
            Return False
        End Try
    End Function

    Private Function SanitizeCsv(ByVal input As String) As String
        If String.IsNullOrEmpty(input) Then Return ""
        Return input.Replace("""", """""")
    End Function

    Private Function SanitizeJson(ByVal input As String) As String
        If String.IsNullOrEmpty(input) Then Return ""
        Return input.Replace("\", "\\").Replace("""", "\""").Replace(vbCrLf, " ").Replace(vbCr, " ").Replace(vbLf, " ")
    End Function

    Private Sub ClearBookingForm()
        If txtBookingName IsNot Nothing Then txtBookingName.Text = ""
        If txtBookingPhone IsNot Nothing Then txtBookingPhone.Text = ""
        If txtBookingEmail IsNot Nothing Then txtBookingEmail.Text = ""
        If txtBookingDate IsNot Nothing Then txtBookingDate.Text = ""
        If txtBookingNotes IsNot Nothing Then txtBookingNotes.Text = ""
    End Sub

    Private Sub ClearRxForm()
        If txtRxName IsNot Nothing Then txtRxName.Text = ""
        If txtRxPhone IsNot Nothing Then txtRxPhone.Text = ""
        If txtRxEmail IsNot Nothing Then txtRxEmail.Text = ""
        If txtRxNumber IsNot Nothing Then txtRxNumber.Text = ""
        If txtRxNotes IsNot Nothing Then txtRxNotes.Text = ""
    End Sub
End Class
