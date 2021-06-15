<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
* {
	font-family: 'Noto Sans CJK KR'
}

h1 {
	font-weight: 900;
	text-align: center;
}
select { width: 130px;
            padding: .5em .5em;
            border: 1px solid #999;
            font-family: inherit;
            background: url('/resources/image/arrow.jpg') no-repeat 95% 50%;
            border-radius: 0px;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            }               
select::-ms-expand {display: none;}
.memberjoin {
	margin: 0px auto;
	width: 850px;
	height: 1316px;
}

table {
	width: 80%;
	margin: 10px auto;
	text-align: center;
	border-collapse: collapse;
}

tr {
	height: 70px;
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
}

table th {
	width: 20%;
}

table td {
	width: 80%;
	text-align: left
}

.memberjoin .joinHead .sub {
	padding: 23px 0 10px;
	font-size: 12px;
	color: #666;
	line-height: 17px;
	text-align: right;
}

input[type="checkbox"] {
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 2px solid #bcbcbc;
	cursor: pointer;
}

#sample4_roadAddress, #sample4_jibunAddress {
	width: 250px;
	height: 50px;
	padding: .5em;
	margin: 5px;
	font-weight: 600;
	border: 1px solid #999;
	background: white;
	border-radius: 5px 5px 5px;
	font-size: 12pt;
	color: -internal-light-dark(black, white);
	background-color: -internal-light-dark(rgb(255, 255, 255),
		rgb(59, 59, 59));
}

input[type="text"], input[type="password"] {
	width: 350px;
	height: 50px;
	padding: .5em;
	margin: 5px;
	font-weight: 600;
	border: 1px solid #999;
	background: white;
	border-radius: 5px 5px 5px;
	font-size: 12pt;
	color: -internal-light-dark(black, white);
	background-color: -internal-light-dark(rgb(255, 255, 255),
		rgb(59, 59, 59));
}

.memberjoin .ico {
	color: #ee6a7b;
}

.btnDupl, input[type="button"] {
	width: 120px;
	height: 50px;
	padding: .5em;
	border: 1px solid #364967;
	background: white;
	border-radius: 5px 5px 5px;
	color: #364967;
	margin-left: 10px;
	font-weight: bold;
}

input[type="radio"] {
	content: ' ';
	display: inline-block;
	width: 21px;
	height: 21px;
	line-height: 21px;
	margin: -2px 8px 0 0;
	text-align: center;
	vertical-align: middle;
	background: #fafafa;
	border: 1px solid #cacece;
	border-radius: 3px;
	box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.05), inset 0px -15px 10px -12px
		rgba(0, 0, 0, 0.05);
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
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
<body>
	<div class="memberjoin">
		<div class="joinHead">
			<h1>회 원 가 입</h1>
			<p class="sub">
				<span class="ico">*</span> 필수입력사항
			</p>
		</div>
		<hr />
		<table id="tblInsert">
			<tr>
				<th>아이디<span class="ico"> *</span></th>
				<td><input type="text" name="user_id"
					placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합">
					<button class="btnDupl">중복확인</button></td>
			</tr>
			<tr>
				<th>비밀번호<span class="ico"> *</span></th>
				<td><input type="text" name="user_password"
					placeholder="비밀번호를 입력하세요"></td>
			</tr>
			<tr>
				<th>비밀번호확인<span class="ico"> *</span></th>
				<td><input type="text" name="chkpassword"
					placeholder="비밀번호를 한번 더 입력하세요"></td>
			</tr>
			<tr>
				<th>이름<span class="ico"> *</span></th>
				<td><input type="text" name="user_name" placeholder="이름을 입력하세요">
				</td>
			</tr>
			<tr>
				<th>이메일<span class="ico"> *</span></th>
				<td><input type="text" name="user_email"
					placeholder="예:deapazzang@deapa.com">
					<button class="btnDupl">중복확인</button></td>
			</tr>
			<tr>
				<th>휴대폰<span class="ico"> *</span></th>
				<td><input type="text" name="user_mobile"
					placeholder="숫자만 입력해주세요"></td>
			</tr>
			<tr>
				<th>주소<span class="ico"> *</span></th>
				<td><input type="text" id="sample4_postcode" placeholder="우편번호">
					<input type="button" onclick="sample4_execDaumPostcode()"
					value="우편번호 찾기"><br> <input type="text"
					id="sample4_roadAddress" placeholder="도로명주소"> <input
					type="text" id="sample4_jibunAddress" placeholder="지번주소"> <span
					id="guide" style="color: #999; display: none"></span> <input
					type="text" id="sample4_detailAddress" placeholder="상세주소">
					<input type="text" id="sample4_extraAddress" placeholder="참고항목">
					<p>배송지에 따라 상품정보가 달라질 수 있습니다.</p></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="user_sex" value="male">
					남자 <input type="radio" name="user_sex" value="female"> 여자 <input
					type="radio" name="user_sex" value="none" checked> 선택안함</td>
			</tr>
			<tr>
				<th>생년월일</th>	
				<td>			
					<select name="year">
						<%for (int i = 2021; i > 1949; i--) {%>
						<option value="<%=i%>"><%=i%>년</option>
						<%}%>
					</select> 
					<select name="month">
						<%for (int i = 1; i < 13; i++) {%>
						<option value="<%=i%>"><%=i%>월</option>
						<%}%>
					</select> 
					<select name="day">
						<%for (int i = 1; i < 31; i++) {%>
						<option value="<%=i%>"><%=i%>일</option>
						<%}%>
					</select>
				</td>
			</tr>
			<tr>
				<th>이용약관동의<span class="ico"> *</span></th>
				<td>
					<div>
						<input type="checkbox" class="agreement"> 전체 동의합니다. <br />
						<p class="sub">선택항목에 동의하지 않는 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.
						</p>
					</div>
					<div>
						<input type="checkbox" class="agreement"> 이용약관 동의(필수)
					</div>
					<div>
						<input type="checkbox" class="agreement"> 개인정보 수집·이용
						동의(필수)
					</div>
					<div>
						<input type="checkbox" class="agreement"> 무료배송,할인쿠폰 등
						혜택/정보 수신 동의(선택)
					</div>
					<div>
						<input type="checkbox" class="agreement"> 본인은 만 14세
						이상입니다(필수)
					</div>
				</td>

			</tr>
		</table>
	</div>
</body>
</html>