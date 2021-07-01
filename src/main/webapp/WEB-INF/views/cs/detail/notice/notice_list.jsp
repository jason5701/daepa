<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
		table{width:100%;border-collapse: collapse;border-bottom:solid 1px; font-size:13px;}
		td{border:solid 1px rgb(200, 200, 200) solid;padding: 10px;text-align: center;}
		.row:hover{background: rgb(200, 200, 200);color: white;}
		.row{border-top:solid 1px rgb(200, 200, 200);}
		.title{border-top:2px solid;text-align: center;}
		#pagination{text-align: center;}
		#pagination a{text-decoration:none; color:black}
		#pagination .active{color:red}
		#review_insert{text-align:right;}
		.tit{font-size:28px; float:left;}
		.titSub{font-size:12px;}
		#total{display:none;}
	</style>
<div>
	<h2 class="tit">공지사항</h2>
	<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
		<tr class="title">
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		{{#each notice_hashmap}}
			<tr class="row" onClick="location.href='/board/notice/read?notice_number={{notice_number}}'" style="cursor:pointer;">
				<td>{{notice_number}}</td>
				<td>{{notice_title}}</td>
				<td>{{notice_writer}}</td>
				<td>{{notice_write_date}}</td>
				<td>{{notice_click}}</td>
			</tr>
		{{/each}}
	</script>
</div>
<br/>
<div id="pagination"></div>

<script>
	var page=1;
	
		getList();
		function getList(){
			var notice_no="${vo.notice_number}";
			$.ajax({
				
				type : "get",
				url : "/board/notice/list.json",
				dataType : "json",
				data : {"page":page},
				success : function(data){
					//alert("notice_list페이지");
					var temp = Handlebars.compile($("#temp").html());
					$("#tbl").html(temp(data));
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
		   };
		   
		   $("#pagination").on("click","a",function(e){
		      e.preventDefault();
		      page = $(this).attr("href");
		      getList();
		   });

</script>