Imports System
Imports System.Web.UI

Partial Public Class AdminLogin
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' If already logged in, redirect straight to AdminReport.aspx
            If Session("IsAdminLoggedIn") IsNot Nothing AndAlso CBool(Session("IsAdminLoggedIn")) Then
                Response.Redirect("AdminReport.aspx")
            End If
        End If
    End Sub

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim username As String = txtUsername.Text.Trim()
        Dim password As String = txtPassword.Text.Trim()

        Dim fullName As String = ""
        Dim role As String = ""

        If UserDatabase.ValidateUser(Server, username, password, fullName, role) Then
            Session("IsAdminLoggedIn") = True
            Session("AdminUsername") = username
            Session("AdminFullName") = fullName
            Session("AdminRole") = role
            Response.Redirect("AdminReport.aspx")
        Else
            pnlError.Visible = True
            lblErrorMessage.Text = "Invalid admin username or password. Please try again."
        End If
    End Sub
End Class
