<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script> 

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<style>
		table {width: 100%; border-top: 1px solid #444444; border-collapse: collapse;}
  		th, td { border-bottom: 1px solid #444444; padding: 10px; }
	</style>
</head>
<body>
	<div id="boardQAread">
	<h2>상품 문의 답변</h2>
		<form name="frm" action="boardQA_read" enctype="multipart/form-data">
		<input type="hidden" name="boardQA_number" value="${vo.boardQA_number}"/>
		<input type="hidden" name="product_name" value="${vo.product_name}"/>
			<table width="600">
				<tr>
					 <td colspan="4" style="border-top:2px solid;"></td>
				</tr>
				<tr>
					<td colspan="4">${vo.product_name}</td>
				</tr>
				<tr>
					<td style="background:#EAEAEA;">제목</td>
					<td colspan="3" style="border-bottom:1px solid #EAEAEA;">${vo.boardQA_contents}</td>
				</tr>
				<tr>
					<td style="background:#EAEAEA">작성자</td>
					<td colspan="3" style="border-bottom:1px solid #EAEAEA;">${vo.answer_writer}</td>
				</tr>
				<tr>
					<td style="background:#EAEAEA">작성일</td>
					<td>${vo.answer_write_date}</td>
					<td style="background:#EAEAEA">답변상태</td>
					<c:if test="${vo.boardQA_click==1}">
						<td style="text-align:center; width:80; font-weight:bold; color:#4A0BA3">답변완료</td>
					</c:if>
					<c:if test="${vo.boardQA_click==0}">
						<td style="text-align:center; width:80; color:#A6A6A6">답변대기</td>
					</c:if>
				</tr>
				<tr>
					 <td colspan="4" style="border-bottom:1px solid #EAEAEA;"></td>
				</tr>
				<tr>
					<td colspan="4"> <span> 💬  ${vo.boardQA_contents}</span><br/><br/> <span>📢 ${vo.answer_contents}</span></td>		
				</tr>
				<tr>
					<td colspan="4" style="border-top:1px solid #EAEAEA; text-align:right; padding:20px 10px 20px 0px" >
					 	<input type="button" style="background-color:#5112AB; width:140px; height:45px; border:1px solid #6324BD; color:white; cursor:pointer;" value="목록이동" onClick="location.href='/meal_detail?product_id=${vo.product_id}'"/>
					</td>
				</tr>
				<tr>
				 <td colspan="4" style="border-top:2px solid;"></td>
			</tr>
			</table>	
		</form>
	</div>
	
	<div>
		<input type="button" id="manager_update" style="background-color:#5112AB; width:140px; height:45px; border:1px solid #6324BD; color:white; cursor:pointer; margin:0px auto;;" value="문의답변작성" onClick="location.href='/board/boardQA/update?boardQA_number=${vo.boardQA_number}'"/>
	</div>
	
	
</body>
<script>
	
	
</script>
</html>