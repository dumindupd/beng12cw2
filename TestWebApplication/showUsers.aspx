﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="showUsers.aspx.cs" Inherits="TestWebApplication.showUsers" %>

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
    <div class="container">
    <h1>User List</h1>
        <asp:GridView ID="dgUsers" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="usr_name" HeaderText="User name" />
                <asp:BoundField DataField="usr_type" HeaderText="Type" />
                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <a href="#" class="lnkstatus" id='<%# Eval("usr_name") %>'><%# Eval("usr_status") %></a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <i class="fa fa-bomb"></i>
    </div>
    </form>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".lnkstatus").click(function () {
                var uname = $(this).attr("id");
                var cstatus = $(this).html();
                if (cstatus=="Inactive") {
                    stat = 1;
                }
                else if (cstatus == "Active") {
                    stat = 0;
                }
                var result = confirm("Do you want to change the status of " + uname + "?");
                if (result) {
                    $.ajax({
                        url: "UniService.asmx/changeLoginStatus",
                        method: "post",
                        dataType: "text",
                        data: { uname: uname, stat: stat },
                        success: function (data) {
                            alert(data);
                            location.reload();
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>
