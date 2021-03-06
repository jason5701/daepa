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
   <style>
      .btn_style { width: 120px; height: 50px; padding: .5em; border: 1px solid #123478; background: #123478; border-radius: 5px 5px 5px; color: white; font-weight:bold; margin-left: 10px;}
   </style>
</head>
<body>
<div style="width:610px; height:800px; background-color: #FFFFFF; border: 1px solid #D5D5D5; border-radius:10px 10px 10px 10px;  padding:10px; margin:0px auto;">
   <h2 style="color:#123478;"> 상품 후기작성</h2>
   <hr style="border: 0.25px solid; width:600px; margin: 0 auto; background-color:#D5D5D5; color:#D5D5D5;" />
   <br/>
   <form name="frm" enctype="multipart/form-data">
      <input type="hidden" value="${review_number}" name="review_number"/>
      <table>
         <tr>
            <td width=100 style="Font-weight:bold;">상품번호</td>
            <td style="border-bottom:1px solid;"><input type="text" style="border:none;" name="meterial_id" value="${meterial_id}"></td>
         </tr>
         <tr>
            <td width=100 style="Font-weight:bold;">작성자</td>
            <td style="border-bottom:1px solid;">
               <input type="hidden" name="review_writer" value="${user_info.user_id}">
               <input type="text" style="border:none;" class="text_style" value="${user_info.user_name}" readonly>
            </td>
         </tr>
         <tr>
            <td width=100 style="Font-weight:bold;">작성일</td>
            <td style="border-bottom:1px solid;"><input type="text" style="border:none;" class="text_style" value="<%= sf.format(nowTime)%>" readonly/></td>
         </tr>
      </table>
      <br/>
      <hr style="border: 0.25px solid; width:600px; margin: 0 auto; background-color:#D5D5D5; color:#D5D5D5;" />
     <table style="padding:10px" width=600>
         <tr>
            <td style="Font-weight:bold;" width=100>후기이미지</td>
            <td style=" width:80; padding:10px 30px 30px 30px;">
               <img id="image" src="http://placehold.it/150x120" width=150/>
                  <input type="file" name="file" style="display:none;"/>
            </td>
         </tr>
         <tr>
            <td style="Font-weight:bold;" width=100>제목</td>
            <td><input type="text" name="review_title" class="text_style" placeholder="후기 제목을 입력하세요."/></td>
         </tr>      
         <tr>
            <td style="Font-weight:bold;" width=100>내용</td>
            <td width=400><textarea rows="10" cols="50" class="text_style" name="review_contents" style="border:1px solid #A6A6A6;" resize: none;" placeholder="후기 내용을 입력하세요."/></textarea></td>
         </tr>   
      </table>
      <div style="padding:20px; text-align:center; ">
         <input type="reset" value="취소/목록이동" style="width: 120px; height: 50px; background-color:#ffffff; border:1px solid #D5D5D5; cursor:pointer; border-radius:6px 6px 6px 6px; color:#8C8C8C; Font-weight:bold;" onClick="location.href='/vege_detail?meterial_id=${meterial_id}'"/>
         <input type="submit" class="btn_style" value="리뷰등록"/>
      </div>
   </form>
</div>
</body>
<script>
   /*var meterial_id="${meterial_id}";   
   var review_number="${review_number}";*/
   $(frm).on("submit", function(e){
      e.preventDefault();
      /*alert(meterial_id);
      alert(review_number);*/
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
      frm.action="meterial_review_insert";
      frm.method="post";
      frm.submit();
   });
   
   /*//첨부파일삭제
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
   });*/
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