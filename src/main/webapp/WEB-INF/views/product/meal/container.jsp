<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<link rel="stylesheet" href="/resources/css/productList.css" />
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>

<div id="allCategoryList">
	<h2>1인 밀키트</h2>
	<ul id="category_list" class="categoryList">
		<c:forEach items="${type}" var="vo">
			<li>
				<a class="typse">${vo}</a>
			</li>
		</c:forEach>
		<li>
			<select id="orderBy">
				<option value="product_register desc">신상품순</option>
				<option value="product_selling desc">인기상품순</option>
				<option value="product_price desc">높은 가격순</option>
				<option value="product_price">낮은 가격순</option>
			</select>
		</li>
	</ul>
</div>

<div>
	<jsp:include page="${product_list}"></jsp:include>
</div>
