<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/resources/css/cart.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<div id="cart">
   <c:if test="${cartList.size() == 0}">
      <h2>장바구니</h2><br/>
      <h3>장바구니에 담긴 상품이 없어요.</h3>         
   </c:if>
   <c:if test="${cartList.size() > 0}">
   <h2>장바구니</h2><br/>
   <div id="cart1">
      <div class="chkBox">
         <input type="checkbox" name="chkAll" id="chkAll" /><label for="chkAll">모두 선택</label> 
         <button type="button" class="selectDelete_btn">선택 삭제</button> 
      </div><br/>
      <table id="carttbl">
         <c:forEach items="${cartList}" var="cartList">
         <tr class="row">
            <td class="product_id" style="display:none;">${cartList.product_id}</td>
            <td width=50><input type="checkbox" name="chk" class="chk" data-cartNum="${cartList.cart_number}" /></td>
            <td width=100><img src="/displayFile?fullName=${cartList.product_image}" width=100/></td>
            <td width=340>${cartList.product_name}</td>
            <td width=100><fmt:formatNumber pattern="#,###" value="${cartList.product_price}" /></td>
            <td width=150>
               <input type="text" id="product_qtt" size=2 value="${cartList.cart_product_qtt}">
               <input type="button" class="qtt_btn" value="수정">
               <input type="button" class="delete_btn" data-cartNum="${cartList.cart_number}" value="삭제">
            </td>
         </tr>
         <tr>
            <td colspan=5><fmt:formatNumber pattern="#,###" value="${cartList.product_price * cartList.cart_product_qtt}" /></td>
            </tr>
         </c:forEach>
      </table>
   </div>
   <div id="cart2">
   <h3>Check!</h3><br/>
      <div id="total">         
         <div>총 상품금액 : <fmt:formatNumber pattern="#,###" value="${total}" />원</div>
         <div>배송비 : <fmt:formatNumber pattern="#,###" value="${fee}" />원</div><br/>
         
         <span>상품금액 5만원 미만 구매 시,</span>
         <span>배송비 2,500원이 부담됩니다.</span><br/>
         <br/><hr/><br/>
         <div>총 결제예상금액 : <fmt:formatNumber pattern="#,###" value="${total+fee}" />원</div>
      </div>
      <button type="button" id="btnKakao">결제하기</button>
   </div>
   </c:if>
</div>
<script>
$("#btnKakao").click(function(){
	var IMP = window.IMP;
	//가맹점 식별코드
	IMP.init('imp09790492');
	IMP.request_pay({
	    pg : 'kakao',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
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
	    	var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
});
</script>
<script>
//수정버튼 클릭 시
$("#carttbl").on("click", ".qtt_btn", function(){
   var row=$(this).parent();
   var product_qtt=row.find("#product_qtt").val();
   var rows=$(this).parent().parent();
   var product_id=rows.find(".product_id").html();
   //alert(product_id);
   //alert(product_qtt);
   
   if(product_qtt < 1){
      alert("수량은 1개 이상 구매해주세요.")
      row.find("#product_qtt").val(1);
      product_qtt=1;
      
      $.ajax({
         type:"post",
         url:"/cart/update",
         data:{"cart_product_qtt":product_qtt, "product_id":product_id},
         success:function(){
            location.href="/cart/list";
         }
      });
   }else{
      if(!confirm("수량을 수정할까요?")) return;
      
      $.ajax({
         type:"post",
         url:"/cart/update",
         data:{"cart_product_qtt":product_qtt, "product_id":product_id},
         success:function(){
            alert("수량 수정이 완료되었습니다.");
            location.href="/cart/list";
         }
      });
   }
});


//각 삭제버튼 클릭 시
$("#carttbl").on("click", ".delete_btn", function(){
   var cart_number=$(this).attr("data-cartNum");
   //alert(cart_number);
   if(!confirm("해당 상품을 장바구니에서 삭제할까요?")) return;
   $.ajax({
      type:"post",
      url:"/cart/delete",
      data:{"cart_number":cart_number},
      success:function(){
         alert("상품 삭제가 완료되었습니다.");
         location.href="/cart/list";
      }
   });
});

//선택삭제버튼 클릭 시
$(".chkBox").on("click", ".selectDelete_btn", function(){
   if($("#carttbl .row .chk:checked").length==0){
      alert("선택한 상품이 없습니다.");
   }else if($("#carttbl .row .chk:checked").length!=0){
      if(!confirm("선택한 상품을 삭제할까요?")) return;
         
         $("#carttbl .row .chk:checked").each(function(){
         var array=[];
         cart_number=$(this).attr("data-cartNum");
         var data={"cart_number":cart_number};
         array.push(data);
         
         $.ajax({
            type:"post",
            url:"/cart/delete",
            data:{"cart_number":cart_number},
            success:function(){
            }
         });
      });
      alert("선택한 상품의 삭제가 완료되었습니다.");
      location.href="/cart/list";
   }
});

//전체체크박스 클릭 시
$("#chkAll").on("click", function(){
   if($(this).is(":checked")){
      $("#carttbl .row .chk").each(function(){
         $(this).prop("checked", true);
      });
   }else{
      $("#carttbl .row .chk").each(function(){
         $(this).prop("checked", false);
      });
   }
});

//각 체크박스 클릭 시
$("#carttbl").on("click", ".row .chk", function(){
   var num1=$("#carttbl .row .chk").length;
   var num2=$("#carttbl .row .chk:checked").length;
   if(num1==num2){
      $("#chkAll").prop("checked", true);
   }else{
      $("#chkAll").prop("checked", false);
   }
});
</script>