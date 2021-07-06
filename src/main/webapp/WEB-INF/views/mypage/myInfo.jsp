<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <link rel="stylesheet" href="/resources/css/mypage.css"/> 
<link rel="stylesheet" href="/resources/css/user.css"/>
<div class="page_section_info">
	<h2 class="tit" >개인 정보 수정</h2>
	<div class="myinfo_PW">	
	<form name="frm">
		<table class="regtbl_register2">
			<tr class="login_id">
				<th>아이디</th>
				<td><input type="text" name="user_id" class="id_input" value="${user_info.user_id}"></td>
			</tr>
			<tr class="login_password">
				<th>비밀번호</th>
				<td><input type="password" name="user_password" class="password_input" ></td>
			</tr>		
		</table>
		<div class="regtbl_register2">	
			<input type="submit" class="login_button3" value="확인"/>	
		</div>			
	</form>	
	</div>	
</div>
<script>
//비밀번호 확인하기
$(frm).on("submit", function(e) {
	e.preventDefault();
	var user_id = $(frm.user_id).val();
	var user_password = $(frm.user_password).val();
	if (user_password == "") {
		alert("비밀번호를 입력하세요");
		$(frm.user_password).focus();
		return;
	}else{
		$.ajax({
			type : "post",
			url : "/user/login",
			data : {"user_id" : user_id,"user_password" : user_password},
			success : function(data) {
				alert("비번확인!");
				console.log(data);
				if(data.result==1){
					location.href="/mypage/myInfoupdate";
				}else{
					alert("비밀번호가 일치하지 않습니다.")
				}				
			}
		});
	}
});
</script>
