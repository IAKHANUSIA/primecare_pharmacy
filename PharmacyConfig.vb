Imports System
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.Configuration

''' <summary>
''' Centralized Configuration Class for Primecare Pharmacy and Travel Clinic.
''' Manages site-wide variables, contact information, and 3 Edmonton Pharmacy locations.
''' Modifying values in this file automatically updates them across all web pages.
''' </summary>
Public Class PharmacyConfig
    ' Global Brand Settings
    Public Shared Property BrandName As String = "Primecare Pharmacy"
    Public Shared Property FullBrandName As String = "Primecare Pharmacy & Travel Clinic"
    Public Shared Property Tagline As String = "Your health is our focus"
    Public Shared Property MainEmail As String = "info@primecarepharmacy.ca"
    Public Shared Property DefaultCity As String = "Edmonton, AB"

    ' Global Pharmacist, Proprietor & Practice Permit Settings
    Public Shared Property DefaultPharmacistName As String = "Sakibbhai Khanusia"
    Public Shared Property DefaultProprietorName As String = "Sakibbhai Khanusia"
    Public Shared Property DefaultPracticePermitNumber As String = "14544"
    Public Shared Property DefaultLicenseFileUrl As String = "docs/pharmacy_license.html"

    ' Admin Credentials for Booking Reports Portal
    Public Shared Property AdminUsername As String = "admin"
    Public Shared Property AdminPassword As String = "admin123"

    ' Global Shortcuts for easy access
    Public Shared ReadOnly Property PharmacistName As String
        Get
            Return DefaultPharmacistName
        End Get
    End Property

    Public Shared ReadOnly Property ProprietorName As String
        Get
            Return DefaultProprietorName
        End Get
    End Property

    Public Shared ReadOnly Property PracticePermitNumber As String
        Get
            Return DefaultPracticePermitNumber
        End Get
    End Property

    Public Shared ReadOnly Property LicenseFileUrl As String
        Get
            Return DefaultLicenseFileUrl
        End Get
    End Property

    ' Class representing an individual Pharmacy Location
    Public Class PharmacyLocation
        Public Property Id As Integer
        Public Property Name As String
        Public Property ShortName As String
        Public Property ChipDisplay As String
        Public Property Subtitle As String
        Public Property Address As String
        Public Property CityStateZip As String
        Public Property Phone As String
        Public Property RawPhone As String
        Public Property Fax As String
        Public Property Email As String
        Public Property HoursWeekdays As String
        Public Property HoursSaturday As String
        Public Property HoursSunday As String
        Public Property GoogleMapUrl As String
        Public Property IsPrimary As Boolean
        Public Property PharmacistName As String
        Public Property ProprietorName As String
        Public Property PracticePermitNumber As String
        Public Property LicenseFileUrl As String
    End Class

    ' Pharmacy Location 1 - Windermere
    Public Shared Property Location1 As New PharmacyLocation With {
        .Id = 1,
        .Name = "Primecare Pharmacy - Windermere",
        .ShortName = "Windermere",
        .ChipDisplay = "Windermere: +1 (780) 435-3030",
        .Subtitle = "5594 Windermere Blvd",
        .Address = "5594 Windermere Blvd",
        .CityStateZip = "Edmonton, AB T6W 2Z8",
        .Phone = "+1 (780) 435-3030",
        .RawPhone = "17804353030",
        .Fax = "+1 (780) 435-2930",
        .Email = "primecarepharmacy5594@gmail.com",
        .HoursWeekdays = "Mon - Fri: 9:30 AM - 6:30 PM",
        .HoursSaturday = "Sat: 10:00 AM - 2:00 PM",
        .HoursSunday = "Sun & Holidays: Closed",
        .GoogleMapUrl = "https://maps.google.com/?q=5594+Windermere+Blvd+Edmonton+AB",
        .IsPrimary = False,
        .PharmacistName = "Sarafaraz Shaikh",
        .ProprietorName = "Sarafaraz Shaikh",
        .PracticePermitNumber = "14786",
        .LicenseFileUrl = "docs/pharmacy_license.html?loc=1"
    }

    ' Pharmacy Location 2 - Leduc / Primary
    Public Shared Property Location2 As New PharmacyLocation With {
        .Id = 2,
        .Name = "Primecare Pharmacy - Leduc",
        .ShortName = "Leduc",
        .ChipDisplay = "Leduc: +1 (780) 769-1090",
        .Subtitle = "3610 Rollyview Rd",
        .Address = "3610 Rollyview Rd, Unit 103",
        .CityStateZip = "Leduc, AB T9E 4V9",
        .Phone = "+1 (780) 769-1090",
        .RawPhone = "17807691090",
        .Fax = "+1 (780) 435-3031",
        .Email = "leducprimecarepharmacy@gmail.com",
        .HoursWeekdays = "Mon - Fri: 9:30 AM - 6:30 PM",
        .HoursSaturday = "Sat: 10:00 AM - 3:00 PM",
        .HoursSunday = "Sun & Holidays: Closed",
        .GoogleMapUrl = "https://maps.google.com/?q=3610+Rollyview+Rd+Unit+103+Leduc+AB",
        .IsPrimary = True,
        .PharmacistName = "Sakibbhai Khanusia",
        .ProprietorName = "Sakibbhai Khanusia",
        .PracticePermitNumber = "14544",
        .LicenseFileUrl = "docs/pharmacy_license.html?loc=2"
    }

    ' Pharmacy Location 3 - St. Albert
    Public Shared Property Location3 As New PharmacyLocation With {
        .Id = 3,
        .Name = "Primecare Pharmacy - St. Albert",
        .ShortName = "St. Albert",
        .ChipDisplay = "St. Albert: +1 (780) 544-0626",
        .Subtitle = "1115 St. Albert Trail",
        .Address = "1115 St. Albert Trail, Unit 670",
        .CityStateZip = "St. Albert, AB T8N 7X6",
        .Phone = "+1 (780) 544-0626",
        .RawPhone = "17805440626",
        .Fax = "+1 (778) 654-0039",
        .Email = "stalbertprimecarepharmacy@gmail.com",
        .HoursWeekdays = "Mon - Fri: 9:00 AM - 6:30 PM",
        .HoursSaturday = "Sat: 10:00 AM - 4:00 PM",
        .HoursSunday = "Sun & Holidays: Closed",
        .GoogleMapUrl = "https://maps.google.com/?q=1115+St+Albert+Trl+Unit+670+AB",
        .IsPrimary = False,
        .PharmacistName = "Chirag Patel",
        .ProprietorName = "Chirag Patel",
        .PracticePermitNumber = "15544",
        .LicenseFileUrl = "docs/pharmacy_license.html?loc=3"
    }

    ''' <summary>
    ''' Returns all 3 Edmonton Pharmacy Locations
    ''' </summary>
    Public Shared Function GetAllLocations() As List(Of PharmacyLocation)
        Return New List(Of PharmacyLocation) From {Location1, Location2, Location3}
    End Function

    ''' <summary>
    ''' Gets Location by ID (1, 2, or 3)
    ''' </summary>
    Public Shared Function GetLocationById(ByVal id As Integer) As PharmacyLocation
        Select Case id
            Case 2
                Return Location2
            Case 3
                Return Location3
            Case Else
                Return Location1
        End Select
    End Function

    ''' <summary>
    ''' Resolves PharmacyLocation from QueryString parameter (e.g. loc=1, loc=2, loc=3 or location name)
    ''' </summary>
    Public Shared Function GetLocationFromQuery(ByVal queryParam As String) As PharmacyLocation
        If String.IsNullOrEmpty(queryParam) Then Return Location1
        Dim locId As Integer = 1
        If Integer.TryParse(queryParam, locId) Then
            Return GetLocationById(locId)
        End If
        If queryParam.ToLower().Contains("leduc") Then Return Location2
        If queryParam.ToLower().Contains("albert") Then Return Location3
        Return Location1
    End Function

    ''' <summary>
    ''' Gets primary location phone number
    ''' </summary>
    Public Shared ReadOnly Property PrimaryPhone As String
        Get
            Return Location1.Phone
        End Get
    End Property

    ''' <summary>
    ''' Gets primary location raw phone number for tel links
    ''' </summary>
    Public Shared ReadOnly Property PrimaryRawPhone As String
        Get
            Return Location1.RawPhone
        End Get
    End Property

    ''' <summary>
    ''' Service Item Data Model for site navigation
    ''' </summary>
    Public Class ServiceItem
        Public Property Name As String
        Public Property RelativePath As String
        Public Property Icon As String
    End Class

    ''' <summary>
    ''' Returns complete list of all 10 services provided across Edmonton locations
    ''' </summary>
    Public Shared Function GetAllServices() As List(Of ServiceItem)
        Return New List(Of ServiceItem) From {
            New ServiceItem With {.Name = "Diabetes Management", .RelativePath = "services/diabetes-management/", .Icon = "images/icon-diabetes.svg"},
            New ServiceItem With {.Name = "Injection / Travel Health", .RelativePath = "services/injection-travel-health/", .Icon = "images/icon-injection.svg"},
            New ServiceItem With {.Name = "Smoking Cessation Support", .RelativePath = "services/smoking-cessation-support/", .Icon = "images/smoking_cessation.jpg"},
            New ServiceItem With {.Name = "Asthma/COPD Management", .RelativePath = "services/asthma-copd-management/", .Icon = "images/asthma_copd_management.jpg"},
            New ServiceItem With {.Name = "Heart Health", .RelativePath = "services/heart-health/", .Icon = "images/icon-medmgmt.svg"},
            New ServiceItem With {.Name = "Weight Management", .RelativePath = "services/weight-management/", .Icon = "images/weight_management.jpg"},
            New ServiceItem With {.Name = "Medication Compounding", .RelativePath = "services/medication-compounding/", .Icon = "images/medication_compounding.jpg"},
            New ServiceItem With {.Name = "Home Health Care", .RelativePath = "services/home-health-care/", .Icon = "images/icon-homehealth.svg"},
            New ServiceItem With {.Name = "Prescriptions", .RelativePath = "services/prescriptions/", .Icon = "images/icon-prescriptions.svg"},
            New ServiceItem With {.Name = "Medication Reviews", .RelativePath = "services/medication-reviews/", .Icon = "images/icon-medreviews.svg"}
        }
    End Function
