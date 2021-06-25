<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h2>장바구니</h2>

<div class="allCheck">
	<input type="checkbox" name="chkAll" id="chkAll" /><label for="chkAll">모두 선택</label> 
</div>
<div class="delBtn">
	<button type="button" class="selectDelete_btn">선택 삭제</button> 
</div>
<table border=1 id="carttbl">
	<c:forEach items="${cartList}" var="cartList">
	<tr class="row">
		<td width=100><input type="checkbox" name="chk" class="chk" data-cartNum="${cartList.cart_number}" /></td>
		<td><img src="/displayFile?fullName=${cartList.product_image}" width=100/></td>
		<td>${cartList.product_name}</td>
		<td width=100><fmt:formatNumber pattern="###,###,###" value="${cartList.product_price}" /></td>
		<td width=100>
		<dl class="list fst">
			<dt class="tit">구매수량</dt> 
			<dd class="qtt">
			  <a id="qtt_down"><img src="/resources/image/index/minus.png"/></a>
			  <span id="product_qtt">${cartList.cart_product_qtt}</span>
			  <a id="qtt_up"><img src="/resources/image/index/plus.png"/></a>
			</dd>
		</dl></td>
	</tr>
	<tr>
		<td colspan=4><fmt:formatNumber pattern="###,###,###" value="${cartList.product_price * cartList.cart_product_qtt}" /></td>
		<td><button type="button" class="delete_btn" data-cartNum="${cartList.cart_number}">삭제</button></td>
	</tr>
	</c:forEach>
</table>

<script>
$("#carttbl").on("click", ".delete_btn", function(){
	var cart_number=$(this).attr("data-cartNum");
	//alert(cart_number);
	if(!confirm("삭제할까요?")) return;
	$.ajax({
		type:"post",
		url:"/cart/delete",
		data:{"cart_number":cart_number},
		success:function(){
			alert("삭제완료!");
			location.href="/cart/list";
		}
	});
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

//수량업다운 스크립트
$(function(){
	$('#qtt_down').click(function(e){
		e.preventDefault();
		var stat = $('#product_qtt').text();
		var num = parseInt(stat,10);
		num--;
		if(num<=0){
			alert('더 이상 줄일 수 없습니다.');
			num=1;
		}
		$('#product_qtt').text(num);
		$("#meterial_sum").html(meterial_price*num);
	});
	
	$('#qtt_up').click(function(e){
		e.preventDefault();
		var stat = $('#product_qtt').text();
		var num = parseInt(stat,10);
		num++;
		if(num>100){
			alert('더 이상 늘릴 수 없습니다.');
			num=100;
		}
		$('#product_qtt').text(num);
	});
});
</script>