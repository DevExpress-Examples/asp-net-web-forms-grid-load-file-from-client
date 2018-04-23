Imports System
Imports System.IO
Imports DevExpress.Web

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If Request("ID") IsNot Nothing Then
            SendFile(Request("ID"))
        End If
    End Sub
    Private Sub SendFile(ByVal param As String)
        Dim fileName As String = "Photos/" & param & ".png"
        Dim filePath As String = Server.MapPath(fileName)
        If Not File.Exists(filePath) Then
            Response.SuppressContent = False
            Response.Write("No file is found")
            Response.End()
            Return
        End If
        Response.AddHeader("Content-Disposition", "attachment; filename=" & Request("ID") & ".png")
        Response.ContentType = "image/x-png"
        Response.TransmitFile(filePath)
        Response.End()
    End Sub
    Protected Sub ASPxCallback1_Callback(ByVal source As Object, ByVal e As CallbackEventArgs)
        If e.Parameter = "9" Then
            e.Result = "NOT_ALLOWED"
        Else
            e.Result = String.Format("Default.aspx?ID={0}", e.Parameter)
        End If
    End Sub
End Class
