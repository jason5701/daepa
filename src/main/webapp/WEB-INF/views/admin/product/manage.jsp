<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<h2>상품관리</h2>
	<select id="main_meterial">
			 <option value="전체">전체상품</option>
		<c:forEach items="${main_list}" var="vo">
			<option value="${vo}">${vo}</option>
		</c:forEach>
	</select>
	<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
		<tr>
			<td>상품번호</td>
			<td>상품명</td>
			<td>단가</td>
			<td>재고</td>
			<td>성분</td>
			<td>배송</td>
			<td>조회수</td>
			<td>판매량</td>
			<td>상태</td>
		</tr>
		{{#each list}}
			<tr>
				<td>{{product_id}}</td>
				<td>{{product_name}}</td>
				<th>{{product_price}}</th>
				<td>{{product_qtt}}</td>
				<td>{{product_detail}}</td>
				<td>{{print_delivery product_delivery}}</td>
				<td>{{product_click}}</td>
				<td>{{product_selling}}</td>
				<td>{{print_drop product_drop}}</td>
			</tr>
		{{/each}}
	</script>
	<script>
		Handlebars.registerHelper("print_drop", function(product_drop){
			var drop_status="";
			if(product_drop==1) drop_status="판매중지"; else drop_status="판매중"; 
			return drop_status;
		});
		Handlebars.registerHelper("print_delivery", function(product_delivery){
			var delivery_status="";
			if(product_delivery==1) delivery_status="일반배송"; else delivery_status="무료배송"; 
			return delivery_status;
		});
	</script>
	<div id="pagination"></div>
	<div class="div_search">
		<input type="text" id="keyword"/>
		<button id="btn_search">검색</button>
	</div>
<script>
	var page=1;
	
	$("#main_meterial").on("change",function(){
		getProduct_list();
	});
	$("#keyword").on("keydown",function(e){
		if(e.keyCode==13) {
			$("#btn_search").click();
		}
	});
	$("#btn_search").on("click",function(){
		var page=1;
		getProduct_list();
	});
	getProduct_list();
	function getProduct_list(){
		var keyword=$("#keyword").val();
		var type=$("#main_meterial").val();
		$.ajax({
			type:"get",
			url:"/product/admin_product.json",
			dataType:"json",
			data:{"page":page,"keyword":keyword,"searchType":type},
			success:function(data){
				console.log(data);
				var temp=Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
				
				var str="";
				for(var i=data.pm.startPage;i<=data.pm.endPage;i++){
					if(i==page){
						str+="<a style='color:red;' href='"+i+"'>"+i +"</a>";
					}else{
						str+="<a href='"+i+"'>"+i +"</a>";
					}
				}
				
				$("#pagination").html(str);
			}
		});
	}
	$("#pagination").on("click","a",function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getProduct_list();
	});
</script>