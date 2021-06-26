<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h2>장바구니</h2>

<div id="chkBox">
	<input type="checkbox" name="chkAll" id="chkAll" /><label for="chkAll">모두 선택</label> 
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
			<input type="text" id="product_qtt" value="${cartList.cart_product_qtt}">
			<input type="button" class="qtt_btn" value="수정">
		</td>
	</tr>
	<tr>
		<td colspan=4><fmt:formatNumber pattern="###,###,###" value="${cartList.product_price * cartList.cart_product_qtt}" /></td>
		<td><input type="button" class="delete_btn" data-cartNum="${cartList.cart_number}" value="삭제"></td>
	</tr>
	</c:forEach>
</table>

<script>
//수정버튼 클릭 시
$("#carttbl").on("click", ".qtt_btn", function(){
	var product_qtt=$("#product_qtt").val();
});


//각 삭제버튼 클릭 시
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

//선택삭제버튼 클릭 시
$("#chkBox").on("click", ".selectDelete_btn", function(){
	if($("#carttbl .row .chk:checked").length==0){
		alert("선택한 상품이 없습니다.");
	}
	
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
	alert("삭제완료!");
	location.href="/cart/list";
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