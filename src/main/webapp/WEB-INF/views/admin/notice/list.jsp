<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
 #pagination{text-align: center; margin-top:10px;}
 #pagination a{text-decoration:none; color:#123478;font-weight:bold;}
 #pagination .active{color:#ccc}
</style>
<div class="head_aticle">
	<h2 class="tit">공지사항</h2>
	<div>
		<div class="div_container" style="float:left;">
			<div class="div_checkbox">
				<select id="type">
					<option value="notice_title">제목</option>
					<option value="notice_contents">내용</option>
				</select>
				<input type="text" class="admin_text" id="keyword"/>
				<button class="btn_admin" id="btn_search">검색</button>
			</div>		
		</div>
		<span style="float:right;">	
			<c:if test="${admin_id!=null}">
				<div>
					<button class="btn_admin" onClick="location.href='/board/admin_notice_insert'">글쓰기</button>	
				</div>
			</c:if>
		</span>
	</div>
	<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
		<tr style="background:#fafafa; font-weight:bold;">
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		{{#each list}}
			<tr onClick="location.href='/board/admin_notice_read?notice_number={{notice_number}}'" style="font-weight:bold;">
				<td>{{notice_number}}</td>
				<td>{{notice_title}}</td>
				<th>{{notice_writer}}</th>
				<td>{{notice_write_date}}</td>
				<td>{{notice_click}}</td>
			</tr>
		{{/each}}
	</script>
	<div id="pagination"></div>	
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
		getNotice();
	});
	getNotice();
	function getNotice(){
		var type=$("#type").val();
		var keyword=$("#keyword").val();
		//alert("111");
		$.ajax({
			type:"get",
			url:"/board/admin_notice.json",
			dataType:"json",
			data:{"page":page,"keyword":keyword,"searchType":type},			
			success:function(data){
				var temp=Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
				var str="";
				var prev=data.pm.startPage-1;
				var next=data.pm.endPage+1;
				
				if(data.pm.prev) str+="<a href='"+prev+"'>◀</a>";
				for(var i=data.pm.startPage; i<=data.pm.endPage; i++){
					if(i==page){
						str+="<a style='color:#ccc;' href='"+i+"'>&nbsp&nbsp"+i+"&nbsp&nbsp</a>"
					}else{
						str+="<a href='"+i+"'>&nbsp&nbsp"+i+"&nbsp&nbsp</a>"
					}
				}
				if(data.pm.next) str+="<a href='"+next+"'>▶</a>";
				
				$("#pagination").html(str);
			}
		});
	}
	$("#pagination").on("click","a",function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getNotice();
	});
</script>