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
   <style>
      table{width: 100%;border-collapse: collapse;border-top:1px solid; border-bottom:1px solid;border-color:#BDBDBD;}
      td{border:solid 1px rgb(200, 200, 200) solid;padding: 20px;}
      #review_insert{text-align:right;}
      #total{display:none;}
        .btn_style { width: 120px; height: 50px; padding: .5em; border: 1px solid #123478; background: #123478; border-radius: 5px 5px 5px; color: white; font-weight:bold; margin-left: 10px;}
   </style>
</head>
<body>
   <div style="margin:0px auto; border:1px solid; border-radius:10px 10px 10px 10px; width:800px; border-color:#BDBDBD;">
      <h2 style="text-align:center;"> '${vo.meterial_name}' 상품 후기</h2>
      <form name="frm" enctype="multipart/form-data">
         <input type="hidden" value="${vo.review_number}" name="review_number"/>
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
                   <td style="Font-weight:bold;" width=100>후기이미지</td>
               <td style=" width:80; padding:10px 30px 30px 30px;">
                  <c:if test="${vo.review_image==null}">
                     <img id="image" src="http://placehold.it/200x150" width=200/>
                  </c:if>
                  <c:if test="${vo.review_image!=null}">
                     <img id="image" src="/displayFile?fullName=${vo.review_image}" width=200/>
                  </c:if>
                  <input type="file" name="file" style="display:none;"/>
               </td>
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
               <td style="Font-weight:bold;" width=100>후기내용</td>
               <td>
                  <c:if test="${vo.review_writer == user_info.user_id}">
                     <textarea rows="10" cols="50" name="review_contents">${vo.review_contents}</textarea>
                  </c:if>   
                  <c:if test="${vo.review_writer != user_info.user_id}">
                     <textarea rows="10" cols="50" name="review_contents" readonly>${vo.review_contents}</textarea>
                  </c:if>
               </td>
            </tr>
         </table>
         <div style="text-align:right; padding:20px 10px 20px 0px">
            <c:if test="${vo.review_writer == user_info.user_id}">
               <input type="submit" class="btn_style" value="수정">
               <input type="button" class="btn_style" value="목록이동" onClick="location.href='/vege_detail?meterial_id=${vo.meterial_id}'">
               <input type="button" class="btn_style" value="삭제" id="btnDelete">
            </c:if>
            <c:if test="${vo.review_writer != user_info.user_id}">
               <input type="button" class="btn_style" value="목록이동" onClick="location.href='/vege_detail?meterial_id=${vo.meterial_id}'">
            </c:if>
         </div>   
      </form>
   </div>
</body>
<script>
   $("#btnDelete").on("click", function(){
      if(!confirm("삭제하시겠습니까?")) return;
      frm.action="meterial_review_delete";
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
      frm.action="meterial_review_update";
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