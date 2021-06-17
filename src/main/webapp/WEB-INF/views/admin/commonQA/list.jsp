<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h2>자주하는질문</h2>
<c:if test="${admin_id!=null}">
	<div>
		<button onClick="location.href='/board/admin_commonQA_insert'">글쓰기</button>	
	</div>
</c:if>
<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
		<tr>
			<td>번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>수정</td>
		</tr>
		{{#each list}}
			<tr class="tr_row">
				<td>{{commonQA_number}}</td>
				<th>{{commonQA_writer}}</th>
				<td>{{commonQA_title}}</td>
			</tr>
			<tr class="row" style="display:none;">
				<td colspan=3>{{commonQA_contents}}</td>
			</tr>
		{{/each}}
	</script>
	<div id="pagination"></div>
	<div class="div_container">
		<div class="div_checkbox">
			<select id="type">
				<option value="commonQA_title">제목</option>
				<option value="commonQA_contents">내용</option>
			</select>
		</div>
		<div class="div_search">
			<input type="text" id="keyword"/>
			<button id="btn_search">검색</button>
		</div>
	</div>
<script>
	var page=1;
	$("#tbl").on("click",".tr_row",function(){
		if($("#tbl .row").css("display")=="none"){
			$(this).next().show();
			$(this).next().css("display:block;");
		}else{
			$(this).next().hide();
			$(this).next().css("display:none;");
		}
		
	});
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
			url:"/board/admin_commonQA.json",
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
						str+="<a style='color:red;' href='"+i+"'>"+i+"</a>"
					}else{
						str+="<a href='"+i+"'>"+i+"</a>"
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