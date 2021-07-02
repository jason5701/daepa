<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<h2>제안보기</h2>
<form name="frm">
	<input type="hidden" name="suggestion_number" value="${vo.suggestion_number}"/>
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" class="admin_text"  name="suggestion_title" value="${vo.suggestion_title}"/></td>
		</tr>
		<tr>
			<td>작성자</td>
			<th>${vo.user_id}</th>
		</tr>
		<tr>
			
			<td>작성일</td>
			<td><fmt:formatDate value="${vo.suggestion_write_date}" pattern="yyyy-MM-dd"/></td>
			
		</tr>
		<tr>
			<td colspan=2><textarea name="suggestion_contents" class="admin_text"  style="width:500px; height:200px; resize: none;">${vo.suggestion_contents}</textarea></td>
		</tr>
	</table>
	<div style="float:right;">
		<input type="button"  class="btn_admin" id="btn_list" value="목록">
	</div>
</form>
<script>
	$("#btn_list").on("click",function(e){
		e.preventDefault();
		location.href="/board/suggestion";
	});
</script>