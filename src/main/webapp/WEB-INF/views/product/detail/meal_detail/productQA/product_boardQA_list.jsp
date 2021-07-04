<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<title>REVIEW 목록</title>
	<style>
		table{width: 100%;border-collapse: collapse;border-bottom:solid 1px;}
		td{border:solid 1px rgb(200, 200, 200) solid;padding: 10px;text-align: center;}
		.row:hover{cursor:pointer;}
		.row{border-top:solid 1px rgb(200, 200, 200);}
		.title{border-top:2px solid;text-align: center;}
		#pagination1{text-align: center; font-size:12pt; font-weight:bold; }
		#pagination1 a{text-decoration:none; color:#123478;}
		#pagination1 .active{color:#ccc;}
		#product_boardQA_insert{text-align:right;}
		#total{display:none;}
	</style>
</head>
<body>
	<h2>PRODUCT Q&A</h2>
	<ul>
		<li>상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
		<li>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이대파 내 1:1 문의에 남겨주세요.</li>
	</ul>
	<br/>	
		<table id="tbl1"></table>
		<script id="temp1" type="text/x-handlebars-template">
		<tr class="title">
			<td width=100> 순번 </td>
			<td width=100>상품번호</td>
			<td width=400> 제목 </td>
			<td width=100> 작성자 </td>
			<td width=200> 작성일 </td>
			<td width=100> 답변상태 </td>
		</tr>
		{{#each list}}
			<tr class="row" onClick="location.href='/board/boardQA/boardQA_read?boardQA_number={{boardQA_number}}'" style="cursor:pointer;">
				<td>{{boardQA_number}}</td>
				<td>{{product_id}}</td>
				<td>{{boardQA_title}}</td>
		        <td>{{boardQA_writer}}</td>
		        <td>{{boardQA_write_date}}</td>
				<td class="boardQA_click">{{answer_status boardQA_click}}</td>
			</tr>
		{{/each}}	
		</script>
		<div id="product_boardQA_insert">
			<input type="button" class="btn_style" value="상품문의" onClick="location.href='/board/product_boardQA_insert?product_id=${vo.product_id}'"/>
		</div>
		<script>
			Handlebars.registerHelper("answer_status", function(boardQA_click){
				var status="";
				if(boardQA_click==1) status="답변완료"; else status="답변대기"; 
				return status;
			});
		</script>


	<div id="pagination1"></div>
</body>
<script>
	var product_id="${vo.product_id}";
	var page1=1;
	getBoardQA_list();
	
	function getBoardQA_list(){
		$.ajax({
			type:"get",
			url:"/board/product_boardQA_list.json",
			dataType:"json",
			data:{"page":page1,"searchType":product_id},
			success:function(data){
				console.log(data);
				//alert(".............."+product_id);
				var temp = Handlebars.compile($("#temp1").html());
				$("#tbl1").html(temp(data));
				$("#total").html("검색수:" + data.pm.totalCount);
				//페이징목록출력
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
				$("#pagination1").html(str);
         	}
		});
	};
   
	$("#pagination1").on("click","a",function(e){
		e.preventDefault();
		page1 = $(this).attr("href");
		getBoardQA_list();
	});
</script>
</html>