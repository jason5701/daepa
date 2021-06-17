<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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