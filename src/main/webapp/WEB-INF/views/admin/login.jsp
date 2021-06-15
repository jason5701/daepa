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
		<h2>로그인</h2>
		<div style="width:340px">
			<form name="frm">
				<div>
					<input type="text" name="admin_id" size="20" placeholder="관리자 아이디를 입력해주세요."  style="height:54px; width:100%; font-size:14px; outline:none; border-radius:3px; border:1px solid #ccc;"/>
				</div>
				<div style="margin-top:10px;">
					<input type="password" name="admin_password" placeholder="비밀번호를 입력해주세요."  style="height:54px; width:100%; font-size:14px; outline:none; border-radius:3px; border:1px solid #ccc;"/>
				</div>
				<span><input type="checkbox" name="chkLogin"/>로그인 상태유지</span>
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
						//alert(data.path);
						location.href=data.path;
					}
				}
			});
		});
	</script>
</html>