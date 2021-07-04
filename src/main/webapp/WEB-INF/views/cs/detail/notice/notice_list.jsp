<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
</head>
<body>
	<h2>공지사항</h2>
<form name="frm" action="read">
	<input type="hidden" name="notice_number" value="${vo.notice_number}"/>
		<table width="600">
			<tr>
				 <td colspan="4" style="border-top:2px solid;"></td>
			</tr>
			<tr>
				<td style="background:#EAEAEA;">제목</td>
				<td colspan="3" style="border-bottom:1px solid #EAEAEA;">${vo.notice_title}</td>
			</tr>
			<tr>
				<td style="background:#EAEAEA">작성자</td>
				<td colspan="3" style="border-bottom:1px solid #EAEAEA;">${vo.notice_writer}</td>
			</tr>
			<tr>
				<td style="background:#EAEAEA">작성일</td>
				<td><fmt:formatDate value="${vo.notice_write_date}" pattern="yyyy-MM-dd kk:mm:ss"/></td>
				<td style="background:#EAEAEA">조회수</td>
				<td >${vo.notice_click}</td>
			</tr>
			<tr>
				 <td colspan="4" style="border-bottom:1px solid #EAEAEA;"></td>
			</tr>
			<tr>
				<td colspan="4"> <span>${vo.notice_contents}</span>
				<br/><br/>
					<c:if test="${vo.notice_image==null}">
						<img id="notice_image" src="http://placehold.it/200x200" width=300 height=200 style="display:none;"/>
					</c:if>
					<c:if test="${vo.notice_image!=null}">
						<img id="notice_image" src="/displayFile?fullName=${vo.notice_image}" />
					</c:if>
				</td>
			</tr>
			<tr>
				 <td colspan="4" style="border-top:1px solid #EAEAEA; text-align:right; padding:20px 10px 20px 0px" >
				 	<input type="button" id="btnList" value="목록이동" onClick="location.href='/cs_service'" style="width:150px; height:50px; background-color:#5112AB; border:1px solid #5112AB; cursor:pointer; color:#ffffff; border-radius:6px 6px 6px 6px;"/>
				 </td>
			</tr>
			<tr>
				 <td colspan="4" style="border-top:2px solid;"></td>
			</tr>
		</table>
	</form>
</body>
</html>