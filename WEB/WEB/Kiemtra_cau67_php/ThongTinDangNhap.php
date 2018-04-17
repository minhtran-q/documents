<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<?php
	$loi = 0;
	if($_POST['txtTenDangNhap'] == "")
	{
		$loi = 1; //co loi
		echo "<font color='red'>  ten dang nhap khong duoc rong </font>";
	}
	if( $loi == 0) // khong loi
	{
		echo "<h3> <font color= 'blue'> </font>";
		echo "Ten dang nhap: " . $_POST['txtTenDangNhap'] . "<br>";
		echo "Email: " . $_POST['txtEmail'] . "<br>";
	}
?>
</body>
</html>