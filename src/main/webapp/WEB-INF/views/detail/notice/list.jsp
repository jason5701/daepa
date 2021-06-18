<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>공지사항 리스트 출력</title>
	<style>
		table {width: 100%; border-top: 1px solid #444444; border-collapse: collapse;}
  		th, td { border-bottom: 1px solid #444444; padding: 10px; }
	</style>
</head>
<body>
<br/>
	<h1>공지사항</h1>
<br/>
	<table width=760>
		<tr>
			<td colspan="5" style="border-bottom:2px solid #3B00DB; border-top:2px solid #FFFFFF"></td>
		</tr>
		<tr style="text-align:center">
			<td width=50 >번호</td>
			<td width=400>제목</td>
			<td width=80>작성자</td>
			<td width=180>작성일</td>
			<td width=50>조회</td>
		</tr>	
		<c:forEach items="${list}" var="vo">
			<tr onClick="location.href='read?notice_number=${vo.notice_number}'">
				<td style="text-align:center">${vo.notice_number}</td>
				
				<td>${vo.notice_title}</td>
				<td style="text-align:center">${vo.notice_writer}</td>
				<td style="text-align:center"><fmt:formatDate value="${vo.notice_write_date}" pattern="yyyy-MM-dd kk:mm:ss"/></td>
				<td style="text-align:center">${vo.notice_click}</td>
			</tr>
		</c:forEach>
	</table>
<br/>
	<div class="pagination" style="width: 800px; text-align: ccenter; margin-top: 10px; margin-left:30px; ">
		<c:if test="${pm.prev}">
			<a href="list?page=${pm.startPage-1}">◀</a>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			<c:if test="${i==cri.page}">
            	<a href="list?page=${i}">
            	<span class="page-link">${i}</span>
            </a>
			</c:if>
			<c:if test="${i!=cri.page}">
            	<a href="list?page=${i}">
            		<span class="page-link">${i}</span>
            	</a>
			</c:if>
		</c:forEach>
		<c:if test="${pm.next}">
         	<a href="list?page=${pm.endPage+1}">▶</a>
		</c:if>
	</div>
	
</body>
</html>