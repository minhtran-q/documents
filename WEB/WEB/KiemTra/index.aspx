<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label runat="server">Quản lý nhân viên</asp:Label>
        <hr />
        <asp:Label runat="server">Chọn:</asp:Label><br />
        <asp:RadioButton runat="server" ID="radList" 
            GroupName="radgSelect" 
            Text="Xem danh sách nhân viên" 
            OnCheckedChanged="rad_CheckedChange"
            AutoPostBack="true"
            /><br />
        <asp:RadioButton runat="server" 
            ID="radAdd" GroupName="radgSelect" 
            Text="Thêm nhân viên vào danh sách"
            OnCheckedChanged="rad_CheckedChange"
            AutoPostBack="true"
            />
    </div>
    </form>
</body>
</html>