End Class

''' <summary>
''' Centralized Database and CSV Logging Helper for Booking Data in VB.NET.
''' Handles insertion into MS Access Database (App_Data/PrimecareBookings.mdb) via OleDbCommand
''' and server-side CSV fallback logging (App_Data/Bookings_Log.csv).
''' </summary>
Public Class BookingDatabase
    ''' <summary>
    ''' Saves booking data to MS Access Database and CSV log using VB OleDb commands.
    ''' </summary>
    Public Shared Function SaveBooking(ByVal server As System.Web.HttpServerUtility, ByVal formType As String, ByVal fullName As String, ByVal phone As String, ByVal email As String, ByVal serviceType As String, ByVal rxNo As String, ByVal preferredDate As String, ByVal notes As String) As Boolean
        ' Ignore completely empty submissions
        If String.IsNullOrWhiteSpace(fullName) AndAlso String.IsNullOrWhiteSpace(phone) AndAlso String.IsNullOrWhiteSpace(email) AndAlso String.IsNullOrWhiteSpace(rxNo) Then
            Return False
        End If

        ' 1. Save to App_Data/Bookings_Log.csv
        Try
            Dim logPath As String = server.MapPath("~/App_Data/Bookings_Log.csv")
            Dim dirPath As String = System.IO.Path.GetDirectoryName(logPath)
            If Not System.IO.Directory.Exists(dirPath) Then
                System.IO.Directory.CreateDirectory(dirPath)
            End If

            Dim fileExists As Boolean = System.IO.File.Exists(logPath)
            Using writer As New System.IO.StreamWriter(logPath, True, System.Text.Encoding.UTF8)
                If Not fileExists Then
                    writer.WriteLine("""Timestamp"",""FormType"",""FullName"",""Phone"",""Email"",""ServiceType"",""PrescriptionNo"",""PreferredDate"",""Notes""")
                End If
                Dim timestamp As String = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")
                writer.WriteLine(String.Format("""{0}"",""{1}"",""{2}"",""{3}"",""{4}"",""{5}"",""{6}"",""{7}"",""{8}""",
                    SanitizeCsv(timestamp), SanitizeCsv(formType), SanitizeCsv(fullName), SanitizeCsv(phone), SanitizeCsv(email), SanitizeCsv(serviceType), SanitizeCsv(rxNo), SanitizeCsv(preferredDate), SanitizeCsv(notes)))
            End Using
        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine("CSV Save Error: " & ex.Message)
        End Try

        ' 2. Save to MS Access Database (App_Data/PrimecareBookings.mdb)
        Dim dbSaved As Boolean = False
        Try
            Dim dbPath As String = server.MapPath("~/App_Data/PrimecareBookings.mdb")
            Dim dbDir As String = System.IO.Path.GetDirectoryName(dbPath)
            If Not System.IO.Directory.Exists(dbDir) Then
                System.IO.Directory.CreateDirectory(dbDir)
            End If

            Dim connectionStrings As String() = {
                "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dbPath & ";",
                "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & dbPath & ";",
                "Provider=Microsoft.ACE.OLEDB.15.0;Data Source=" & dbPath & ";",
                "Provider=Microsoft.ACE.OLEDB.16.0;Data Source=" & dbPath & ";"
            }

            Dim query As String = "INSERT INTO Bookings (SubmissionTime, FormType, FullName, Phone, Email, ServiceType, PrescriptionNo, PreferredDate, Notes) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"

            For Each connStr As String In connectionStrings
                Try
                    Using conn As New System.Data.OleDb.OleDbConnection(connStr)
                        Using cmd As New System.Data.OleDb.OleDbCommand(query, conn)
                            cmd.Parameters.AddWithValue("@SubmissionTime", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
                            cmd.Parameters.AddWithValue("@FormType", If(formType, ""))
                            cmd.Parameters.AddWithValue("@FullName", If(fullName, ""))
                            cmd.Parameters.AddWithValue("@Phone", If(phone, ""))
                            cmd.Parameters.AddWithValue("@Email", If(email, ""))
                            cmd.Parameters.AddWithValue("@ServiceType", If(serviceType, ""))
                            cmd.Parameters.AddWithValue("@PrescriptionNo", If(rxNo, ""))
                            cmd.Parameters.AddWithValue("@PreferredDate", If(preferredDate, ""))
                            cmd.Parameters.AddWithValue("@Notes", If(notes, ""))

                            conn.Open()
                            cmd.ExecuteNonQuery()
                            dbSaved = True
                            Exit For
                        End Using
                    End Using
                Catch ex As Exception
                    System.Diagnostics.Debug.WriteLine("OleDb Connection Failed (" & connStr & "): " & ex.Message)
                End Try
            Next
        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine("Access DB Error: " & ex.Message)
        End Try

        Return dbSaved
    End Function

    Private Shared Function SanitizeCsv(ByVal input As String) As String
        If String.IsNullOrEmpty(input) Then Return ""
        Return input.Replace("""", """""")
    End Function
End Class

''' <summary>
''' Centralized User Master Database Helper for MS Access Database (App_Data/PrimecareBookings.mdb).
''' Manages User Authentication, User Creation, and Role Validation.
''' </summary>
Public Class UserDatabase
    ''' <summary>
    ''' Validates username and password against Users table in Access DB, with fallback to PharmacyConfig credentials.
    ''' </summary>
    Public Shared Function ValidateUser(ByVal server As System.Web.HttpServerUtility, ByVal username As String, ByVal password As String, ByRef outFullName As String, ByRef outRole As String) As Boolean
        If String.IsNullOrWhiteSpace(username) OrElse String.IsNullOrWhiteSpace(password) Then
            Return False
        End If

        Dim authenticated As Boolean = False
        outFullName = ""
        outRole = ""

        ' 1. Check Access Database Users Table
        Try
            Dim dbPath As String = server.MapPath("~/App_Data/PrimecareBookings.mdb")
            If System.IO.File.Exists(dbPath) Then
                Dim connectionStrings As String() = {
                    "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dbPath & ";",
                    "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & dbPath & ";",
                    "Provider=Microsoft.ACE.OLEDB.15.0;Data Source=" & dbPath & ";",
                    "Provider=Microsoft.ACE.OLEDB.16.0;Data Source=" & dbPath & ";"
                }

                ' Ensure Users table exists
                EnsureUsersTable(server)

                Dim query As String = "SELECT FullName, UserRole FROM Users WHERE Username = ? AND UserPassword = ?"

                For Each connStr As String In connectionStrings
                    Try
                        Using conn As New System.Data.OleDb.OleDbConnection(connStr)
                            Using cmd As New System.Data.OleDb.OleDbCommand(query, conn)
                                cmd.Parameters.AddWithValue("@Username", username.Trim())
                                cmd.Parameters.AddWithValue("@UserPassword", password.Trim())

                                conn.Open()
                                Using reader As System.Data.OleDb.OleDbDataReader = cmd.ExecuteReader()
                                    If reader.Read() Then
                                        outFullName = Convert.ToString(reader("FullName"))
                                        outRole = Convert.ToString(reader("UserRole"))
                                        authenticated = True
                                        Exit For
                                    End If
                                End Using
                            End Using
                        End Using
                    Catch ex As Exception
                        System.Diagnostics.Debug.WriteLine("User OleDb Error (" & connStr & "): " & ex.Message)
                    End Try
                Next
            End If
        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine("ValidateUser DB Exception: " & ex.Message)
        End Try

        ' 2. Fallback to PharmacyConfig Admin Credentials if DB match not found
        If Not authenticated Then
            If String.Equals(username.Trim(), PharmacyConfig.AdminUsername, StringComparison.OrdinalIgnoreCase) AndAlso String.Equals(password.Trim(), PharmacyConfig.AdminPassword) Then
                outFullName = "System Administrator"
                outRole = "Admin"
                authenticated = True
            End If
        End If

        Return authenticated
    End Function

    ''' <summary>
    ''' Ensures Users table exists in Access Database and contains default admin record.
    ''' </summary>
    Public Shared Sub EnsureUsersTable(ByVal server As System.Web.HttpServerUtility)
        Try
            Dim dbPath As String = server.MapPath("~/App_Data/PrimecareBookings.mdb")
            If Not System.IO.File.Exists(dbPath) Then Exit Sub

            Dim connectionStrings As String() = {
                "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dbPath & ";",
                "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & dbPath & ";",
                "Provider=Microsoft.ACE.OLEDB.15.0;Data Source=" & dbPath & ";",
                "Provider=Microsoft.ACE.OLEDB.16.0;Data Source=" & dbPath & ";"
            }

            For Each connStr As String In connectionStrings
                Try
                    Using conn As New System.Data.OleDb.OleDbConnection(connStr)
                        conn.Open()

                        ' Try create Users table
                        Dim createSql As String = "CREATE TABLE Users (UserID AUTOINCREMENT PRIMARY KEY, Username VARCHAR(50), UserPassword VARCHAR(100), FullName VARCHAR(100), Email VARCHAR(100), UserRole VARCHAR(30), IsActive BIT, CreatedDate VARCHAR(50))"
                        Using cmdCreate As New System.Data.OleDb.OleDbCommand(createSql, conn)
                            Try
                                cmdCreate.ExecuteNonQuery()
                            Catch ex As Exception
                                ' Table already exists
                            End Try
                        End Using

                        ' Insert default admin if missing
                        Dim chkSql As String = "SELECT COUNT(*) FROM Users WHERE Username = 'admin'"
                        Using cmdChk As New System.Data.OleDb.OleDbCommand(chkSql, conn)
                            Dim count As Integer = Convert.ToInt32(cmdChk.ExecuteScalar())
                            If count = 0 Then
                                Dim insSql As String = "INSERT INTO Users (Username, UserPassword, FullName, Email, UserRole, IsActive, CreatedDate) VALUES ('admin', 'admin123', 'System Administrator', 'admin@primecarepharmacy.ca', 'Admin', True, '2026-09-20 14:30:00')"
                                Using cmdIns As New System.Data.OleDb.OleDbCommand(insSql, conn)
                                    cmdIns.ExecuteNonQuery()
                                End Using
                            End If
                        End Using

                        Exit For
                    End Using
                Catch ex As Exception
                    ' Continue to next provider
                End Try
            Next
        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine("EnsureUsersTable Exception: " & ex.Message)
        End Try
    End Sub
End Class

