<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<style>
* {
	font-family: 'Noto Sans CJK KR'
}

h1 {
	font-weight: 900;
	text-align: center;
	font-size: 30px;
}

.divLogin {
	margin: 0px auto;
	width: 800px;
	height: 1316px;
}

tr {
	height: 60px;
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
}

table {
	width: 80%;
	margin: 0px auto;
	text-align: center;
	border-collapse: collapse;
}

input[type="text"], input[type="password"] {
	width: 400px;
	height: 50px;
	padding: .5em;
	font-weight: 500;
	border: 1px solid #364967;
	background: white;
	font-size: 12pt;
	color: black;
}

#tblInsert th {
	width: 20%;
	font-size: 13pt;
}

#tblInsert td {
	width: 80%
}

#divLogin {
	width: 100%;
}

input[type="checkbox"] {
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 2px solid #364967;
	cursor: pointer;
}

#btnLogin {
	width: 400px;
	height: 50px;
	padding: .5em;
	border: 1px solid #364967;
	background: #364967;
	color: white;
	font-weight: bold;
}

#btnRegister {
	width: 400px;
	height: 50px;
	padding: .5em;
	border: 1px solid #364967;
	background: white;
	color: block;
	font-weight: bold;
}
</style>
<link rel="stylesheet" href="/resources/css/login.css" />
</head>
<body>
	<h1>로 그 인</h1>
	<div class="divLogin">
		<form name="frm">
			<table id="tbl_login">
				<tr>
					<td><input type="text" name="user_id"
						placeholder="아이디를 입력해주세요"></td>
				</tr>
				<tr>
					<td><input type="password" name="user_password"
						placeholder="비밀번호를 입력해주세요"></td>
				</tr>
				<tr>
					<td><input type="checkbox" id="chkLogin"> 로그인 저장</td>
				</tr>
				<tr>
					<td><input type="submit" id="btnLogin" value="로그인"></td>
				</tr>
				<tr>
					<td><button id="btnRegister">회원가입</button></td>
				</tr>
			</table>
		</form>
	</div>
	<script>
		$("#btnRegister").on("click", function() {
			location.href = "register";
		});
		$(frm).on("submit", function(e) {
			e.preventDefault();
			var user_id = $(frm.user_id).val();
			var user_password = $(frm.user_password).val();
			if (user_id == "") {
				alert("아이디를 입력하세요");
				return;
			} else if (user_password == "") {
				alert("비밀번호를 입력하세요");
				return;
			}
			$.ajax({
				type : "post",
				url : "login",
				data : {
					"user_id" : user_id,
					"user_password" : user_password
				},
				success : function(data) {
					console.log(data);
				}
			});
		});
	</script>
</html>