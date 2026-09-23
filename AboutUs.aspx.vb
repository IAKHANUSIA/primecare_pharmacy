Imports System
Imports System.Web.UI
Imports PrimecarePharmacy

Partial Public Class AboutUsPage
    Inherits Page

    Public Property SelectedLocation As PharmacyConfig.PharmacyLocation

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Dim locParam As String = Request.QueryString("loc")
        If String.IsNullOrEmpty(locParam) Then
            locParam = Request.QueryString("location")
        End If

        SelectedLocation = PharmacyConfig.GetLocationFromQuery(locParam)
    End Sub
End Class
