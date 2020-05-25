<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-dashboard.aspx.cs" Inherits="TestWebApplication.admin_dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Admin Dashboard</h1>
        <p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/logout.aspx">Signout</asp:HyperLink>
        </p>
        <p>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/showUsers.aspx">User Management</asp:HyperLink>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" Text="Signout" CssClass="btn btn-primary" OnClick="Button1_Click" />
        </p>
    </div>
    </form>
</body>
</html>
