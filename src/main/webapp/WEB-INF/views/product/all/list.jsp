<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<link rel="stylesheet" href="/resources/css/productList.css" />
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>

<div id="allCategoryList">
	<h2>전체 상품</h2>
	<ul class="categoryList">
		<li>
			<a href="all_product">전체보기</a>
		</li>
		<li>
			<a href="all/meal">1인밀키트/완제품</a>
		</li>
		<li>
			<a href="/all/meat">육류</a>
		</li>
		<li>
			<a href="/all/sea">해산물</a>
		</li>
		<li>
			<a href="/all/vegetable">채소/과일</a>
		</li>
		<li>
			<a href="/all/seasoning">양념/조미료</a>
		</li>
	</ul>
</div>
<div id="all_list">
	<div class="all_list_div">
		<div class="all_product">
			<a href="/detail">
				<div class="all_image">
					<img src="" />
				</div>
			</a>
			<div class="all_name">상품명</div>
			<div class="all_detail">상품설명</div>
			<div class="all_price">상품가격</div>
		</div>
	</div>
</div>