using System;
using System.IO;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        if (Request["ID"] != null)
            SendFile(Request["ID"]);
    }
    private void SendFile(string param) {
        string fileName = "Photos/" + param + ".png";
        string filePath = Server.MapPath(fileName);
        if (!File.Exists(filePath)) {
            Response.SuppressContent = false;
            Response.Write("No file is found");
            Response.End();
            return;
        }
        Response.AddHeader("Content-Disposition", "attachment; filename=" + Request["ID"] + ".png");
        Response.ContentType = "image/x-png";
        Response.TransmitFile(filePath);
        Response.End();
    }
    protected void ASPxCallback1_Callback(object source, CallbackEventArgs e) {
        if (e.Parameter == "9") {
            e.Result = "NOT_ALLOWED";
        }
        else {
            e.Result = string.Format("Default.aspx?ID={0}", e.Parameter);
        }
    }
}
