<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/user.css" />
		<h2>로 그 인</h2>
		<div class="div_Login">
			<form name="frm">
				<div>
					<input type="text" name="user_id" class="id_input" placeholder="아이디를 입력해주세요">
				</div>
				<div style="margin-top:10px;">
					<input type="password" name="user_password" class="password_input" placeholder="비밀번호를 입력해주세요">
				</div>
				<span>
					<input type="checkbox" name="chkLogin" class="chkLogin" style="margin-top:10px; margin-right:5px;"/>로그인 상태유지
				</span>
					<input type="submit" class="login_button" style="margin-top:10px;" value="로그인"/>		
					<input type="button" class="login_button2" value="회원가입"/>
					<!-- <a href="https://kauth.kakao.com/oauth/authorize?client_id=2287364253d35e52c6009b9ed1c6a7b3
    						&redirect_uri=http://localhost:8088/user/login
    						&response_type=code">카카오 로그인</a> -->
			</form>
		</div>
<script>		
	//로그인하기
	$(frm).on("submit", function(e) {
		e.preventDefault();
		var chkLogin=$(frm.chkLogin).is(":checked")?"true":"false"
		var user_id = $(frm.user_id).val();
		var user_password = $(frm.user_password).val();
		if (user_id == "") {
			alert("아이디를 입력하세요.");
			$(frm.user_id).focus();
			return;
		} else if (user_password == "") {
			alert("비밀번호를 입력하세요.");
			$(frm.user_password).focus();
			return;
		}
		$.ajax({
			type : "post",
			url : "login",
			data : {
				"user_id" : user_id,
				"user_password" : user_password,
				"chkLogin":chkLogin
			},
			success : function(data) {
				console.log(data);
				if(data.result==2){
					alert("아이디가 존재하지 않습니다.");
				}else if(data.result==1){
					alert("로그인성공");
					location.href=data.path;
				}else{
					alert("비밀번호가 일치하지 않습니다.")
				}				
			}
		});
	});
	$(".login_button2").on("click", function() {
		location.href = "register";
	});
</script>
