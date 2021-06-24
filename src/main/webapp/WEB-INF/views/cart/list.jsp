<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<h2>장바구니</h2>

<section id="content">
 <ul>
  <c:forEach items="${cartList}" var="cartList">
  <li>
   <div class="thumb">
    <img src="${cartList.product_image}" />
   </div>
   <div class="gdsInfo">
    <p>
     <span>상품명 : </span>${cartList.product_name}<br />
     <span>개당 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${cartList.product_price}" /><br />
     <span>구입 수량 : </span>${cartList.cart_product_qtt}<br />
     <span>최종 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${cartList.product_price * cartList.cart_product_qtt}" />
    </p>    
   </div>
  </li>
  </c:forEach>
 </ul>
</section>