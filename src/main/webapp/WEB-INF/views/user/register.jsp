<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link rel="stylesheet" href="/resources/css/user.css" />
<style>
	select { width: 130px;
            padding: .5em .5em;
            border: 1px solid #999;
            font-family: inherit;
            background: url('/resources/image/index/arrow.jpg') no-repeat 95% 50%;
            border-radius: 0px;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            }               
	select::-ms-expand {display: none;}
</style>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
</script>
<div class="memberjoin">
	<div class="joinHead">
		<h1 class="register_H1">회 원 가 입</h1>
		<p class="sub">
			<span class="ico">*</span> 필수입력사항
		</p>
	</div>
	<!-- 회원가입 폼 -->
	<form name="frm" action="/user/register" method="post">
		<table id="tbl" class="regtbl_register">
			<!-- 아이디입력 -->
			<tr>
				<th>아이디<span class="ico"> *</span></th>
				<td>
					<input type="text" class="register_text" name="user_id" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합" minlength="6" maxlength="12" size="15" pattern="[a-zA-Z0-9]{4,12}">
					<button id="idChk" class="register_button2" value="N">중복확인</button>
				</td>
			</tr>
			<!-- 비밀번호 입력 -->
			<tr>
				<th>비밀번호<span class="ico"> *</span></th>
				<td><input type="password" class="register_text" name="user_password" placeholder="비밀번호를 입력하세요"></td>
			</tr>			
			<tr>
				<th>비밀번호확인<span class="ico"> *</span></th>
				<td>
					<input type="password" class="register_text" name="pwChk" placeholder="비밀번호를 한번 더 입력하세요">
					<button id="pwChk" class="register_button2" value="N">비밀번호확인</button>
				</td>
			</tr>
			<!-- 이름 입력 -->
			<tr>
				<th>이름<span class="ico"> *</span></th>
				<td><input type="text" class="register_text" name="user_name" placeholder="이름을 입력하세요">
				</td>
			</tr>
			<!-- 이메일 입력 -->
			<tr>
				<th>이메일<span class="ico"> *</span></th>
				<td>
					<input type="text" class="register_text" name="user_email"	placeholder="예:deapazzang@deapa.com">
				</td>
			</tr>
			<!-- 전화번호 입력 -->
			<tr>
				<th>휴대폰<span class="ico"> *</span></th>
				<td><input type="text" class="register_text" name="user_mobile"	placeholder="숫자만 입력해주세요"></td>
			</tr>
			<!-- 주소 입력 -->
			<tr>
				<th>주소<span class="ico"> *</span></th>
				<td>
					<input type="text" id="sample4_postcode" class="register_text" name="user_post" onclick="sample4_execDaumPostcode()" placeholder="우편번호">
					<input type="button"  class="register_button2" onclick="sample4_execDaumPostcode()"	value="우편번호 찾기"><br> 
					<input type="text" id="sample4_roadAddress" name="user_road_address" onclick="sample4_execDaumPostcode()" placeholder="도로명주소"> 
					<input type="text" id="sample4_jibunAddress" name="user_address" onclick="sample4_execDaumPostcode()" placeholder="지번주소"> 
					<span id="guide" style="color: #999; display: none"></span><br> 
					<input type="text" id="sample4_detailAddress" class="register_text" name="user_address_detail1" placeholder="상세주소">
					<input type="text" id="sample4_extraAddress" class="register_text" name="user_address_detail2"  placeholder="참고항목">
					<p>배송지에 따라 상품정보가 달라질 수 있습니다.</p>
				</td>
			</tr>
			<!-- 성별 입력 -->
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="user_sex" value="0" checked>선택안함
					<input type="radio" name="user_sex" value="1">여자
					<input type="radio" name="user_sex" value="2">남자				
				</td>
			</tr>
			<!-- 생년월일 입력 -->
			<tr>
				<th>생년월일</th>	
				<td>			
					<select name="user_birthday_year"  class="sel_register">
						<%for (int i = 2021; i > 1949; i--) {%>
						<option value="<%=i%>"><%=i%>년</option>
						<%}%>
					</select> 
					<select name="user_birthday_month" class="sel_register">
						<%for (int i = 01; i < 13; i++) {%>
						<option value="<%=i%>"><%=i%>월</option>
						<%}%>
					</select> 
					<select name="user_birthday_day" class="sel_register">
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
					  <input type="checkbox" id="check_all" class="Allnormal">
					  <label for="check_all" class="AllAgree">전체 동의</label>		
					  <br>  
					  <input type="checkbox" id="check_1" class="normal" >
					  <label for="check_1"><span class="ico"> (필수)</span> 개인정보 처리방침 동의</label>		  
					  <br> 
					  <input type="checkbox" id="check_2" class="normal" >
					  <label for="check_2"><span class="ico"> (필수)</span> 서비스 이용약관 동의</label>		 
					  <br>  
					  <input type="checkbox" id="check_3" class="normal" >
					  <label for="check_3"><span> (선택)</span> 마케팅 수신 동의</label>		  
					</div>	
				</td>
			</tr>
		</table>		
		<br>
	<!-- 회원가입 버튼 -->
	<div class="divButton">
		<input type="submit" id="btnRegister" class="register_button"  value="회원가입">
		<input type="reset" class="register_button2" value="취소">
		<input type="button" id="btnLogin" class="register_button2"  value="로그인">
	</div>
	</form>
