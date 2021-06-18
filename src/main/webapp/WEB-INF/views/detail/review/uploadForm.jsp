<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>파일업로드</title>
</head>
<body>
	<h1>파일업로드 Form</h1>
	<form action="uploadForm" method="post" encType="multipart/form-data">
		<input type="file" name="file"/>
		<input type="submit" value="업로드"/>
	</form>
</body>
</html>