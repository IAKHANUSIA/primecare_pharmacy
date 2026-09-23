<%@ WebHandler Language="VB" Class="UploadLicense" %>

Imports System
Imports System.Web
Imports System.IO

Public Class UploadLicense : Implements IHttpHandler
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        context.Response.ContentType = "application/json"
        
        Try
            If context.Request.Files.Count > 0 Then
                Dim file As HttpPostedFile = context.Request.Files(0)
                If file IsNot Nothing AndAlso file.ContentLength > 0 Then
                    Dim locParam As String = context.Request.QueryString("loc")
                    If String.IsNullOrEmpty(locParam) Then
                        locParam = context.Request.Form("loc")
                    End If

                    Dim ext As String = Path.GetExtension(file.FileName).ToLower()
                    If String.IsNullOrEmpty(ext) Then ext = ".pdf"

                    Dim targetBaseName As String = "pharmacy_license"
                    Dim locName As String = "General"

                    If locParam = "1" OrElse locParam = "windermere" Then
                        targetBaseName = "pharmacy_license_windermere"
                        locName = "Windermere"
                    ElseIf locParam = "2" OrElse locParam = "leduc" Then
                        targetBaseName = "pharmacy_license_leduc"
                        locName = "Leduc"
                    ElseIf locParam = "3" OrElse locParam = "stalbert" Then
                        targetBaseName = "pharmacy_license_stalbert"
                        locName = "St. Albert"
                    End If

                    Dim docsDir As String = context.Server.MapPath("~/docs/")
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

                    Dim targetFileName As String = targetBaseName & ext
                    Dim savePath As String = Path.Combine(docsDir, targetFileName)
                    file.SaveAs(savePath)

                    Dim ts As String = DateTime.Now.Ticks.ToString()
                    context.Response.Write("{""success"":true, ""file"":""" & targetFileName & "?v=" & ts & """, ""message"":""College approved letter uploaded and saved successfully for " & locName & " location (" & targetFileName & ")!""}")
                    Return
                End If
            End If
            context.Response.Write("{""success"":false, ""message"":""No file selected.""}")
        Catch ex As Exception
            context.Response.Write("{""success"":false, ""message"":""" & HttpUtility.JavaScriptStringEncode(ex.Message) & """}")
        End Try
    End Sub

    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property
End Class
