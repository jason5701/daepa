<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<h2>자주하는질문 쓰기</h2>
<form name="frm" encType="multipart/form-data">
	<table>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="commonQA_writer" value="${admin_id}" readonly></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><input type="text" value="<%= sf.format(nowTime)%>" readonly/></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="commonQA_title" placeholder="자주하는질문  제목을 입력하세요."/></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><input type="text" name="commonQA_contents" placeholder="자주하는질문  내용을 입력하세요."/></td>
		</tr>
	</table>
	<button id="btn_write">입력</button>
</form>
<script>
	
	$("#btn_write").on("click",function(e){
		e.preventDefault();
		var commonQA_title=$(frm.commonQA_title).val();
		var commonQA_contents=$(frm.commonQA_contents).val();
		if(commonQA_title=="") {
			alert("제목을 입력하세요.");
			$(frm.commonQA_title).focus();
			return;
		}else if(commonQA_contents==""){
			alert("내용을 입력하세요.");
			$(frm.commonQA_contents).focus();
			return;
		}
		if(!confirm("자주하는질문을 저장하시겠습니까?")) return;
		frm.action="admin_commonQA_insert";
		frm.method="post"; 
		frm.submit();
		
	});
	
</script>