Imports System
Imports System.Web.UI

Partial Public Class DiabetesManagementPage
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
    End Sub

    Protected Sub btnSubmitBooking_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSubmitBooking.Click
        Try
            Dim fullName As String = txtBookingName.Text.Trim()
            Dim phone As String = txtBookingPhone.Text.Trim()
            Dim email As String = txtBookingEmail.Text.Trim()
            Dim serviceType As String = If(ddlServiceType IsNot Nothing, ddlServiceType.SelectedValue, "Diabetes Management")
            Dim preferredDate As String = txtBookingDate.Text.Trim()
            Dim notes As String = txtBookingNotes.Text.Trim()

            BookingDatabase.SaveBooking(Server, "Appointment Booking", fullName, phone, email, serviceType, "", preferredDate, notes)

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

            BookingDatabase.SaveBooking(Server, "Prescription Refill/Transfer", fullName, phone, email, "Diabetes Management", rxNumber, "", notes)

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
