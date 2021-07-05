<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<h2>주문서</h2>

<table id="carttbl">
	<c:forEach items="${cartList}" var="cartList">
		<tr class="row" cart_number="${cartList.cart_number}">
	       <td class="product_id" style="display:none;">${cartList.product_id}</td>
	       <td width=100><img src="/displayFile?fullName=${cartList.product_image}" width=100/></td>
	       <td width=340>${cartList.product_name}</td>
	       <td class="product_price" width=100><fmt:formatNumber pattern="#,###" value="${cartList.product_price}" /></td>
	       <td class="cart_product_qtt" width=340>${cartList.cart_product_qtt}</td>
	       <td>${cartList.product_price * cartList.cart_product_qtt}</td>
	    </tr>
	</c:forEach>
</table><br/>  

<div id="total">
   <div>총 상품금액 : <fmt:formatNumber pattern="#,###" value="${total}" />원</div>
   <div>배송비 : <fmt:formatNumber pattern="#,###" value="${fee}" />원</div><br/>  
   
   <div>총 결제예상금액 : <fmt:formatNumber pattern="#,###" value="${total+fee}" />원</div>
</div><br/><hr/><br/>

<form name="frm">
	주문자 : <input type="text" id="user_name" value="${userinfo.user_name}"/><br/>
	휴대폰 : <input type="text" id="user_mobile" value="${userinfo.user_mobile}"/><br/>
	이메일 : <input type="text" id="user_email" value="${userinfo.user_email}"/><br/>
	
	주소 : <span class="ico"></span>
	<input type="text" id="sample4_postcode" class="register_text" name="user_post" onclick="sample4_execDaumPostcode()" value="${userinfo.user_post}">
	<input type="button"  class="register_button2" onclick="sample4_execDaumPostcode()"	value="우편번호 찾기"><br> 
	<input type="text" id="sample4_roadAddress" name="user_road_address" onclick="sample4_execDaumPostcode()" value="${userinfo.user_road_address}"> 
	<input type="text" id="sample4_jibunAddress" name="user_address" onclick="sample4_execDaumPostcode()" value="${userinfo.user_address}"> 
	<span id="guide" style="color: #999; display: none"></span><br> 
	<input type="text" id="sample4_detailAddress" class="register_text" name="user_address_detail1" value="${userinfo.user_address_detail1}">
	<input type="text" id="sample4_extraAddress" class="register_text" name="user_address_detail2" value="${userinfo.user_address_detail2}">
	<p>배송지에 따라 상품정보가 달라질 수 있습니다.</p>
	<br/><hr/><br/>
	<label><input type="radio" id="kakaopay" name="order_payment" value="1" checked />카카오페이</label>
	<label><input type="radio" id="account" name="order_payment" value="0" />무통장입금</label>
	<select id="bank" size=10>
		<option value="" selected>ㅡㅡ계좌를 선택해주세요ㅡㅡ</option>
		<option value="신한은행 123123123">신한은행 123123123</option>
		<option value="우리은행 123123123">우리은행 123123123</option>
		<option value="기업은행 123123123">기업은행 123123123</option>
	</select><br/><br/>
	<input type="button" id="btnKakao" value="결제하기"/>
	<input type="button" id="reset"  value="주문취소"/>
</form>

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
<script>

$("#bank").hide();

//무통장입금 클릭 시 계좌show
$("#account").on("click", function(){
	$("#bank").show();
});

//카카오페이 클릭 시 진행
$("#kakaopay").on("click", function(){
	$("#bank").hide();
});

//무통장입금 은행 선택 시
$("#bank").on("change", function(){
	var bank=$("#bank option:selected").val();
});

