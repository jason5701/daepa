<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<link rel="stylesheet" href="/resources/css/productList.css" />
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>

<div id="allCategoryList">
	<h2>공동구매</h2>
	<ul class="categoryList">
		<li>
			<a class="">전체보기</a>
		</li>
		<li>
			<a class="">1인밀키트/완제품</a>
		</li>
		<li>
			<a class="">재료</a>
		</li>
	</ul>
</div>
<div id="all_list">
	<h2>공동구매</h2>
	<div id="group_list_div" class="all_product">
	<script id="temp" type="text/x-handlebars-template">
		{{#each list}}
			<div class="all_image"><img src="/displayFile?fullName={{meterial_image}}" width=320 height=300/></div>
			<div class="all_name">{{sales_name}}</div>
			<div class="all_price">나눔가격 : {{sales_price}}원</div>
			<div class="all_detail">나눔오프너 : {{user_id}}</div>
		{{/each}}
	</script>
	<div id="pagination"></div>
</div>
<script>
	getGroup_sales();
	function getGroup_sales(){
		$.ajax({
			type:"get",
			url:"/group_sell/sales_list.json",
			dataType:"json",
			success:function(data){
				var temp=Handlebars.compile($("#temp").html());
				$("#group_list_div").html(temp(data));
			}
		});
	}
</script>

