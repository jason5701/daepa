<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>REVIEW 정보</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<form name="frm" enctype="multipart/form-data">
		<input type="hidden" value="${vo.review_number}" name="review_number"/>
		<input type="hidden" value="${user_id}" name="user_id"/>
		<input type="hidden" value="${vo.product_id}" name="product_id"/>
		<input type="hidden" value="${vo.meterial_id}" name="meterial_id"/>
		<table>
			<tr style="display:none;">
				<td>작성자</td>
				<th>${vo.review_writer}</th>
				<td>작성일</td>
				<td><fmt:formatDate value="${vo.review_write_date}" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr style="display:none;">
				<td>수정일</td>
				<td><fmt:formatDate value="${vo.review_modify_date}" pattern="yyyy-MM-dd"/></td>
				<td>조회수</td>
				<td>${vo.review_click}</td>
			</tr>
			<tr>
				<td>${vo.product_name}</td>
				<td>${vo.meterial_name}</td>
			</tr>
			
	       <tr>
         		<td>
                	<c:if test="${vo.review_image==null}">
                		<img id="image" src="http://placehold.it/300x250" width=300/>
               		</c:if>
               		<c:if test="${vo.review_image!=null}">
                  		<img id="image" src="/displayFile?fullName=${vo.review_image}" width=300/>
               		</c:if>
               		<input type="file" name="file" style="display:none;"/>
            	</td>
        	</tr>
        	<tr>
	            <td>
	               <input type="button" id="btnImage" value="첨부이미지" style="display:none;"/>
	            </td>
	            <td style="height:150px; padding:10px;">
	            <input type="file" name="files" accept="image/*" multiple style="display:none;"/>
					<!--<div id="uploaded">
	  					<ul id="uploadFiles"></ul>
	   					<script id="temp" type="text/x-handlebars-template">
      						<li>
         						<img src="/displayFile?fullName=${vo.review_number}/{{fullName}}" width=50/>
         						<input type="text" name="images" value="{{fullName}}"/>
        						<input class="del" type="button" value="삭제" fullName={{fullName}}/>
      						</li>
   	  					</script>
					</div>-->
	            </td>
         	</tr>	
			<tr>
				<td>
					<textarea rows="10" cols="50" name="review_contents">${vo.review_contents}</textarea>
				</td>
			</tr>
		</table>
		<input type="submit" value="수정">
		<input type="button" value="취소/목록이동" onClick="location.href='/mypage/myReview'">
		<input type="button" value="삭제" id="btnDelete">
	</form>
</body>
<script>
	$("#btnDelete").on("click", function(){
		if(!confirm("삭제하시겠습니까?")) return;
		frm.action="user_review_delete";
		frm.method="get";
		frm.submit();
	});
	/*//첨부파일 업로드
	   function uploadFile(file){
		      if(file == null) return;
		      var formData=new FormData();
		      formData.append("file", file);
		      formData.append("review_number", review_number);
		      
		      $.ajax({
		         type:"post",
		         url:"/uploadFile",
		         enctype:"multipart/form-data",
		         processData:false,
		         contentType:false,
		         data:formData,
		         success:function(data){
		            var temp=Handlebars.compile($("#temp").html());
		            var tempData={"fullName":data};
		            $("#uploadFiles").append(temp(tempData));
		         }
		     });
		}
		//첨부 파일삭제
	   $("#uploadFiles").on("click","li .del",function(){
	      var li=$(this).parent();
	       var fullName= $(this).attr("fullName");
	       if(!confirm("파일을 삭제하시겠습니까?"))return;
	       $.ajax({
	          type:"get",
	          url:"/deleteFile",
	          data:{"fullName":review_number + "/" + fullName},
	          success:function(){
	             alert("삭제완료!");
	             li.remove();
	          }
	       });
	   });*/
		//상품수정
	   $(frm).on("submit", function(e){
	      e.preventDefault();
	      if(!confirm("상품을 수정하시겠습니까?")) return;
	      frm.action="user_review_update";
	      frm.method="post";
	      frm.submit();
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