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
	
	배송지 : <input type="text" id="user_address" value="${userinfo.user_road_address}"/><br/>
	상세주소 : <input type="text" id="user_address_detail1" value="${userinfo.user_address_detail1}"/><br/>
	<br/>
	<label><input type="radio" id="kakaopay" name="order_payment" value="1" checked />카카오페이</label>
	<label><input type="radio" id="account" name="order_payment" value="0" />무통장입금</label>
	<select id="bank">
		<option value="" selected>ㅡㅡ계좌를 선택해주세요ㅡㅡ</option>
		<option value="신한은행 123123123">신한은행 123123123</option>
		<option value="우리은행 123123123">우리은행 123123123</option>
		<option value="기업은행 123123123">기업은행 123123123</option>
	</select><br/><br/>
	<input type="button" id="btnKakao" value="결제하기"/>
	<input type="button" id="reset"  value="주문취소"/>
</form>

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
				var order_address=$("#user_address").val()+" "+$("#user_address_detail1").val();
	           
	           $.ajax({
	       		type:"post",
	       		url:"/order/order_insert",
	       		dataType:"json",
	       		data:{"user_id":user_id, "order_name":order_name, "order_mobile":order_mobile, 
	       			  "order_email":order_email, "order_address":order_address},
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
		order_address=$("#user_address").val()+" "+$("#user_address_detail1").val();
		
		$.ajax({
       		type:"post",
       		url:"/order/order_insert",
       		dataType:"json",
       		data:{"user_id":user_id, "order_name":order_name, "order_mobile":order_mobile, 
       			  "order_email":order_email, "order_address":order_address},
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