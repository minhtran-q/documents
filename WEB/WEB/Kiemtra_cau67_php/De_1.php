<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<form id="form1" name="form1" method="post" action="">
  <table width="789" height="410" border="1">
    <tr>
      <td colspan="2">DIEN THONG TIN VAO BANG DUOI DAY&nbsp;</td>
    </tr>
    <tr>
      <td width="336">Ten dang nhap</td>
      <td width="437"><label for="txtTenDangNhap"></label>
      <input type="text" name="txtTenDangNhap" id="txtTenDangNhap" /></td>
    </tr>
    <tr>
      <td>Mat khau</td>
      <td><input type="password" name="txtTenDangNhap2" id="txtMatKhau" /></td>
    </tr>
    <tr>
      <td>Nhap lai</td>
      <td><input type="password" name="txtMatKhau" id="txtNhapLai" /></td>
    </tr>
    <tr>
      <td>Email</td>
      <td><input type="password" name="txtMatKhau2" id="txtEmail" /></td>
    </tr>
    <tr>
      <td>Gioi tinh</td>
      <td><label>
        <input type="radio" name="radio" id="rdoNam" value="rdoNam" />
       nam<br />
       <input type="radio" name="radio" id="rdoNu" value="rdoNu" />
      nu</label></td>
    </tr>
    <tr>
      <td>Ngay sinh</td>
      <td>
      <select name="ngay" id="day">
      <option selected="ngay">Ngay</option>
      <?php
	  	for($i = 1; $i <= 31; $i++)
			echo "<option value =" .$i. ">" .$i. "</option>"
	  ?>
      </select>
        <select name="thang" id="month">
        <option selected="ngay">Thang</option>
         <?php
	  	for($i = 1; $i <= 12; $i++)
			echo "<option value =" .$i. ">" .$i. "</option>"
	  ?>
        </select>
        <select name="nam" id="year">
        <option selected="ngay">Nam</option>
         <?php
	  	for($i = 1970; $i <= 2000; $i++)
			echo "<option value =" .$i. ">" .$i. "</option>"
	  ?>
      </select>
      </td>
    </tr>
    <tr>
      <td>Ghi chu</td>
      <td><label>
        <textarea name="ghiChu" id="ghiChu" cols="45" rows="5"></textarea>
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="submit" id="submit" value="Submit" formaction="ThongTinDangNhap.php"/></td>
    </tr>
  </table>
</form>
</body>
</html>