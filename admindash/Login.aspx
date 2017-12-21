<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="admindash_Default8" %>

<!DOCTYPE html>

<html>

<head>
    <link rel="icon" type="image/png" href="assets/img/abc.png" />

  <meta charset="UTF-8">

  <title>My AD Admin Login</title>

    <style>
@import url(http://fonts.googleapis.com/css?family=Exo:100,200,400);
@import url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);

body{
	margin: 0;
	padding: 0;
	background: #fff;

	color: #fff;
	font-family: Arial;
	font-size: 12px;
}

.body{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background-image: url(https://jaroeducation.files.wordpress.com/2013/07/quang-cao-hay-khong-quang-cao-de-ban-san-pham-tot-hon-large.jpg);
	background-size: cover;
	-webkit-filter: blur(5px);
	z-index: 0;
}

.grad{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(100%,rgba(0,0,0,0.65))); /* Chrome,Safari4+ */
	z-index: 1;
	opacity: 0.7;
}

.header{
	position: absolute;
	top: calc(50% - 35px);
	left: calc(50% - 255px);
	z-index: 2;
}

.header div{
	float: left;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 35px;
	font-weight: 200;
}

.header div span{
	color: #5379fa !important;
}

.login{
	position: absolute;
	top: calc(46.8% - 75px);
	left: calc(50% - 50px);
	height: 150px;
	width: 350px;
	padding: 10px;
	z-index: 2;
}

.login input[type=text]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
}

.login input[type=password]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top: 10px;
}

.login input[type=button]{
	width: 260px;
	height: 35px;
	background: #fff;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 2px;
	color: #a18d6c;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 6px;
	margin-top: 10px;
}

.login input[type=button]:hover{
	opacity: 0.8;
}

.login input[type=button]:active{
	opacity: 0.6;
}

.login input[type=text]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=password]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=button]:focus{
	outline: none;
}

::-webkit-input-placeholder{
   color: rgba(255,255,255,0.6);
}

::-moz-input-placeholder{
   color: rgba(255,255,255,0.6);
}
</style>

    <script src="assets/js/prefixfree.min.js"></script>

</head>

<body>
<form id="form1" runat="server">
  <div class="body"></div>
		<div class="grad"></div>
		<div class="header">
			<div>My AD<span> Admin</span></div>
		</div>
		<br>
		<div class="login">
				<input type="text" placeholder="username" name="user" id="u_name" runat="server" onserverclick="button1_OnClick"><br />
            &nbsp; <asp:RequiredFieldValidator ValidationGroup="val1" ID="RequiredFieldValidator5" runat="server" ControlToValidate="u_name" ErrorMessage="E-mail is Required" CssClass="text-danger" Display="Dynamic" ForeColor="#CC0000"></asp:RequiredFieldValidator>

                                    &nbsp;<asp:RegularExpressionValidator ValidationGroup="val1" ID="RegularExpressionValidator1" runat="server" ControlToValidate="u_name" ErrorMessage="You Must Enter The valid E-mail id" CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#CC0000"></asp:RegularExpressionValidator>
                                    
            <br>
				<input type="password" placeholder="password" name="password" id="p_word" runat="server" onserverclick="button1_OnClick">
            <br />
            &nbsp; <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="val1" runat="server" ControlToValidate="p_word" ErrorMessage="Please Enter Password" Display="Dynamic" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <br>
				<input type="button" value="Login" ValidationGroup="val1" id="button1" runat="server" onserverclick="button1_OnClick"><br><br>
            <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
		</div>

  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>
</form>
</body>

</html>