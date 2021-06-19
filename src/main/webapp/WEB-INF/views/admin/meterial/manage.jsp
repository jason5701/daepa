<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>재료관리</h2>
	<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
		<tr>
			<td>상품번호</td>
			<td>상품명</td>
			<td>단가</td>
			<td>설명</td>
			<td>배송</td>
			<td>조회수</td>
			<td>판매량</td>
			<td>상태</td>
		</tr>
		{{#each list}}
			<tr>
				<td>{{meterial_id}}</td>
				<td>{{meterial_name}}</td>
				<th>{{meterial_price}}</th>
				<td>{{meterial_description}}</td>
				<td>{{print_deli meterial_delivery}}</td>
				<td>{{meterial_click}}</td>
				<td>{{meterial_selling}}</td>
				<td>{{print_drop meterial_drop}}</td>
			</tr>
		{{/each}}
	</script>
	<script>
		Handlebars.registerHelper("print_drop", function(meterial_drop){
			var drop_status="";
			if(meterial_drop==1) drop_status="판매중지"; else drop_status="판매중"; 
			return drop_status;
		});
		Handlebars.registerHelper("print_deli", function(meterial_delivery){
			var deli_status="";
			if(meterial_delivery==1) deli_status="일반배송"; else deli_status="무료배송"; 
			return deli_status;
		});
	</script>
	<div id="pagination"></div>
	<div class="div_search">
		<input type="text" id="keyword"/>
		<button id="btn_search">검색</button>
	</div>
<script>
	var page=1;
	
	$("#keyword").on("keydown",function(e){
		if(e.keyCode==13) {
			$("#btn_search").click();
		}
	});
	$("#btn_search").on("click",function(){
		var page=1;
		getMeterial_list();
	});
	getMeterial_list();
	function getMeterial_list(){
		var keyword=$("#keyword").val();
		
		$.ajax({
			type:"get",
			url:"/meterial/meterial.json",
			dataType:"json",
			data:{"page":page,"keyword":keyword},
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
		getMeterial_list();
	});
</script>