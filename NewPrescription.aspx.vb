Imports System
Imports System.Data
Imports System.Data.OleDb
Imports System.IO
Imports System.Net
Imports System.Text
Imports System.Web.Configuration
Imports System.Web.UI

Partial Public Class NewPrescriptionPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
    End Sub

    Protected Sub btnSubmitNew_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSubmitNew.Click
        Try
            Dim firstName As String = txtFirstName.Text.Trim()
            Dim lastName As String = txtLastName.Text.Trim()
            Dim fullName As String = (firstName & " " & lastName).Trim()
            Dim email As String = txtEmail.Text.Trim()
            Dim phone As String = txtPhone.Text.Trim()
            Dim streetAddress As String = txtStreetAddress.Text.Trim()
            Dim city As String = txtCity.Text.Trim()
            Dim postalCode As String = txtPostalCode.Text.Trim()

            Dim originalFileName As String = ""
            Dim savedRelativePath As String = ""

            If fileInsurance IsNot Nothing AndAlso fileInsurance.HasFile Then
                Try
                    ' Ensure UploadDoc folder exists
                    Dim uploadFolder As String = Server.MapPath("~/UploadDoc")
                    If Not Directory.Exists(uploadFolder) Then
                        Directory.CreateDirectory(uploadFolder)
                    End If

                    originalFileName = Path.GetFileName(fileInsurance.FileName)
                    Dim cleanFileName As String = System.Text.RegularExpressions.Regex.Replace(originalFileName, "[^a-zA-Z0-9\.\-_]", "_")
                    Dim timestamp As String = DateTime.Now.ToString("yyyyMMdd_HHmmss_")
                    Dim uniqueFileName As String = timestamp & cleanFileName
                    Dim fullSavePath As String = Path.Combine(uploadFolder, uniqueFileName)

                    ' Save uploaded prescription file physically to UploadDoc directory
                    fileInsurance.SaveAs(fullSavePath)

                    savedRelativePath = "UploadDoc/" & uniqueFileName
                Catch exFile As Exception
                    System.Diagnostics.Debug.WriteLine("File Upload Save Error: " & exFile.Message)
                End Try
            End If

            Dim addressSummary As String = String.Format("{0}, {1}, {2}", streetAddress, city, postalCode)
            Dim fileStatus As String = If(Not String.IsNullOrEmpty(savedRelativePath), savedRelativePath, If(Not String.IsNullOrEmpty(originalFileName), originalFileName, "None"))
            Dim notesSummary As String = String.Format("Address: {0} | Uploaded File: {1}", addressSummary, fileStatus)

            Dim jsonPayload As String = String.Format(
                "{{""FormType"":""New Prescription"",""FullName"":""{0}"",""Phone"":""{1}"",""Email"":""{2}"",""ServiceType"":""{3}"",""Notes"":""{4}""}}",
                SanitizeJson(fullName),
                SanitizeJson(phone),
                SanitizeJson(email),
                SanitizeJson("New Prescription Upload"),
                SanitizeJson(notesSummary)
            )

            BookingDatabase.SaveBooking(Server, "New Prescription", fullName, phone, email, "New Prescription Upload", savedRelativePath, "", notesSummary)

            SendToGoogleSheet(jsonPayload)

            pnlSuccess.Visible = True
            ClearForm()

        Catch ex As Exception
            pnlSuccess.Visible = True
        End Try
    End Sub

    Private Sub SaveBookingLocally(ByVal formType As String, ByVal fullName As String, ByVal phone As String, ByVal email As String, ByVal serviceType As String, ByVal rxNo As String, ByVal preferredDate As String, ByVal notes As String)
        ' Handled centrally in BookingDatabase
    End Sub

    Private Sub SaveBookingToAccessDB(ByVal formType As String, ByVal fullName As String, ByVal phone As String, ByVal email As String, ByVal serviceType As String, ByVal rxNo As String, ByVal preferredDate As String, ByVal notes As String)
        BookingDatabase.SaveBooking(Server, formType, fullName, phone, email, serviceType, rxNo, preferredDate, notes)
    End Sub

    Private Function SanitizeCsv(ByVal input As String) As String
        If String.IsNullOrEmpty(input) Then Return ""
        Return input.Replace("""", """""")
    End Function

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
            System.Diagnostics.Debug.WriteLine("Google Sheets POST Error: " & ex.Message)
            Return False
        End Try
    End Function

    Private Function SanitizeJson(ByVal input As String) As String
        If String.IsNullOrEmpty(input) Then Return ""
        Return input.Replace("\", "\\").Replace("""", "\""").Replace(vbCrLf, " ").Replace(vbCr, " ").Replace(vbLf, " ")
    End Function

    Private Sub ClearForm()
        txtFirstName.Text = ""
        txtLastName.Text = ""
        txtEmail.Text = ""
        txtPhone.Text = ""
        txtStreetAddress.Text = ""
        txtCity.Text = ""
        txtPostalCode.Text = ""
    End Sub
End Class
