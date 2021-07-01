

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div style="width:510px; height:800px; background-color: #FFFFFF; border: 1px solid #D5D5D5; border-radius:10px 10px 10px 10px;  padding:10px;">
	<h2> 상품 문의 답변</h2>
	<hr style="border: 0.25px solid; width:500px; margin: 0 auto; background-color:#D5D5D5; color:#D5D5D5;" />
	<br/>
	
	<table>
		<tr>
			<td style=" width:80;">${vo.product_id}</td> <!-- // >${aa.product_id} ==> Controller에 aa에 담아 만듬 -->
			<td style=" width:80; padding:0px 30px 0px 30px;">${vo.product_image}</td>
			<td style=" width:80;">${vo.product_name}</td>
		</tr>
	</table>
	<br/>
	<hr style="border: 0.25px solid; width:500px; margin: 0 auto; background-color:#D5D5D5; color:#D5D5D5;" />
	<form name="frm" action="product_boardQA_update" method="post">
		<table style="padding:10px" width=500 >
			<tr>
				<td><input type="hidden" name="product_id" value="${aa.product_id}"/></td>
			</tr>
			 
			 <tr>
				<td><input type="hidden" name="boardQA_writer" value="yoonsun"/></td>
			</tr>
			<tr>
				<td><input type="hidden" value="1992-07-19" readonly/></td>
			</tr>
			<tr>
				<td class="title" style="text-align:center;" width=100>제목</td>
				<td width=100><input type="text" style="border:1px solid #A6A6A6;" name="boardQA_title" size=45 placeholder="제목을입력해주세요"/></td>
			</tr>
			<tr>
				<td class="title" style="text-align:center;" width=100>내용</td>
				<td width=400>
					<textarea rows="10" cols="50"  class="boardQA_contents" name="boardQA_contents" style="border:1px solid #A6A6A6;" placeholder="문의 내용을 입력해주세요                                            ㆍ배송관련, 주문(취소/교환/환불)관련문의 및 요청사항은  1:1 채팅문의를 이용해주세요"></textarea>
				</td>
			</tr>
		</table>
		<div style="float:right; margin-right:50px;  color:#aaa; font-size:12px;" id="counter">(0 / 최대 200자)</div>
		<br/>
		<div style="padding:20px; text-align:center; ">
			<input type="reset" style="width:150px; height:50px; background-color:#ffffff; border:1px solid #D5D5D5; cursor:pointer; border-radius:6px 6px 6px 6px; " value="취소">
			<input type="submit" style="width:150px; height:50px; background-color:#5112AB; border:1px solid #5112AB; cursor:pointer; color:#ffffff; border-radius:6px 6px 6px 6px;" value="등록">
		</div>
	</form>
</div>	
</body>
<script>
	var product_name="${aa.product_name}"
	

	//글자수 실시간 카운팅
	$(frm.boardQA_contents).keyup(function (e){
	    var content = $(this).val();
	    $('#counter').html("("+content.length+" / 최대 500자)");   
	
	    if (content.length > 500){
	        alert("최대 500자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 500));
	        $('#counter').html("(500 / 최대 500자)");
	    }
	});

	//상품문의 등록 버튼
	$(frm).submit(function(e){
		e.preventDefault();
		var boardQA_contents = $(frm.boardQA_contents).val();
		if(boardQA_contents == "") {
			alert("문의 내용을 입력바랍니다"); return;
		}
		if (!confirm(product_name + "상품문의를 등록하실래요?")) return;
		frm.submit();
		alert("등록이 완료되었습니다.");
	});
</script>
</html>