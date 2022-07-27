<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Ch2.Ch7.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../ext-3.4.1/resources/css/ext-all.css" rel="stylesheet" />
    <script src="../ext-3.4.1/adapter/ext/ext-base.js"></script>
    <script src="../ext-3.4.1/ext-all.js"></script>
    <script>
        function sendAjax() {
            var form = document.getElementById("form1");
            var fd = new FormData(form);

            Ext.Ajax.request({
                url: 'Handler1.ashx',
                method: 'POST',
                params:fd,
                success: function (response, opts) {
                    var obj = Ext.decode(response.responseText);
                    console.dir(obj);
                },

                failure: function (response, opts) {
                    console.log('server-side failure with status code ' + response.status);
                }
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:CheckBoxList ID="CheckBoxList1" runat="server">
                <asp:ListItem>item1</asp:ListItem>
                <asp:ListItem Selected="True">item2</asp:ListItem>
            </asp:CheckBoxList>
            <asp:TextBox ID="TextBox1" runat="server" Text="boxValue1"></asp:TextBox>
        </div>
    </form>
</body>
</html>
