<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <link rel="stylesheet" href="/resources/css/mypage.css"/>
     <link rel="stylesheet" href="/resources/css/user.css"/>
<div class="page_section">
	<div class="head_aticle">
		<h2 class="tit">개인 정보 수정</h2>		
	</div>	
	<br>
	<!-- 회원가입 폼 -->
	<form name="frm" action="/user/update_users" method="post">
		<table id="tbl" class="regtbl_register2">
			<!-- 아이디입력 -->
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" class="register_text" name="user_id" value="${user_info.user_id}" readonly>					
				</td>
			</tr>
			<!-- 비밀번호 입력 -->
			<tr>
				<th>새 비밀번호</th>
				<td><input type="password" class="register_text" name="user_password" placeholder="새로운 비밀번호를 입력하세요"></td>
			</tr>					
			<tr>
				<th>새 비밀번호 확인</th>
				<td>
					<input type="password" class="register_text" name="pwChk" placeholder="비밀번호를 한번 더 입력하세요">
					<button id="pwChk" class="register_button2" value="N">비밀번호확인</button>
				</td>
			</tr>
			<!-- 이름 입력 -->
			<tr>
				<th>이름</th>
				<td><input type="text" class="register_text" name="user_name" value="${user_info.user_name}">
				</td>
			</tr>
			<!-- 이메일 입력 -->
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" class="register_text" name="user_email" value="${user_info.user_email}">
				</td>
			</tr>
			<!-- 전화번호 입력 -->
			<tr>
				<th>휴대폰</th>
				<td><input type="text" class="register_text" name="user_mobile"	value="${user_info.user_mobile}"></td>
			</tr>
			
			<!-- 성별 입력 -->
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" id="user_sex" name="user_sex" value="0">선택안함
					<input type="radio" id="user_sex" name="user_sex" value="1">여자
					<input type="radio" id="user_sex" name="user_sex" value="2">남자				
				</td>
			</tr>
			<!-- 생년월일 입력 -->
			<tr class="birth">
				<th>생년월일</th>	
				<td>
					<div class="div_birthday">	
						<input type="text" name="user_birthday_year" id="birth_year" pattern="[0-9]*" value="${user_info.user_birthday_year}" label="생년월일" size="4" maxlength="4" placeholder="YYYY">
						<span class="bar"></span>
						<input type="text" name="user_birthday_month" id="birth_month" pattern="[0-9]*" value="${user_info.user_birthday_month}" label="생년월일" size="2" maxlength="2" placeholder="MM">
						<span class="bar"></span>
						<input type="text" name="user_birthday_day" id="birth_day" pattern="[0-9]*" value="${user_info.user_birthday_day}" label="생년월일" size="2" maxlength="2" placeholder="DD">
					</div>	
					<p class="txt_guide" style="display: none;">
						<span class="txt"></span>
					</p>	
				</td>				
			</tr>
			<!-- 약관 동의 폼 -->
			<tr>
				<th>약관동의</th>
				<td>					
					<div class="checkbox_group">					   
					  <input type="checkbox" id="check_1" class="normal" >
					  <label for="check_1"><span class="ico"> (필수)</span> 개인정보 처리방침 동의</label>		  
					  <br> 
					  <input type="checkbox" id="check_3" class="normal" >
					  <label for="check_3"><span> (선택)</span> 마케팅 수신 동의</label>		  
					</div>	
				</td>
			</tr>
		</table>	
		<!-- 회원수정 버튼 -->
	<div class="divButton">
		<input type="submit" id="btnUpdate" class="register_button"  value="회원수정">
		<input type="reset" class="register_button2" value="취소">
	</div>
</div>
<script>
//수정 버튼 누를때
$("#btnUpdate").on("click", function(){	
	if($(frm.user_password).val()==""){
		alert("변경할 비밀번호를 입력해주세요.");
		$(frm.user_password).focus();
		return false;
	}
	if($(frm.pwChk).val()==""){
		alert("비밀번호를 한번 더 입력해주세요.");
		$(frm.pwChk).focus();
		return false;
	}
	if($(frm.user_name).val()==""){
		alert("성명을 입력해주세요.");
		$(frm.user_name).focus();
		return false;
	}
	if($("#check_1").is(":checked")==false){
		alert("필수 약관에 동의하셔야 회원정보 수정이 가능합니다.")
		return false;
	}
});
//비밀번호 확인 버튼 누를때
$("#pwChk").on("click",function(e){
	e.preventDefault();
	if($(frm.user_password).val()==""){
		alert("비밀번호를 입력해주세요.");
		$(frm.user_password).focus();
		return false;
	}else if($(frm.pwChk).val()==""){
		alert("비밀번호를 한번 더 입력해주세요.");
		$(frm.pwChk).focus();
		return false;
	}else if($(frm.user_password).val()!=$(frm.pwChk).val()){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}else{
		alert("비밀번호가 일치합니다.");	
		$(frm.user_name).focus();
	}
});
</script>