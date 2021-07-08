<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <style>
 table {width: 100%; border-top: 2px solid black; margin:10px auto; text-align:center; font-weight:bold; border-collapse: collapse;}
   tr, td {border-bottom: 1px solid #444444;padding: 10px;}  
 #pagination{text-align: center; margin-top:10px;}
 #pagination a{text-decoration:none; color:#123478;font-weight:bold;}
 #pagination .active{color:#ccc}
</style>
<h2>주문 내역</h2>
<div id="div_orders">
<table id="tbl"></table>		
<script id="temp" type="text/x-handlebars-template">
		<tr class="title" style="background:#fafafa;">
			<td width=20>주문번호</td>
			<td width=50>회원아이디</td>
			<td width=30>주문인</td>
			<td width=80>주문날짜</td>
			<td width=100>주소</td>
			<td width=50>전화번호</td>
			<td width=20>결제수단</td>
			<td width=50>배송상태</td>
		</tr>
	{{#each admin_list}}
		<tr class="tr_row" order_number="{{order_number}}"  order_status="{{order_status}}">
			<td>{{order_number}}</td>
			<td>{{user_id}}</td>
			<td>{{order_name}}</td>
			<td>{{order_register_date}}</td>
			<td>{{order_address}}</td>
			<td>{{order_mobile}}</td>
			<td>{{pm order_payment}}</td>
			<td>{{d_success order_status}}</td>
		</tr>	
	{{/each}}
</script>
<div id="pagination"></div>
	<div class="div_orderList">
			<hr/>
			<h3 style="margin:10px auto; padding-left:10px;">주문 목록<button id="btnSend" class="btn_admin" style="float:right; margin-left:20px;">배송</button></h3>
			<table id="tbl_purchase_List"  style="text-align:center;"></table>
			<script id="temp_purchase_List" type="text/x-handlebars-template">
				<tr class="title" style="background:#fafafa;">
					<td width=50>주문번호</td>
					<td width=100>상품번호</td>
					<td width=400>상품명</td>
					<td width=100>단가</td>
         			<td width=100>수량</td>
					<td width=100>금액</td>      	
				</tr>
				{{#each purchase_List}}
				<tr class="row">
					<td>{{order_number}}</td>
					<td>{{product_id}}</td>				
					<td>{{product_name}}</td>
					<td>{{product_price}}원</td>
					<td>{{nf purchase_qtt}}개</td>			
					<td>{{nf purchase_sum}}원</td>
				</tr>			
				{{/each}}		
			</script>
		</div>
</div>
<script>
Handlebars.registerHelper("nf", function(price){
    var regexp = /\B(?=(\d{3})+(?!\d))/g; 
    return price.toString().replace(regexp, ",");
});
Handlebars.registerHelper("d_success", function(order_status){
	var status="";
	if(order_status==1) status="배송완료"; else status="배송전"; 
	return status;
});
Handlebars.registerHelper("pm", function(order_payment){
	var payment="";
	if(order_payment==1) payment="카드"; else payment="현금"; 
	return payment;
});
</script>
<script>
	var page=1;
	var order_number=$("#tbl .tr_row").attr("order_number");
	getOrder_list();	
	$(".div_orderList").hide();
	
	$("#tbl").on("click",".tr_row",function(){	
		$(".div_orderList").show();
		var order_number = $(this).attr("order_number");
		var order_status = $(this).attr("order_status");
		purchaseList(order_number);		
		$("#btnSend").on("click",function(){	
				alert("주문번호 : " + order_number + "을 배송 처리하시겠습니까?");
				if(order_status==1){
					alert("이미 배송이 완료된 주문건 입니다.");
					return;
				}else if(order_status==0){
						$.ajax({
							type:"post",
							url:"/order/update_orderstatus",
							data:{"order_number":order_number,"page":page},
							success:function(){	
								alert("배송처리 완료하였습니다.");
								location.href="/admin/orders"
						}				
				});	
			}
		});		
	});
	
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
	               var prev=data.pm.startPage-1;
	               var next=data.pm.endPage+1;  
	               if(data.pm.prev) str +="<a href='" + prev + "'>◀</a>";
	               for(var i=data.pm.startPage;i<=data.pm.endPage; i++){
	                  if(i==page){
	                     str += "<a class='active' href='" + i + "'>&nbsp&nbsp" + i + "&nbsp&nbsp</a> ";
	                  }else{
	                        str += "<a href='" + i + "'>&nbsp&nbsp" + i + "&nbsp&nbsp</a> ";
	                  }   
	               }
	               if(data.pm.next) str +="<a href='" + next + "'>▶</a>";
				$("#pagination").html(str);
			}
		});
	}	
	function purchaseList(order_number){		
		$.ajax({			
			type:"get",
			url:"/order/admin_purchase_List.json",
			dataType:"json",
			data:{"order_number":order_number},			
			success:function(data){
				var temp = Handlebars.compile($("#temp_purchase_List").html());
				$("#tbl_purchase_List").html(temp(data));					
				}
			});				
	}
	
	$("#pagination").on("click","a",function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getOrder_list();
	});
</script>