<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<style>
		table {width: 95%; border-top: 1px solid #444444; border-collapse: collapse; margin:0px auto;}
  		th, td { border-bottom: 1px solid #444444; padding: 10px; }
  		.btn_style {
   width: 120px;
   height: 50px;
   padding: .5em;
   border: 1px solid #123478;
   background: #123478;
   border-radius: 5px 5px 5px;
   color: white;
   font-weight:bold;
   margin-left: 10px;
}
	</style>
</head>
<body>
	<div id="boardQAread" style="margin:0px auto; border:1px solid; border-radius:10px 10px 10px 10px; width:700px; border-color:#BDBDBD">
	<h2 style="text-align:center;"> '${vo.product_name}' 상품 문의</h2>
		<form name="frm" action="boardQA_read"  enctype="multipart/form-data">
		<input type="hidden" name="boardQA_number" value="${vo.boardQA_number}"/>
		<input type="hidden" name="product_name" value="${vo.product_name}"/>
			<table width="600">
				<tr>
					 <td colspan="4" style="border-top:2px solid;"></td>
				</tr>
				
				<tr>
					<td style="background:#FAFAFA; border-bottom:1px solid #D8D8D8;">제목</td>
					<td colspan="3" style="border-bottom:1px solid #EAEAEA;">${vo.boardQA_contents}</td>
				</tr>
				<tr>
					<td style="background:#FAFAFA; border-bottom:1px solid #D8D8D8;" >작성자</td>
					<td colspan="3" style="border-bottom:1px solid #EAEAEA;">${vo.boardQA_writer}</td>
				</tr>
				<tr>
					<td style="background:#FAFAFA">작성일</td>
					<td><fmt:formatDate value="${vo.boardQA_write_date}" pattern="yyyy-MM-dd kk:mm:ss"/></td>
					<!-- <td>${vo.boardQA_write_date}</td> -->
					<td style="background:#FAFAFA">답변상태</td>
					<c:if test="${vo.boardQA_click==1}">
						<td style="text-align:center; width:80; font-weight:bold; color:#123478">답변완료</td>
					</c:if>
					<c:if test="${vo.boardQA_click==0}">
						<td style="text-align:center; width:80; color:#A6A6A6">답변대기</td>
					</c:if>
				</tr>
				<tr>
					 <td colspan="4" style="border-bottom:1px solid #FAFAFA;"></td>
				</tr>
				<tr>
					<td colspan="4"> <span> 💬  ${vo.boardQA_contents}</span><br/><br/> <span>📢 ${vo.answer_contents}</span></td>		
				</tr>
				<tr>
					<td colspan="4" style="border-top:1px solid #EAEAEA; text-align:right; padding:20px 10px 20px 0px" >
					 	<input type="button" class="btn_style" value="목록이동" onClick="location.href='/meal_detail?product_id=${vo.product_id}'"/>
					</td>
				</tr>
				<tr>
				
			</tr>
			</table>	
		</form>
	</div>
	
	<br/>
	<c:if test="${admin_id==daepa}">
		<div style="text-align:center;">
			<input type="button" class="btn_style" value="문의답변작성" onClick="location.href='/board/product_boardQA_update?boardQA_number=${vo.boardQA_number} & product_id=${vo.product_id}'"/>
		</div>
	</c:if>	
	<c:if test="${admin_id!=daepa}">
		<div style="text-align:center;">
			<input type="hidden" class="btn_style" value="문의답변작성" onClick="location.href='/board/product_boardQA_update?boardQA_number=${vo.boardQA_number} & product_id=${vo.product_id}'"/>
		</div>
	</c:if>	
</body>
<script>
	
	
</script>
</html>