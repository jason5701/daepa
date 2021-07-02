<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/resources/css/mypage.css"/>
    <style>
    table {width: 70%; border-top: 1px solid #444444; margin:10px auto; text-align:center; border-collapse: collapse;}
	tr, td {border-bottom: 1px solid #444444;padding: 10px;}  
	.head_aticle{margin-top:20px;}
	.tit{text-align:left; margin-left:10px;}
	.head_aticle .tit_sub {
    padding-left: 11px;
    padding-bottom: 30px;
    font-size: 14px;
    color: #999;
    text-align:left;
    line-height: 20px;
    letter-spacing: -.3px;
    vertical-align: 3px;
	} 
	.search_date{
	  	position: relative;
	    z-index: 1;
	    float: right;
	    padding-right:300px;    
	} 
    </style>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<div class="mypage_Content_Right">
		<div class="head_aticle">
			<h2 class="tit">주문내역
				<span class="tit_sub">지난 3년간의 주문 내역 조회가 가능합니다</span>
			</h2>
			<div class="search_date">
				<h3 class="screen_out">기간선택</h3>
				<span id="total_Orders"></span>
				<select class="layer_search">
					<option value="all">전체기간</option>
					<option value="2021">2021년</option>
					<option value="2020">2020년</option>
					<option value="2019">2019년</option>
				</select>				
			</div>	
	</div>
	<div class="board-container">
		<table id="tbl_orders"></table>
		<script id="temp_orders" type="text/x-handlebars-template">
			<tr class="title">
				<td width=100>주문번호</td>
				<td width=100>주문일자</td>
				<td width=100>주문자</td>
         		<td width=400>주소</td>
				<td width=100>상태</td>      	
			</tr>
			{{#each orders}}
			<tr class="tr_row" order_number="{{order_number}}">>
				<td>{{order_number}}</td>				
				<td>{{order_register_date}}</td>
				<td>{{order_name}}</td>
				<td>{{order_address}}</td>
				<td>{{d_success order_status}}</td>
			</tr>			
			{{/each}}
		</script>	
			<div id="pagination"></div>
			<br>
		<div class="div_orderList">
			<hr/>
			<h2>주문 목록</h2>
			<table id="tbl_orderList"  style=" background:#ddd; text-align:left;"></table>
			<script id="temp_orderList" type="text/x-handlebars-template">
				<tr class="title">
					<td width=100>상품번호</td>
					<td width=400>상품명</td>
					<td width=100>단가</td>
         			<td width=100>수량</td>
					<td width=100>금액</td>      	
				</tr>
				{{#each orderList}}
				<tr class="row">
					<td>{{product_id}}</td>				
					<td>{{product_name}}</td>
					<td>{{product_price}}</td>
					<td>{{nf purchase_qtt}}</td>			
					<td>{{nf purchase_sum}}</td>
				</tr>			
				{{/each}}		
			</script>
		</div>
	</div>
</div>
<script>
Handlebars.registerHelper("nf", function(price){
    var regexp = /\B(?=(\d{3})+(?!\d))/g; 
    return price.toString().replace(regexp, ",");
});
Handlebars.registerHelper("d_success", function(order_status){
	var order_status="";
	if(order_status==1) {
		order_status="배송완료";
		}else{
		order_status="배송전"; 
		}
	return order_status;
});
</script>
<script>
	var page=1;
	var user_id="${user_info.user_id}";
	var order_number=$("#tbl_orders .tr_row").attr("order_number");
	ordersList();
	
	$(".div_orderList").hide();
	
	$("#tbl_orders").on("click",".tr_row",function(){		
		$(".div_orderList").show();
		var order_number = $(this).attr("order_number");
		purchaseList(order_number);
	});
	
	function ordersList(){	
		$.ajax({			
			type:"get",
			url:"/mypage/orders.json",
			dataType:"json",
			data:{"page":page,"user_id":user_id},			
			success:function(data){
				var temp = Handlebars.compile($("#temp_orders").html());
				$("#tbl_orders").html(temp(data));	
				$("#total_Orders").html("주문 건 수: " + data.pm.totalCount + "건");
				//페이징목록출력
				var str="";
				for(var i=data.pm.startPage; i<=data.pm.endPage; i++){
					if(page==i){
						str+="<a style='color:gray;' href=' "+i+" '>"+i +" </a>";
					}else{
						str+="<a href=' "+i+" '>"+i +" </a>";
					}
				}
				$("#pagination").html(str);
				}
			});				
	}
	function purchaseList(order_number){	
		$.ajax({			
			type:"get",
			url:"/mypage/orderList.json",
			dataType:"json",
			data:{"order_number":order_number,"user_id":user_id},			
			success:function(data){
				console.log();
				var temp = Handlebars.compile($("#temp_orderList").html());
				$("#tbl_orderList").html(temp(data));					
				}
			});				
	}
	
	$("#pagination").on("click","a",function(e){
		e.preventDefault();
		page = $(this).attr("href");
		ordersList();
	});
</script>