<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddEmp.aspx.cs" Inherits="AddEmp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <asp:Label ID="Label1" runat="server">Thêm nhân viên vào danh sách</asp:Label>
        <hr />
        <asp:Label ID="Label2" runat="server">Nhập:</asp:Label>
        <br />
        <br />
        <table style="border-collapse:collapse" >
            <tr>
                <td>Họ:</td>
                <td><asp:TextBox ID="txtHo" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Tên:</td>
                <td><asp:TextBox ID="txtTen" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>ĐT:</td>
                <td><asp:TextBox ID="txtDT" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Đơn vị:</td>
                <td>
                    <asp:DropDownList ID="cmbDV" runat="server" DataTextField="TenDV" DataValueField="MaDV"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnAccept" runat="server" Text="Đồng ý" 
                        onclick="btnAccept_Click"/>
                    <asp:Button ID="btnCancel" runat="server" Text="Hủy bỏ" 
                        onclick="btnCancel_Click" />
                </td>
            </tr>
        </table>
        <asp:HyperLink runat="server" ID="linkBack" NavigateUrl="~/index.aspx"><< Trở về trang chủ</asp:HyperLink>

        <br />
        <br />

        <center><asp:Label ID="lblMessage" runat="server" ForeColor="#FF3300"></asp:Label></center>
    </div>
    </form>
</body>
</html>
