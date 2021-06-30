<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h2>주문서</h2>

<table id="carttbl">
	<c:forEach items="${cartList}" var="cartList">
		<tr class="row">
	       <td class="product_id" style="display:none;">${cartList.product_id}</td>
	       <td width=100><img src="/displayFile?fullName=${cartList.product_image}" width=100/></td>
	       <td width=340>${cartList.product_name}</td>
	       <td class="product_price" width=100><fmt:formatNumber pattern="#,###" value="${cartList.product_price}" /></td>
	       <td width=340>${cartList.cart_product_qtt}</td>
	    </tr>
	</c:forEach>
</table><br/>  

<div id="total">
   <div>총 상품금액 : <fmt:formatNumber pattern="#,###" value="${total}" />원</div>
   <div>배송비 : <fmt:formatNumber pattern="#,###" value="${fee}" />원</div><br/>  
   
   <div>총 결제예상금액 : <fmt:formatNumber pattern="#,###" value="${total+fee}" />원</div>
</div><br/><hr/><br/>

<form name="frm">
주문자 : <input type="text" value="${userinfo.user_name}"/><br/>
휴대폰 : <input type="text" value="${userinfo.user_mobile}"/><br/>
이메일 : <input type="text" value="${userinfo.user_email}"/><br/>

배송지 : <input type="text" value="${userinfo.user_address}"/><br/>
상세주소 : <input type="text" value="${userinfo.user_address_detail1}"/><br/>
<br/>
<input type="submit" value="결제하기"/>
<input type="reset" value="주문취소"/>
</form>

<script>
	
</script>