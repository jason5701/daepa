<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>핫딜</h2>
<table id="tbl"></table>
<script id="temp" type="text/x-handlebars-template">
	<tr style="background:#fafafa;">
		<td>번호</td>
		<td>제목</td>
		<td>시작</td>
		<td>마감</td>
		<td>오프너</td>
	</tr>
	{{#each list}}
		<tr class="tr_row" hotdeal_number={{hotdeal_number}}>
			<td>{{hotdeal_number}}</td>
			<td>{{hotdeal_title}}</td>
			<td>{{hotdeal_start}}</td>
			<td>{{hotdeal_end}}</td>
			<td>{{hotdeal_writer}}</td>
		</tr>
		<tr class="row" style="display:none;">
			<td colspan=5 >{{hotdeal_contents}}</td>
		</tr>
	{{/each}}
</script>
<table id="tbl_detail"></table>
<script id="temp_detail" type="text/x-handlebars-template">

	{{#each .}}
		<tr>
			<td>{{product_name}}</td>
		</tr>
	{{/each}}	

</script>
<div id="pagination"></div>
<script>
	var page=1;
	$("#tbl").on("click",".tr_row",function(){
		$(this).next().toggle();
		var hotdeal_number=$(this).attr("hotdeal_number");
		alert(hotdeal_number);
	});
	function getHotdeal_detail(){
		$.ajax({
			type:"get",
			url:"/admin/hotdeal_detail.json",
			dataType:"json",
			data:{"hotdeal_number":hotdeal_number},
			success:function(data){
				var temp_detail=Handlebars.compile($("#temp_detail").html());
				$("#tbl_detail").html(temp_detail(data));
			}
		});
	}
	getHotdeal();
	function getHotdeal(){
		$.ajax({
			type:"get",
			url:"/admin/hotdeal.json",
			dataType:"json",
			success:function(data){
				var temp=Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
			}
		});
	}
</script>