<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>자주하는질문 read</title>
</head>
<body>
	<form name="frm" enctype="multipart/form-data">
		<input type="hidden" value="${vo.commonQA_number}" name="commonQA_number"/>
		<table>	
			<tr>
				<td>
					<textarea rows="20" cols="100" name="commonQA_contents">${vo.commonQA_contents}</textarea>
				</td>
			</tr>
		</table>
		<input type="button" value="자주하는질문 목록" onClick="location.href='commonQA_list'">
	</form>
</body>
</html>