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
	<form name="frm" action="/user/register" method="post">
		<table id="tbl" class="regtbl_register2">
			<!-- 아이디입력 -->
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" class="register_text" name="user_id" value="${vo.user_id}" readonly>					
				</td>
			</tr>
			<!-- 비밀번호 입력 -->
			<tr>
				<th>현재 비밀번호</th>
				<td><input type="password" class="register_text" name="new_user_password" placeholder="현재 비밀번호를 입력하세요"></td>
			</tr>
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
				<td><input type="text" class="register_text" name="user_name" value="${vo.user_name}">
				</td>
			</tr>
			<!-- 이메일 입력 -->
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" class="register_text" name="user_email" value="${vo.user_email}">
				</td>
			</tr>
			<!-- 전화번호 입력 -->
			<tr>
				<th>휴대폰</th>
				<td><input type="text" class="register_text" name="user_mobile"	value="${vo.user_mobile}"></td>
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
			<tr>
				<th>생년월일</th>	
				<td>			
					<select name="user_birthday_year" id="user_birthday_year" class="sel_register" value="${vo.user_birthday_year}">
						<%for (int i = 2021; i > 1949; i--) {%>
						<option value="<%=i%>"><%=i%>년</option>
						<%}%>
					</select> 
					<select name="user_birthday_month" id="user_birthday_month" class="sel_register" value="${vo.user_birthday_month}">
						<%for (int i = 01; i < 13; i++) {%>
						<option value="<%=i%>"><%=i%>월</option>
						<%}%>
					</select> 
					<select name="user_birthday_day" id="user_birthday_day" class="sel_register" value="${vo.user_birthday_day}">
						<%for (int i = 1; i < 32; i++) {%>
						<option value="<%=i%>"><%=i%>일</option>
						<%}%>
					</select>
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
</div>
<script>
$('input:radio[name="user_sex"]:checked').val();
$("#user_birthday_year option:selected").val();
$("#user_birthday_month option:selected").val();
$("#user_birthday_day option:selected").val();
</script>