</div>
<script>
	$("#btnLogin").on("click", function() {
		location.href = "login";
	});
	// 체크박스 전체 선택
	$("#check_all").on("click", function () {
	    $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
	});
	// 체크박스 개별 선택
	$(".checkbox_group").on("click", ".normal", function() {
	    var is_checked = true;
	    $(".checkbox_group .normal").each(function(){
	        is_checked = is_checked && $(this).is(":checked");
	    });
	    $("#check_all").prop("checked", is_checked);
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
	//중복확인 버튼 누를때
	$("#idChk").on("click",function(e){		
		e.preventDefault();
		if($(frm.user_id).val()==""){
			alert("아이디를 입력해주세요.");
			$(frm.user_id).focus();
			return false;
		}else if($(frm.user_id).val().length<5){
			alert("아이디를 6자 이상의 영문 혹은 영문과 숫자를 조합해주세요.");		
			return false;
		}else{
			fn_idChk();
			$(frm.user_password).focus();
		}		
	});
	//아이디 중복체크
	function fn_idChk(){		
		$.ajax({			
			url:"/user/idChk",
			type:"post",
			dataType:"json",
			data:{"user_id":$(frm.user_id).val()},
			success:function(data){	
				if(data == 1){
					alert("중복된 아이디가 있습니다.");
				}else if(data == 0){
					$("#idChk").attr("value","Y");
					alert("사용가능한 아이디입니다.");					
				}				
			}
		});
	}
	//회원가입 누르기
	$("#btnRegister").on("click", function(){
		if($(frm.user_id).val()==""){
			alert("아이디를 입력해주세요.");
			$(frm.user_id).focus();
			return false;
		}
		if($(frm.user_password).val()==""){
			alert("비밀번호를 입력해주세요.");
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
		if($(frm.user_email).val()==""){
			alert("이메일을 입력해주세요.");
			$(frm.user_email).focus();
			return false;
		}
		if($(frm.user_mobile).val()==""){
			alert("휴대폰을 입력해주세요.");
			$(frm.user_mobile).focus();
			return false;
		}
		if($(frm.user_post).val()==""){
			alert("주소를 입력해주세요.");
			$(frm.user_post).focus();
			return false;
		}
		if($("#check_1").is(":checked")==false){
			alert("필수 약관에 동의하셔야 회원가입이 가능합니다.")
			return false;
		}else if($("#check_2").is(":checked")==false){
			alert("필수 약관에 동의하셔야 회원가입이 가능합니다.")
			return false;
		}
	});

</script>