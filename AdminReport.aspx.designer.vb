Option Strict On
Option Explicit On

Partial Public Class AdminReport
    Protected WithEvents form1 As Global.System.Web.UI.HtmlControls.HtmlForm
    Protected WithEvents btnExport As Global.System.Web.UI.WebControls.Button
    Protected WithEvents litTotalCount As Global.System.Web.UI.WebControls.Literal
    Protected WithEvents litBookingsCount As Global.System.Web.UI.WebControls.Literal
    Protected WithEvents litRefillsCount As Global.System.Web.UI.WebControls.Literal
    Protected WithEvents litUploadsCount As Global.System.Web.UI.WebControls.Literal
    Protected WithEvents txtSearch As Global.System.Web.UI.WebControls.TextBox
    Protected WithEvents txtStartDate As Global.System.Web.UI.WebControls.TextBox
    Protected WithEvents txtEndDate As Global.System.Web.UI.WebControls.TextBox
    Protected WithEvents ddlServiceFilter As Global.System.Web.UI.WebControls.DropDownList
    Protected WithEvents ddlFormFilter As Global.System.Web.UI.WebControls.DropDownList
    Protected WithEvents btnFilter As Global.System.Web.UI.WebControls.Button
    Protected WithEvents btnReset As Global.System.Web.UI.WebControls.Button
    Protected WithEvents btnLogout As Global.System.Web.UI.WebControls.Button
    Protected WithEvents gvReport As Global.System.Web.UI.WebControls.GridView
End Class
