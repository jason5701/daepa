<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/resources/css/mypage.css"/>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<div class="mypage_Content_Right">
	<div class="head_aticle">
		<h2 class="tit">주문내역
			<span class="tit_sub">지난 3년간의 주문 내역 조회가 가능합니다</span>
		</h2>
		<div class="search_date">
			<h3 class="screen_out">기간선택</h3>
			<select class="layer_search">
				<option value="all">전체기간</option>
				<option value="2021">2021년</option>
				<option value="2020">2020년</option>
				<option value="2019">2019년</option>
			</select>
		</div>	
	</div>
<div class="board-container">
		<table id="tbl_orderList"></table>
		<script id="temp_orderList" type="text/x-handlebars-template">
			<tr class="title">
				<td width=100>주문일자</td>
				<td width=200>상품명</td>
        		<td width=50>상품수량</td>
         		<td width=100>상품단가</td>
				<td width=100>금액</td>      	
			</tr>
			{{#each orderList}}
	        <tr class="row">  
				<td>{{order_register_date}}</td>
				<td>{{product_name}}</td>
		        <td>{{purchase_qtt}}개</td>
		        <td>{{product_price}}원</td>
				<td>{{order_sum}}원</td>
	        <tr>
			{{/each}}
		</script>
			<div id="pagination"></div>
	</div>
</div>

<script>
	var page=1;
	var user_id="${vo.user_id}";
	getList();
	
	function getList(){				
		$.ajax({
			type:"get",
			url:"orderList.json",
			dataType:"json",
			data:{"page":page,"user_id":user_id},			
			success:function(data){
				console.log(data);
				var temp = Handlebars.compile($("#temp_orderList").html());
				$("#tbl_orderList").html(temp(data));
				}
			});				
	}
	
	
</script>