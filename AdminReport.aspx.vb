Imports System
Imports System.Data
Imports System.IO
Imports System.Text
Imports System.Web.UI
Imports System.Web.UI.WebControls

Partial Public Class AdminReport
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        ' Enforce Admin Login Protection
        If Session("IsAdminLoggedIn") Is Nothing OrElse Not CBool(Session("IsAdminLoggedIn")) Then
            Response.Redirect("AdminLogin.aspx")
            Exit Sub
        End If

        If Not IsPostBack Then
            LoadReportData()
        End If
    End Sub

    Protected Sub btnLogout_Click(ByVal sender As Object, ByVal e As EventArgs)
        Session.Abandon()
        Response.Redirect("AdminLogin.aspx")
    End Sub

    Private Sub LoadReportData()
        Dim dt As DataTable = GetBookingsDataTable()

        ' Calculate overall statistics
        litTotalCount.Text = dt.Rows.Count.ToString()

        Dim bookingsCount As Integer = 0
        Dim refillsCount As Integer = 0
        Dim uploadsCount As Integer = 0

        For Each row As DataRow In dt.Rows
            Dim formType As String = Convert.ToString(row("FormType"))
            If formType.Contains("Appointment") OrElse formType.Contains("Vaccination") Then
                bookingsCount += 1
            ElseIf formType.Contains("Refill") OrElse formType.Contains("Transfer") Then
                refillsCount += 1
            ElseIf formType.Contains("New Prescription") Then
                uploadsCount += 1
            End If
        Next

        litBookingsCount.Text = bookingsCount.ToString()
        litRefillsCount.Text = refillsCount.ToString()
        litUploadsCount.Text = uploadsCount.ToString()

        ' Apply date filters if specified
        Dim startDateStr As String = txtStartDate.Text.Trim()
        Dim endDateStr As String = txtEndDate.Text.Trim()
        Dim dtStart As DateTime
        Dim dtEnd As DateTime
        Dim hasStart As Boolean = DateTime.TryParse(startDateStr, dtStart)
        Dim hasEnd As Boolean = DateTime.TryParse(endDateStr, dtEnd)

        If hasStart OrElse hasEnd Then
            Dim filteredDt As DataTable = dt.Clone()
            For Each row As DataRow In dt.Rows
                Dim tsStr As String = Convert.ToString(row("Timestamp"))
                Dim prefStr As String = Convert.ToString(row("PreferredDate"))
                Dim rowDate As DateTime
                Dim validDate As Boolean = False

                If DateTime.TryParse(tsStr, rowDate) Then
                    validDate = True
                ElseIf DateTime.TryParse(prefStr, rowDate) Then
                    validDate = True
                End If

                If validDate Then
                    If hasStart AndAlso rowDate.Date < dtStart.Date Then Continue For
                    If hasEnd AndAlso rowDate.Date > dtEnd.Date Then Continue For
                    filteredDt.ImportRow(row)
                Else
                    filteredDt.ImportRow(row)
                End If
            Next
            dt = filteredDt
        End If

        ' Apply text & dropdown filters
        Dim dv As New DataView(dt)
        Dim filterExpr As New StringBuilder("1=1")

        Dim searchKeyword As String = txtSearch.Text.Trim().Replace("'", "''")
        If Not String.IsNullOrEmpty(searchKeyword) Then
            filterExpr.AppendFormat(" AND (FullName LIKE '%{0}%' OR Phone LIKE '%{0}%' OR Email LIKE '%{0}%' OR Notes LIKE '%{0}%')", searchKeyword)
        End If

        If ddlServiceFilter.SelectedValue <> "ALL" Then
            Dim selService As String = ddlServiceFilter.SelectedValue.Replace("'", "''")
            filterExpr.AppendFormat(" AND ServiceType LIKE '%{0}%'", selService)
        End If

        If ddlFormFilter.SelectedValue <> "ALL" Then
            Dim selForm As String = ddlFormFilter.SelectedValue.Replace("'", "''")
            filterExpr.AppendFormat(" AND FormType LIKE '%{0}%'", selForm)
        End If

        dv.RowFilter = filterExpr.ToString()
        gvReport.DataSource = dv
        gvReport.DataBind()
    End Sub

    Private Function GetBookingsDataTable() As DataTable
        Dim dt As New DataTable()
        dt.Columns.Add("Timestamp", GetType(String))
        dt.Columns.Add("FormType", GetType(String))
        dt.Columns.Add("FullName", GetType(String))
        dt.Columns.Add("Phone", GetType(String))
        dt.Columns.Add("Email", GetType(String))
        dt.Columns.Add("ServiceType", GetType(String))
        dt.Columns.Add("PrescriptionNo", GetType(String))
        dt.Columns.Add("PreferredDate", GetType(String))
        dt.Columns.Add("Notes", GetType(String))

        Dim logPath As String = Server.MapPath("~/App_Data/Bookings_Log.csv")
        If File.Exists(logPath) Then
            Try
                Dim lines As String() = File.ReadAllLines(logPath, Encoding.UTF8)
                For i As Integer = 1 To lines.Length - 1
                    Dim line As String = lines(i).Trim()
                    If String.IsNullOrWhiteSpace(line) Then Continue For

                    Dim parts As String() = ParseCsvLine(line)
                    If parts.Length >= 9 Then
                        Dim name As String = parts(2)
                        Dim phone As String = parts(3)
                        Dim email As String = parts(4)
                        ' Skip empty log lines if any
                        If String.IsNullOrWhiteSpace(name) AndAlso String.IsNullOrWhiteSpace(phone) AndAlso String.IsNullOrWhiteSpace(email) Then
                            Continue For
                        End If

                        Dim dr As DataRow = dt.NewRow()
                        dr("Timestamp") = parts(0)
                        dr("FormType") = parts(1)
                        dr("FullName") = name
                        dr("Phone") = phone
                        dr("Email") = email
                        dr("ServiceType") = parts(5)
                        dr("PrescriptionNo") = parts(6)
                        dr("PreferredDate") = parts(7)
                        dr("Notes") = parts(8)
                        dt.Rows.Add(dr)
                    End If
                Next
            Catch ex As Exception
                ' Fallback if error reading CSV
            End Try
        End If

        Return dt
    End Function

    Private Function ParseCsvLine(ByVal line As String) As String()
        Dim list As New System.Collections.Generic.List(Of String)()
        Dim inQuotes As Boolean = False
        Dim sb As New StringBuilder()

        For Each c As Char In line
            If c = """"c Then
                inQuotes = Not inQuotes
            ElseIf c = ","c AndAlso Not inQuotes Then
                list.Add(sb.ToString())
                sb.Clear()
            Else
                sb.Append(c)
            End If
        Next
        list.Add(sb.ToString())
        Return list.ToArray()
    End Function

    Protected Sub btnFilter_Click(ByVal sender As Object, ByVal e As EventArgs)
        LoadReportData()
    End Sub

    Protected Sub btnReset_Click(ByVal sender As Object, ByVal e As EventArgs)
        txtSearch.Text = ""
        txtStartDate.Text = ""
        txtEndDate.Text = ""
        ddlServiceFilter.SelectedIndex = 0
        ddlFormFilter.SelectedIndex = 0
        LoadReportData()
    End Sub

    Protected Sub btnExport_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim dt As DataTable = GetBookingsDataTable()

        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", "attachment;filename=Primecare_Booking_Report_" & DateTime.Now.ToString("yyyy-MM-dd") & ".csv")
        Response.Charset = ""
        Response.ContentType = "text/csv"

        Dim sb As New StringBuilder()
        sb.AppendLine("""Timestamp"",""FormType"",""FullName"",""Phone"",""Email"",""ServiceType"",""PrescriptionNo"",""PreferredDate"",""Notes""")

        For Each dr As DataRow In dt.Rows
            sb.AppendFormat("""{0}"",""{1}"",""{2}"",""{3}"",""{4}"",""{5}"",""{6}"",""{7}"",""{8}""" & vbCrLf,
                SanitizeCsv(dr("Timestamp").ToString()),
                SanitizeCsv(dr("FormType").ToString()),
                SanitizeCsv(dr("FullName").ToString()),
                SanitizeCsv(dr("Phone").ToString()),
                SanitizeCsv(dr("Email").ToString()),
                SanitizeCsv(dr("ServiceType").ToString()),
                SanitizeCsv(dr("PrescriptionNo").ToString()),
                SanitizeCsv(dr("PreferredDate").ToString()),
                SanitizeCsv(dr("Notes").ToString()))
        Next

        Response.Output.Write(sb.ToString())
        Response.Flush()
        Response.End()
    End Sub

    Public Function GetBadgeClass(ByVal formType As String) As String
        If String.IsNullOrEmpty(formType) Then Return "badge badge-blue"
        If formType.Contains("Appointment") OrElse formType.Contains("Vaccination") Then
            Return "badge badge-green"
        ElseIf formType.Contains("Refill") OrElse formType.Contains("Transfer") Then
            Return "badge badge-navy"
        ElseIf formType.Contains("New Prescription") Then
            Return "badge badge-orange"
        Else
            Return "badge badge-blue"
        End If
    End Function

    Public Function FormatNotesOrFile(ByVal rxNo As String, ByVal notes As String) As String
        Dim sb As New StringBuilder()

        If Not String.IsNullOrWhiteSpace(rxNo) Then
            If rxNo.Contains("UploadDoc/") OrElse rxNo.Contains(".pdf") OrElse rxNo.Contains(".jpeg") OrElse rxNo.Contains(".jpg") OrElse rxNo.Contains(".png") Then
                Dim rawPath As String = rxNo.Trim()
                Dim physicalPath As String = ""
                Try
                    Dim relPath As String = If(rawPath.StartsWith("~/") OrElse rawPath.StartsWith("/"), rawPath, "~/" & rawPath)
                    physicalPath = Server.MapPath(relPath)
                Catch ex As Exception
                End Try

                Dim fileExists As Boolean = Not String.IsNullOrEmpty(physicalPath) AndAlso File.Exists(physicalPath)
                Dim encodedUrl As String = HttpUtility.UrlPathEncode(rawPath)

                If fileExists Then
                    sb.AppendFormat("<a href='{0}' target='_blank' style='color:#0e75c5; font-weight:700; text-decoration:underline;'>[View Uploaded File]</a> ", encodedUrl)
                Else
                    sb.AppendFormat("<a href='{0}' target='_blank' style='color:#0e75c5; font-weight:700; text-decoration:underline;'>[View Uploaded File]</a> ", encodedUrl)
                End If
            Else
                sb.AppendFormat("<strong>Rx:</strong> {0} ", Server.HtmlEncode(rxNo))
            End If
        End If

        If Not String.IsNullOrWhiteSpace(notes) Then
            If notes.Contains("UploadDoc/") AndAlso (String.IsNullOrWhiteSpace(rxNo) OrElse Not rxNo.Contains("UploadDoc/")) Then
                ' Extract path if notes contains file reference
                Dim notePath As String = notes.Trim()
                If notePath.Contains("Uploaded File: ") Then
                    notePath = notePath.Substring(notePath.IndexOf("Uploaded File: ") + 15).Trim()
                End If
                Dim encodedNotesUrl As String = HttpUtility.UrlPathEncode(notePath)
                sb.AppendFormat("<div style='font-size:12px; margin-top:4px;'><a href='{0}' target='_blank' style='color:#0e75c5; font-weight:700; text-decoration:underline;'>[Attached Document]</a></div>", encodedNotesUrl)
            Else
                sb.AppendFormat("<div style='font-size:12px; color:#475569;'>{0}</div>", Server.HtmlEncode(notes))
            End If
        End If

        If sb.Length = 0 Then Return "<span style='color:#94a3b8;'>-</span>"
        Return sb.ToString()
    End Function

    Private Function SanitizeCsv(ByVal input As String) As String
        If String.IsNullOrEmpty(input) Then Return ""
        Return input.Replace("""", """""")
    End Function
End Class
