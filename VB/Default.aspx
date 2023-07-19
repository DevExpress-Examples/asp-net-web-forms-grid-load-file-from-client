<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>How to load a file on the callback</title>
    <script type="text/javascript">
        function OnCustomButtonClick(s, e) {
            var keyValue = gridView.GetRowKey(e.visibleIndex);
            if (e.buttonID == 'clientRedirect') {
                DoClientRedirect(keyValue);
            }
            else if (e.buttonID == 'callbackRedirect') {
                DoCallbackRedirect(keyValue);
            }
        }

        function DoClientRedirect(value) {
            if (value == "9") {
                alert('Sorry, the picture can\'t be loaded');
            }
            else {
                window.location.href = 'Default.aspx?ID=' + value;
            }
        }

        function DoCallbackRedirect(value) {
            callback.PerformCallback(value);
        }

        function OnCallbackComplete(s, e) {
            if (e.result == "NOT_ALLOWED") {
                alert('Sorry, the picture can\'t be loaded');
            }
            else {
                window.location.href = e.result;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxCallback ID="ASPxCallback1" runat="server" ClientInstanceName="callback" OnCallback="ASPxCallback1_Callback">
            <ClientSideEvents CallbackComplete="OnCallbackComplete" />
        </dx:ASPxCallback>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridView" 
                         DataSourceID="AccessDataSource1" KeyFieldName="EmployeeID">
            <ClientSideEvents CustomButtonClick="OnCustomButtonClick"/>
            <Columns>
                <dx:GridViewCommandColumn >
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="clientRedirect" Text="Load photo" />
                        <dx:GridViewCommandColumnCustomButton ID="callbackRedirect" Text="Load photo on callback" />
                    </CustomButtons>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="EmployeeID" />
                <dx:GridViewDataTextColumn FieldName="LastName" />
                <dx:GridViewDataTextColumn FieldName="FirstName" />
                <dx:GridViewDataDateColumn FieldName="BirthDate" />
                <dx:GridViewDataTextColumn FieldName="Address" />
            </Columns>
        </dx:ASPxGridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [BirthDate], [Address], [Photo] FROM [Employees]">
        </asp:AccessDataSource>
    </form>
</body>
</html>
