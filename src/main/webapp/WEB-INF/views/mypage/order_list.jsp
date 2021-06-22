<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/resources/css/mypage.css"/>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
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
		<table id="tbl_order_List"></table>
		<script id="temp_order_List" type="text/x-handlebars-template">
			<tr class="title">
				<td width=100>주문일자</td>
				<td width=200>상품명</td>
        		<td width=50>상품수량</td>
         		<td width=100>상품단가</td>
				<td width=100>금액</td>      	
			</tr>
			{{#each order_List}}
	        <tr class="row">  
				<td>{{order_register_date}}</td>
				<td>{{product_name}}</td>
		        <td>{{purchase_qtt}}개</td>
		        <td>{{nf product_price}}원</td>
				<td>{{nf purchase_sum}}원</td>
	        <tr>
			{{/each}}
		</script>
			<div id="pagination"></div>
	</div>
</div>
<script>
Handlebars.registerHelper("nf", function(price){
    var regexp = /\B(?=(\d{3})+(?!\d))/g; 
    return price.toString().replace(regexp, ",");
});
</script>
<script>
	var page=1;
	var user_id="${vo.user_id}";
	getList();
	
	function getList(){				
		$.ajax({
			type:"get",
			url:"order_List.json",
			dataType:"json",
			data:{"page":page,"user_id":user_id},			
			success:function(data){
				var temp = Handlebars.compile($("#temp_order_List").html());
				$("#tbl_order_List").html(temp(data));	
				//페이징목록출력
				var str="";
				var prev=data.pm.startPage-1;
				var next=data.pm.endPage+1;
            
				if(data.pm.prev) str +="<a href='" + prev + "'>◀</a>";
				for(var i=data.pm.startPage;i<=data.pm.endPage; i++){
					if(i==page){
					   str += "[<a class='active' href='" + i + "'>" + i + "</a>] ";
					}else{
					   str += "[<a href='" + i + "'>" + i + "</a>] ";
					}   
				}
				if(data.pm.next) str +="<a href='" + next + "'>▶</a>";
				$("#pagination").html(str);
				}
			});				
	}
	
	$("#pagination").on("click","a",function(e){
		e.preventDefault();
		page = $(this).attr("href");
		getList();
	});
</script>