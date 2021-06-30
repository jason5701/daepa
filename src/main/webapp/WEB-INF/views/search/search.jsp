<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<head>
	<link rel="stylesheet" href="/resources/css/productList.css" />
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>

<%String keyword = request.getParameter("keyword");%>

<div id="all_list">
<c:if test="${count == 0}">
	<h2>"<%=keyword%>" 검색결과</h2>
	<h2 style="color:red; ">검색결과가 없습니다.</h2>
</c:if>
<c:if test="${count > 0}">
	<h2>"<%=keyword%>" 검색결과</h2>
	<span>총 ${count}건이 검색되었습니다.</span>
	<div id="all_plist"></div>
		<script id="ptemp" type="text/x-handlebars-template">
		{{#each plist}}
		<div class="all_product">
			<a href="/meal_detail?product_id={{product_id}}">
				<div class="all_image">
					<img src="/displayFile?fullName={{product_image}}" width=320 height=300/>
				</div>
			</a>
			<div class="all_name">{{product_name}}</div>
			<div class="all_price">{{product_price}}원</div>
		</div>
		{{/each}}
		</script>
		
		<div id="all_mlist"></div>
		<script id="mtemp" type="text/x-handlebars-template">
		{{#each mlist}}
		<div class="all_product">
			<a href="/vege_detail?meterial_id={{meterial_id}}">
				<div class="all_image">
					<img src="/displayFile?fullName={{meterial_image}}" width=320 height=300/>
				</div>
			</a>
			<div class="all_name">{{meterial_name}}</div>
			<div class="all_price">{{meterial_price}}원</div>
		</div>
		{{/each}}
		</script>
</c:if>
</div>
<script>
var keyword="<%=keyword%>";

getPlist();
getMlist();
function getPlist(){
	$.ajax({
		type:"get",
		url:"/search/search_list.json",
		dataType:"json",
		data:{"keyword":keyword},
		success:function(data){
			//alert(keyword);
			console.log(data);
			var temp=Handlebars.compile($("#ptemp").html());
			$("#all_plist").html(temp(data));
		}
	});
}
function getMlist(){
	$.ajax({
		type:"get",
		url:"/search/search_list.json",
		dataType:"json",
		data:{"keyword":keyword},
		success:function(data){
			//alert(keyword);
			console.log(data);
			var temp=Handlebars.compile($("#mtemp").html());
			$("#all_mlist").html(temp(data));
		}
	});
}

</script>
