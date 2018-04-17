<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListEmp.aspx.cs" Inherits="ListEmp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 226px;
            height: 23px;
        }
        .style2
        {
            width: 122px;
            height: 23px;
        }
        .style3
        {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server">Xem danh sách nhân viên</asp:Label>
        <hr />
        <asp:Label ID="Label2" runat="server">Danh sách:</asp:Label>
        <br />
        <asp:ListBox ID="lstEmp1" runat="server" Height="155px" Width="279px">
        </asp:ListBox>
            <br />
        <asp:Button ID="btnView"
            runat="server"
            Text="Xem" onclick="btnView_Click"
            />
         <asp:HyperLink runat="server" ID="linkBack" NavigateUrl="~/index.aspx"><< Trở về trang chủ</asp:HyperLink>
        <br />
        <asp:DataList ID="dlDetails" runat="server" Width="800px">
            <HeaderTemplate>
                <table style="width:100%;">
                    <tr>
                        <td class="style3" width="50">
                            <asp:Label ID="Label8" runat="server" Text="Mã"></asp:Label>
                        </td>
                        <td class="style1" width="200">
                            <asp:Label ID="Label9" runat="server" Text="Họ"></asp:Label>
                        </td>
                        <td class="style2" width="100">
                            <asp:Label ID="Label10" runat="server" Text="Tên"></asp:Label>
                        </td>
                        <td class="style3" width="150">
                            <asp:Label ID="Label11" runat="server" Text="Điện thoại"></asp:Label>
                        </td>
                        <td class="style3">
                            <asp:Label ID="Label12" runat="server" Text="Phòng/Ban"></asp:Label>
                        </td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
                
                <table style="width:100%;">
                    <tr>
                        <td class="style3" width="50">
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("MaNV") %>'></asp:Label>
                        </td>
                        <td class="style1" width="200">
                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("HoNV") %>'></asp:Label>
                        </td>
                        <td class="style2" width="100">
                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("TenNV") %>'></asp:Label>
                        </td>
                        <td class="style3" width="150">
                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("DienThoai") %>'></asp:Label>
                        </td>
                        <td class="style3">
                            <asp:Label ID="Label12" runat="server" Text='<%# Eval("TenDV") %>'></asp:Label>
                        </td>
                    </tr>
                </table>
                
            </ItemTemplate>
        </asp:DataList>
    </div>
    </form>
</body>
</html>
