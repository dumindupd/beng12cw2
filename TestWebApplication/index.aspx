<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="TestWebApplication.index" %>

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
    <div class="container">
    <form id="form1" runat="server">
        <h1>XYZ University - Login Page</h1>
        <table>
            <tr>
                <td>Username</td>
                <td>
                    <asp:TextBox ID="txtuname" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Password</td>
                <td>
                    <asp:TextBox ID="txtpass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
                </td>
            </tr>
        </table>
    </form>
        </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnLogin").click(function () {
                var uname = $("#txtuname").val();
                var pass = $("#txtpass").val();
                if (uname == "" || pass == "") {
                    alert("Please enter both username and Password");
                    return false;
                }
            });
        });
    </script>
</body>
</html>