//결제하기 버튼 눌렀을 때
$("#btnKakao").click(function(){	
	var payment=$("input[name='order_payment']:checked").val();
	
	if(payment == 1){ //카카오페이로 결제진행할 때
		var IMP = window.IMP;
	   //가맹점 식별코드
	   IMP.init('imp09790492');
	   IMP.request_pay({
	       pg : 'kakao',
	       pay_method : 'card',
	       merchant_uid : 'daepa_' + new Date().getTime(),
	       name : '1인가구를 위한 쇼핑몰 대파' , //결제창에서 보여질 이름
	       amount : '${total+fee}', //실제 결제되는 가격
	       buyer_email : 'iamport@siot.do',
	       buyer_name : '구매자이름',
	       buyer_tel : '010-1234-5678',
	       buyer_addr : '서울 강남구 도곡동',
	       buyer_postcode : '123-456'
	   }, function(rsp) {
	      console.log(rsp);
	       if ( rsp.success ) {
	          var msg = '결제가 완료되었습니다.' + '\n';
	           //msg += '고유ID : ' + rsp.imp_uid + '\n';
	           //msg += '상점 거래ID : ' + rsp.merchant_uid + '\n';
	           msg += '결제 금액 : ' + rsp.paid_amount + '\n';
	           //msg += '카드 승인번호 : ' + rsp.apply_num;
	           
				var user_id="${userinfo.user_id}";
				var order_name=$("#user_name").val();
				var order_mobile=$("#user_mobile").val();
				var order_email=$("#user_email").val();
				var order_address=$("#sample4_jibunAddress").val();
				
	           $.ajax({
	       		type:"post",
	       		url:"/order/order_insert",
	       		dataType:"json",
	       		data:{"user_id":user_id, "order_name":order_name, "order_mobile":order_mobile, 
	       			  "order_email":order_email, "order_address":order_address, "order_payment":payment},
	       		success:function(max_order){
	       			$("#carttbl .row").each(function(){
	       				var product_id=$(this).find(".product_id").html();
	       				var purchase_qtt=$(this).find(".cart_product_qtt").html();
	       				$.ajax({
	       					type:"post",
	       					url:"/order/purchase_insert",
	       					data:{"order_number":max_order, "product_id":product_id, "purchase_qtt":purchase_qtt},
	       					success:function(){
	       						$("#carttbl .row").each(function(){
	       							var array=[];
	       							var cart_number=$(this).attr("cart_number");
	       							var data={"cart_number":cart_number};
	       							array.push(data);
	       							
	       							$.ajax({
	       								type:"post",
	       								url:"/cart/delete",
	       								data:{"cart_number":cart_number},
	       								success:function(){
	       									location.href="/mypage/all";
	       								}
	       							});
	       						});
	       					}
	       				});
	       			});
	       		}
	       	});
	       } else {
	           var msg = '결제에 실패하였습니다.' + '\n';
	            msg += '에러내용 : ' + rsp.error_msg;
	       }       
	       alert(msg);
	   });
	}else{ //무통장입금 체크하고 결제하기 눌렀을 때
		bank=$("#bank option:selected").val();
		alert("무통장입금 접수가 완료되었습니다."+"\n"+"입금계좌 : "+bank+"\n"+"주문접수 후 3일 내 입금바랍니다.");
		
		user_id="${userinfo.user_id}";
		order_name=$("#user_name").val();
		order_mobile=$("#user_mobile").val();
		order_email=$("#user_email").val();
		order_address=$("#sample4_jibunAddress").val();
		
		$.ajax({
       		type:"post",
       		url:"/order/order_insert",
       		dataType:"json",
       		data:{"user_id":user_id, "order_name":order_name, "order_mobile":order_mobile, 
       			  "order_email":order_email, "order_address":order_address, "order_payment":payment},
       		success:function(max_order){
       			$("#carttbl .row").each(function(){
       				var product_id=$(this).find(".product_id").html();
       				var purchase_qtt=$(this).find(".cart_product_qtt").html();
       				$.ajax({
       					type:"post",
       					url:"/order/purchase_insert",
       					data:{"order_number":max_order, "product_id":product_id, "purchase_qtt":purchase_qtt},
       					success:function(){
       						$("#carttbl .row").each(function(){
       							var array=[];
       							var cart_number=$(this).attr("cart_number");
       							var data={"cart_number":cart_number};
       							array.push(data);
       							
       							$.ajax({
       								type:"post",
       								url:"/cart/delete",
       								data:{"cart_number":cart_number},
       								success:function(){
       									location.href="/mypage/all";
       								}
       							});
       						});
       					}
       				});
       			});
       		}
       	});
	}
});

</script>