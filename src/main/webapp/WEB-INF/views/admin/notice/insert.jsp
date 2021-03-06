<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<h2>공지사항</h2>
<form name="frm" encType="multipart/form-data">
	<table>
		<tr>
			<td>작성자</td>
			<td><input type="text" class="admin_text" name="notice_writer" value="${admin_id}" readonly></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><input type="text" class="admin_text" value="<%= sf.format(nowTime)%>" readonly/></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" class="admin_text" name="notice_title" placeholder="공지사항  제목을 입력하세요."/></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea type="text" class="admin_text" name="notice_contents"  style="width:350px; height:200px; resize: none;" placeholder="내용을 입력하세요."></textarea></td>
		</tr>
		<tr>
			<td>자료</td>
			<td>
				<img src="http://placehold.it/300x300" id="notice_img" width=300/>
				<input type="file" name="file" style="display:none;"/>
			</td>
		</tr>
	</table>
	<button class="btn_admin" style="float:right; margin-bottom:10px;" id="btn_write">글쓰기</button>
</form>
<script>
	$("#notice_img").on("click",function(){
		$(frm.file).click();
	});
	$("#btn_write").on("click",function(e){
		e.preventDefault();
		var notice_title=$(frm.notice_title).val();
		var notice_contents=$(frm.notice_contents).val();
		if(notice_title=="") {
			alert("제목을 입력하세요.");
			$(frm.notice_title).focus();
			return;
		}else if(notice_contents==""){
			alert("내용을 입력하세요.");
			$(frm.notice_contents).focus();
			return;
		}
		if(!confirm("공지사항을 저장하시겠습니까?")) return;
		frm.action="admin_notice_insert";
		frm.method="post"; 
		frm.submit();
		
	});
	$(frm.file).on("change",function(){
		var file=$(frm.file)[0].files[0];
		$("#notice_img").attr("src",URL.createObjectURL(file));
	})
</script>