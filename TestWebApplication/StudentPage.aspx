<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentPage.aspx.cs" Inherits="TestWebApplication.StudentPage" %>

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
    <div class="container-fluid">
        <h1>Student Page</h1>
        <asp:GridView ID="dgStudent" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="std_id" HeaderText="ID" />
                <asp:BoundField DataField="std_name" HeaderText="Name" />
                <asp:BoundField DataField="std_address" HeaderText="Address" />
                <asp:BoundField DataField="std_email" HeaderText="Email" />
                <asp:BoundField DataField="std_phone" HeaderText="Phone" />
                <asp:BoundField DataField="std_dob" HeaderText="Date of Birth" />
                <asp:BoundField DataField="std_gender" HeaderText="Gender" />
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <a href="#" id="<%# Eval("std_id") %>" class="lnkedit"><span class="fa fa-edit"></span></a>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <a href="#" id="<%# Eval("std_id") %>" class="lnkdelete"><span class="fa fa-trash" style="color:red"></span></a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <br />
        <button class="btn btn-primary" id="btnadd" type="button">Add New</button>
        <br />
        <asp:Label ID="lblmsg" runat="server"></asp:Label>
        <div id="divstudentform" style="display:none">
            <table>
                <tr>
                    <td>Student ID</td>
                    <td>
                        <asp:TextBox ID="txtid" runat="server" Width="109px" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td>
                        <asp:TextBox ID="txtname" runat="server" Width="380px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" Height="63px" Width="290px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <asp:TextBox ID="txtemail" runat="server" Width="226px"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>Phone</td>
                    <td>
                        <asp:TextBox ID="txtphone" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>Date of Birth</td>
                    <td>
                        <asp:TextBox ID="txtdob" runat="server" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>
                        <asp:RadioButton ID="rdomale" GroupName="gender" runat="server" Text="Male" />
                        <asp:RadioButton ID="rdofemale" GroupName="gender" runat="server" Text="Female" />
                    </td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td>
                        <asp:DropDownList ID="cmbstatus" runat="server">
                            <asp:ListItem Value="1">Active</asp:ListItem>
                            <asp:ListItem Value="0">Inactive</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                         <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnsave_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-success" OnClick="btnupdate_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="btn btn-danger" OnClick="btncancel_Click" />
                    </td>
                </tr>
            </table>
        </div>
       </div>
    </form>
    <script>
        $(document).ready(function () {
            $(".lnkedit").click(function () {
                var sid = $(this).attr("id");
                $("#btnsave").css("display", "none");
                $("#btnupdate").css("display", "inline");
                $.ajax({
                    url: "UniService.asmx/getStudent",
                    method: "post",
                    dataType: "json",
                    data: { stdid: sid },
                    success: function (data) {
                        $("#txtid").val(data.Sid);
                        $("#txtname").val(data.Sname);
                        $("#txtaddress").val(data.Saddress);
                        $("#txtemail").val(data.Semail);
                        $("#txtphone").val(data.Sphone);
                        $("#txtdob").val(data.Sdob);
                        if (data.Sgender == "1")
                            $("#rdomale").attr("checked", true);
                        else
                            $("#rdofemale").attr("checked", true);
                        $("#cmbstatus").val(data.Status);
                        $("#txtid").attr("readonly", "readonly");
                        $("#divstudentform").css("display", "block");
                    }
                });
            });

            $(".lnkdelete").click(function () {
                var sid = $(this).attr("id");
                var result = confirm("Do you want to delete " + sid + "?");
                if (result) {
                    $.ajax({
                        url: "UniService.asmx/removeStudent",
                        method: "post",
                        dataType: "text",
                        data: { stdid: sid },
                        success: function (data) {
                            if (data=="Done") {
                                alert("Successfully Removed");
                                location.reload();
                            }
                        }
                    });
                }
            });

            $("#btnadd").click(function () {
                $("#btnupdate").css("display", "none");
                $("#btnsave").css("display", "inline");
                clear();
                $("#divstudentform").css("display", "block");

                $.ajax({
                    url: "UniService.asmx/getNewStdId",
                    method: "post",
                    dataType: "text",
                    success: function (data) {
                        $("#txtid").val(data);
                        $("#txtid").attr("readonly", "readonly");
                    }
                });
            });
        });


        function clear() {
            $("#txtid").val("");
            $("#txtname").val("");
            $("#txtaddress").val("");
            $("#txtemail").val("");
            $("#txtphone").val("");
            $("#txtdob").val("");
            $("#rdomale").attr("checked", true);
            $("#cmbstatus").val("1");
        }
    </script>
</body>
</html>
