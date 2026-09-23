Imports System
Imports System.IO
Imports System.Web.UI

Partial Public Class AdminUpload
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        ' Enforce Admin Login Protection
        If Session("IsAdminLoggedIn") Is Nothing OrElse Not CBool(Session("IsAdminLoggedIn")) Then
            Response.Redirect("AdminLogin.aspx")
            Exit Sub
        End If
    End Sub

    Protected Sub btnLogout_Click(ByVal sender As Object, ByVal e As EventArgs)
        Session.Abandon()
        Response.Redirect("AdminLogin.aspx")
    End Sub

    Protected Sub btnUploadSubmit_Click(ByVal sender As Object, ByVal e As EventArgs)
        If fileLicense.HasFile Then
            Try
                Dim ext As String = Path.GetExtension(fileLicense.FileName).ToLower()
                If ext = ".pdf" OrElse ext = ".png" OrElse ext = ".jpg" OrElse ext = ".jpeg" Then
                    Dim locVal As String = ddlLocation.SelectedValue
                    Dim targetBaseName As String = "pharmacy_license_windermere"
                    Dim locName As String = "Windermere"

                    If locVal = "2" Then
                        targetBaseName = "pharmacy_license_leduc"
                        locName = "Leduc"
                    ElseIf locVal = "3" Then
                        targetBaseName = "pharmacy_license_stalbert"
                        locName = "St. Albert"
                    End If

                    Dim docsDir As String = Server.MapPath("~/docs/")
                    If Not Directory.Exists(docsDir) Then
                        Directory.CreateDirectory(docsDir)
                    End If

                    ' Clean up any previous conflicting file extensions for this location
                    Dim allowedExts As String() = {".pdf", ".png", ".jpg", ".jpeg"}
                    For Each oldExt As String In allowedExts
                        Dim oldFile As String = Path.Combine(docsDir, targetBaseName & oldExt)
                        If File.Exists(oldFile) Then
                            Try
                                File.Delete(oldFile)
                            Catch ex As Exception
                            End Try
                        End If
                    Next

                    ' Save uploaded file with its true extension
                    Dim targetFileName As String = targetBaseName & ext
                    Dim savePath As String = Path.Combine(docsDir, targetFileName)
                    fileLicense.SaveAs(savePath)

                    If ext = ".pdf" AndAlso targetBaseName = "pharmacy_license_windermere" Then
                        Dim primaryPdfPath As String = Path.Combine(docsDir, "pharmacy_license.pdf")
                        fileLicense.SaveAs(primaryPdfPath)
                    End If

                    Dim ts As String = DateTime.Now.Ticks.ToString()
                    pnlSuccess.Visible = True
                    pnlError.Visible = False
                    lblSuccessMessage.Text = String.Format("Official ACP Pharmacy License / College Approved Letter uploaded and published successfully for <strong>{0}</strong> location!<br/><a href='docs/{1}?v={2}' target='_blank' style='color:#15803d; font-weight:700; text-decoration:underline; display:inline-block; margin-top:6px;'>[Click here to view updated {0} document immediately]</a>", locName, targetFileName, ts)
                Else
                    pnlError.Visible = True
                    pnlSuccess.Visible = False
                    lblErrorMessage.Text = "Please select a valid document format (.pdf, .png, .jpg, .jpeg)."
                End If
            Catch ex As Exception
                pnlError.Visible = True
                pnlSuccess.Visible = False
                lblErrorMessage.Text = "Error uploading license file: " & ex.Message
            End Try
        Else
            pnlError.Visible = True
            pnlSuccess.Visible = False
            lblErrorMessage.Text = "Please select a file to upload first."
        End If
    End Sub
End Class
