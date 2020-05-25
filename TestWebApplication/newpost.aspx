<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newpost.aspx.cs" Inherits="TestWebApplication.newpost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>New Post</h1>
        <p>
            <asp:Label ID="lblmsg" runat="server"></asp:Label>
        </p>
        <table>
            <tr>
                <td>Title</td>
                <td>
                    <asp:TextBox ID="txttitle" runat="server" Width="326px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Due Date</td>
                <td>
                    <asp:TextBox ID="txtdate" runat="server" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Message</td>
                <td>
                    <asp:TextBox ID="txtmsg" runat="server" Height="213px" TextMode="MultiLine" Width="381px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">

                    <asp:Button ID="btnsave" runat="server" OnClick="btnsave_Click" Text="Save" />
                    <asp:Button ID="btnclear" runat="server" Text="Clear" />

                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
