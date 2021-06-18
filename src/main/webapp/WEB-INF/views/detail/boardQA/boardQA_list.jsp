<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>상품별문의</title>
	<style>
		table {width: 100%; border-top: 1px solid #444444; border-collapse: collapse; font-size:15px;}
  		th, td { border-bottom: 1px solid #444444; padding: 10px; }
  		
  		p{font-size:13px; color:#A6A6A6; padding:-10px;}
	</style>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script> 
<body>
	<h5> PRODUCT Q&A </h5><br/>
	<p><b>ㆍ 상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전 동의 없이 담당 게시판으로 이동 될 수있습니다. <br/>ㆍ 배송관련, 주문(취소/교환/환불) 관련문의 및 요청사항은 DaePa 내 <u>1:1문의</u>에 남겨주세요.</b></p>
	
	<div>
		<table>
			<tr style="border-top:2px solid; border-bottom:2px solid; font-weight:bold;">
				
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>답변상태</td>
			</tr>
			<c:forEach items="${boardQA_list}" var="vo">
			<tr >  <!-- onClick="location.href='boardQA_read?boardQA_number=${vo.boardQA_number}'" -->
				<td style="text-align:center; display:none;" id="td_copy(tdVal.value)">${vo.boardQA_number}</td>
				<td ><a href="#" id="viewhidden${vo.boardQA_number}" onclick="return false;" class="button">${vo.boardQA_title}</a></td>
				<td  style="text-align:center">${vo.boardQA_writer}</td>
				<td style="text-align:center"><fmt:formatDate value="${vo.boardQA_write_date}" pattern="yyyy-MM-dd kk:mm:ss"/></td>
				
				<c:if test="${vo.boardQA_click==1}">
					<td style="text-align:center">답변완료</td>
				</c:if>
				<c:if test="${vo.boardQA_click==0}">
					<td style="text-align:center">답변대기</td>
				</c:if>
			</tr>
			<tr id ="hidden${vo.boardQA_number}" style="display:none;">
			<td colspan = "4">${vo.boardQA_title} <td><input type="hidden"/></td> 
			</tr>
 
			</c:forEach>
		</table>
	</div>
	<br/>

		<div class="pagination" style="width: 100%; text-align:center; margin-left:45%; ">
			<c:if test="${pm.prev}">
				<a href="boardQA_list?page=${pm.startPage-1}">◀</a>
			</c:if>
			<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
				<c:if test="${i==cri.page}">
	            	<a href="boardQA_list?page=${i}">
	            	<span class="page-link">${i}</span>
	            </a>
				</c:if>
				<c:if test="${i!=cri.page}">
	            	<a href="boardQA_list?page=${i}">
	            		<span class="page-link">${i}</span>
	            	</a>
				</c:if>
			</c:forEach>
			<c:if test="${pm.next}">
	         	<a href="boardQA_list?page=${pm.endPage+1}">▶</a>
			</c:if>
		</div>

</body>

<script type="text/javascript"> 
	var No=$("#viewhidden${vo.boardQA_number}").val();
	
	$(document).ready(function () { 
	  function td_copy(val){
	        var str = document.getElementsByTagName('td')[val].childNodes[0].nodeValue;      
	    }
	$("#viewhidden3").click(function () { 
		console.log("333")
		console.log($("#idx").val())
		
		status = $("#hidden3").css("display"); 
		if (status == "none") { $("#hidden3").css("display", ""); } 
		else { $("#hidden3").css("display", "none"); } 
		}); 
	
	$("#viewhidden4").click(function () { 
		console.log("111")
		console.log($("#idx").val())
		
		status = $("#hidden4").css("display"); 
		if (status == "none") { $("#hidden4").css("display", ""); } 
		else { $("#hidden4").css("display", "none"); } 
		});
	
	$("#viewhidden5").click(function () { 
		console.log("111")
		console.log($("#idx").val())
		
		status = $("#hidden5").css("display"); 
		if (status == "none") { $("#hidden5").css("display", ""); } 
		else { $("#hidden5").css("display", "none"); } 
		});
	
	
	}); 
	
	
</script>
</html>
