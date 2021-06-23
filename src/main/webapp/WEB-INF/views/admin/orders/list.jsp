<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>주문 내역</h2>
<table id="tbl"></table>
<script id="temp" type="text/x-handlebars-template">
	{{#each list}}
		<tr class="tr_row">
			<td>{{order_number}}</td>
			<td>{{user_id}}</td>
			<td>{{order_name}}</td>
			<td>{{order_register_date}}</td>
			<td>{{order_address}}</td>
			<td>{{order_email}}</td>
			<td>{{order_mobile}}</td>
			<td>{{order_payment}}</td>
			<td>{{order_status}}</td>
		</tr>
		<tr class="row" style="display:none;">
			<td>주문상품아이디</td>
			<td>{{product_id}}</td>
			<td>주문상품명</td>
			<td>{{product_name}}</td>
			<td>주문수량</td>
			<td>{{purchase_qtt}}</td>
			<td>상품단가</td>
			<td>{{product_price}}</td>
		</tr>
	{{/each}}
</script>
<div id="pagination"></div>
<script>
	var page=1;
	$("#tbl").on("click",".tr_row",function(){
		$(this).next().toggle();
	});
	getOrder_list();
	function getOrder_list(){
		$.ajax({
			type:"get",
			url:"/order/admin_list.json",
			dataType:"json",
			data:{"page":page},
			success:function(data){
				var temp=Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
				
				var str="";
				for(var i=data.pm.startPage; i<=data.pm.endPage; i++){
					if(page==i){
						str+="<a style='color:red;' href='"+i+"'>"+i+"</a>";
					}else{
						str+="<a href='"+i+"'>"+i+"</a>";
					}
				}
				$("#pagination").html(str);
			}
		});
	}
	$("#pagination").on("click","a",function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getOrder_list();
	});
</script>