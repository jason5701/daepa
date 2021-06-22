<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>REVIEW 등록</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<form name="frm">
		<input type="hidden" value="${review_number}" name="review_number"/>
		<table>
			<tr>
				<td>상품번호</td>
				<td><input type="text" name="meterial_id" value="${meterial_id}"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="review_writer" value="${review_writer}"></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><input type="text" value="<%= sf.format(nowTime)%>" readonly/></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="review_title" placeholder="후기 제목을 입력하세요."/></td>
			</tr>		
			<tr>
				<td>내용</td>
				<td><input type="text" name="review_contents" placeholder="후기 내용을 입력하세요."/></td>
			</tr>
	        <tr>
	        	<td>후기이미지</td>
				<td>
					<img id="image" src="http://placehold.it/150x120" width=150/>
					<input type="file" name="file" style="display:none;"/>
					<div id="upload">
						<input type="file" id="file" accept="image/*" style="display:none;"/>
					</div>
					<div id="uploaded">
						<ul id="uploadFiles"></ul>
						<script id="temp" type="text/x-handlebars-template">
							<li>
								<img src="/displayFile?fullName={{fullName}}" width=50/>
								<input type="text" name="files" value="{{fullName}}"/>
								<input class="del" type="button" value="삭제" fullName={{fullName}}/>
							</li>
						</script>
					</div>
				</td>
			</tr> 	
		</table>
		<input type="submit" value="리뷰등록"/>
		<input type="reset" value="등록취소"/>
		<input type="button" value="리뷰목록" onClick="location.href='meterial_review_list'"/>
	</form>
</body>
<script>
	$(frm).on("submit", function(e){
		e.preventDefault();
		var review_title=$(frm.review_title).val();
		var review_contents=$(frm.review_contents).val();
		if(review_title=="") {
			alert("제목을 입력하세요.");
			$(frm.review_title).focus();
			return;
		}else if(review_contents==""){
			alert("내용을 입력하세요.");
			$(frm.review_contents).focus();
			return;
		}
		if(!confirm("리뷰를 등록하시겠습니까?")) return;
		frm.action="/board/meterial_review_list";
		frm.method="post";
		frm.submit();
	});
	//첨부파일삭제
	$("#uploadFiles").on("click", "li .del", function(){
		var li=$(this).parent();
		var fullName=$(this).attr("fullName");
	 	if(!confirm(fullName + "을 삭제하시겠습니까?")) return;
	 	$.ajax({
	 		type:"get",
	 		url:"/deleteFile",
	 		data:{"fullName":fullName},
	 		success:function(){
	  			alert("삭제완료!");
	  			li.remove();
	 		}
	 	});
	});
   
	//파일업로드
	$("#file").on("change",function() {
	    //alert("언제발생하는가?"); //파일을 선택한 후
	    var file = $("#file")[0].files[0]; //파일즈에 0해줘야지 지금 선택한 파일을 가져올수있음. (여러개의 파일을 선책할수있기 때문이다.)
	    //alert(file); //오브젝트 가져옴 
	    if (file == null) return;//파일이 선택되지 않았을떄는 아무액션이 발생하지 않음
	    var formData = new FormData();
	    formData.append("file", file); //여기서 받은 파일이 폼데이터로 호출됨
	
	    $.ajax({
	    	type : "post",
	    	url : "/uploadFile", //패쓰가 틀릴일 없음.
		    processData : false,
		    contentType : false,
		    data : formData,
		    success : function(data) {
		        //alert(data);
		        var temp=Handlebars.compile($("#temp").html());
		        var tempData={"fullName":data};
		        $("#uploadFiles").append(temp(tempData));
	        }
		});
	});
	//이미지클릭했을떄
	$("#image").on("click", function(){
		$(frm.file).click();
	});

	//이미지 미리보기
	$(frm.file).on("change",function(){
		var file=$(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});
</script>
</html>