<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
 table {width: 100%; border-top: 2px solid black; margin:10px auto; text-align:center; font-weight:bold; border-collapse: collapse;}
   tr, td {border-bottom: 1px solid #444444;padding: 10px;}  
 #pagination{text-align: center; margin-top:10px;}
 #pagination a{text-decoration:none; color:#123478; font-weight:bold;}
 #pagination .active{color:#ccc}
</style>
<h2>제 안</h2>
<div>
	<span id="total"></span>
</div>
<div>
	<table id="tbl">
		<tr style="background:#fafafa; font-weight:bold;">
			<td>번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>작성일</td>
			<td>확인</td>
		</tr>
		<c:forEach items="${list}" var="vo">
			<tr class="row" suggestion_number="${vo.suggestion_number}">
				<td>${vo.suggestion_number}</td>
				<td>${vo.user_id}</td>
				<td>${vo.suggestion_title}</td>
				<td><fmt:formatDate value="${vo.suggestion_write_date}" pattern="yyyy-MM-dd"/></td>
				<td>
					<c:if test="${vo.suggestion_click==0}">
						미확인
					</c:if>
					<c:if test="${vo.suggestion_click!=0}">
						확인
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
<div>
	<div id="pagination">
		<c:if test="${pm.prev}">
			<span page="${pm.startPage-1}">◀</span>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			<c:if test="${i!=cri.page}">
				<span style="color:#123478; font-weight:bold;" page="${i}">${i}&nbsp&nbsp</span>
			</c:if>
			<c:if test="${i==cri.page}">
				<span style="color:#ccc;" page="${i}">${i}&nbsp&nbsp</span>
			</c:if>
		</c:forEach>
		<c:if test="${pm.next}">
			<span page="${pm.endPage+1}">▶</span>
		</c:if>
	</div>
</div>
<script>
	$("#tbl").on("click",".row",function(){
		var suggestion_number=$(this).attr("suggestion_number");
		location.href="/board/suggestion_read?suggestion_number="+suggestion_number;
	});
	
	$("#total").html("전체 제안 : "+"${pm.totalCount}");
	
	$("#pagination").on("click","span",function(){
		var page=$(this).attr("page");
		location.href="suggestion?page="+page;
	});
</script>