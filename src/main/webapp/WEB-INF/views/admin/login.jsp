<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>대파-관리자 로그인</title>
		<link rel="stylesheet" href="/resources/css/admin_login.css"/>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	</head>
	<body>
		<h2>관리자 로그인</h2>
		<div class="div_Login">
			<form name="frm">
				<div>
					<input type="text" class="input_admin_id" name="admin_id" size="20" placeholder="관리자 아이디를 입력해주세요."/>
				</div>
				<div style="margin-top:10px;">
					<input type="password" class="input_admin_password" name="admin_password" placeholder="비밀번호를 입력해주세요."/>
				</div>
				<span><input type="checkbox" name="chkLogin" style="margin-top:10px; margin-right:5px;"/>로그인 상태유지</span>
				<button type="submit" class="btn_type1" style="margin-top:10px;"><span class="txt_type">로그인</span></button>
			</form>
		</div>
	</body>
	<script>
		$(frm).on("submit",function(e){
			e.preventDefault();
			var chk=$(frm.chkLogin).is(":checked")?"true":"false";
			var admin_id=$(frm.admin_id).val();
			var admin_password=$(frm.admin_password).val();
			$.ajax({
				type:"post",
				url:"login",
				data:{"admin_id":admin_id, "admin_password":admin_password, "chkLogin":chk},
				success:function(data){
					if(data.result==2){
						alert("아이디가 존재하지 않습니다.");
					}else if(data.result==0){
						alert("비밀번가 일치하지 않습니다.");
					}else{
						location.href=data.path;
					}
				}
			});
		});
	</script>
</html>