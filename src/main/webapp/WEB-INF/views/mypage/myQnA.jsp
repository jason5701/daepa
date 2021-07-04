<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
       .page_section{width:810px;float:right;}
      table{width: 100%;border-collapse: collapse;border-bottom:solid 1px;}
      td{border:solid 1px rgb(200, 200, 200) solid;padding: 10px;text-align: center;}
      .row:hover{background: rgb(200, 200, 200);color: white;}
      .row{border-top:solid 1px rgb(200, 200, 200);}
      .title{border-top:2px solid;text-align: center;}
      #pagination{text-align: center;}
      #pagination a{text-decoration:none; color:black}
      #pagination .active{color:red}
      #total{display:none;}
   </style>
<div class="page_section">
	<div class="head_aticle">
		<br/>
		<h2 class="tit">상품문의<br>
			<span class="tit_sub_qna">
				· 배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이대파 내 1:1문의에 남겨주세요.
			</span>
		</h2>
		<br/><br/>	
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
		
		<script>
			Handlebars.registerHelper("answer_status", function(boardQA_click){
				var status="";
				if(boardQA_click==1) status="답변완료"; else status="답변대기"; 
				return status;
			});
		</script>
	<br/><br/>	
	<div id="pagination"></div>
	</div>	
</div>

<script>
	var user_id="${user_info.user_id}";
	var page=1;
	getBoardQA_list();
	function getBoardQA_list(){
		$.ajax({
			type:"get",
			url:"/board/user_boardQA_list.json",
			dataType:"json",
			data:{"page":page,"searchType":user_id},
			success:function(data){
				console.log(data);
				//alert(".............."+user_id);
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
				$("#pagination").html(str);
         	}
		});
	};
   
	$("#pagination").on("click","a",function(e){
		e.preventDefault();
		page1 = $(this).attr("href");
		getBoardQA_list();
	});
</script>
