<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script> 
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
   <style>
      table {width: 95%; border-top: 1px solid #444444; border-collapse: collapse; margin:0px auto;}
        th, td { border-bottom: 1px solid #444444; padding: 10px; }
        .btn_style {
   width: 120px;
   height: 50px;
   padding: .5em;
   border: 1px solid #123478;
   background: #123478;
   border-radius: 5px 5px 5px;
   color: white;
   font-weight:bold;
   margin-left: 10px;
}
   </style>
</head>
<body>
   <div id="boardQAread" style="margin:0px auto; border:1px solid; border-radius:10px 10px 10px 10px; width:700px; border-color:#BDBDBD">
   <h2 style="text-align:center;">'${vo.product_name}' 문의  답변</h2>
      <form name="frm"  enctype="multipart/form-data">
      <input type="hidden" name="product_id" value="${vo.product_id}"/>
      <input type="hidden" name="boardQA_number" value="${vo.boardQA_number}"/>
      <input type="hidden" name="product_name" value="${vo.product_name}"/>
      <input type="hidden" name="answer_write_date" value="${vo.answer_write_date}"/>
         <table width="600">
            <tr>
                <td colspan="4" style="border-top:2px solid;"></td>
            </tr>
         
            <tr>
               <td style="background:#FAFAFA; border-bottom:1px solid #D8D8D8;">제목</td>
               <td colspan="3" style="border-bottom:1px solid #EAEAEA;">${vo.boardQA_contents}</td>
            </tr>
            <tr>
               <td style="background:#FAFAFA; border-bottom:1px solid #D8D8D8;" >작성자</td>
               <td colspan="3" style="border-bottom:1px solid #EAEAEA;">${vo.answer_writer}</td>
            </tr>
            <tr>
               <td style="background:#FAFAFA; display:none;" >답변상태</td>
               <c:if test="${vo.boardQA_click==1}">
                  <td style="display:none; text-align:center; width:80; font-weight:bold; color:#123478">답변완료</td>
               </c:if>
               <c:if test="${vo.boardQA_click==0}">
                  <td style="display:none; text-align:center; width:80; color:#BDBDBD">답변대기</td>
               </c:if>
            </tr>
            <tr>
                <td colspan="4" style="border-bottom:1px solid #FAFAFA;"></td>
            </tr>
            <tr>
               <td colspan="4" style="border: 1px solid #FFFFFF;"> <span> <b>문의내용</b> : ${vo.boardQA_contents}</span><br/><br/> <span><textarea rows="10" cols="50" class="answer_contents" name="answer_contents" style="border:1px solid #A6A6A6;" placeholder="상품문의 답변"></textarea></span></td>
               
            </tr>
            <tr>
               <td colspan="2" style="float:right; border: 1px solid #FFFFFF; color:#aaa; font-size:12px;" id="counter">(0 / 최대 500자)</td>
               <td colspan="2" style="float:right; border: 1px solid #FFFFFF; color:#aaa; font-size:12px;"></td>
            </tr>
            <tr>
               <td colspan="4" style="border-top:1px solid #EAEAEA; text-align:right; padding:20px 10px 20px 0px" >
                   <input type="submit" class="btn_style" value="답변등록" onClick="location.href='/admin/boardQA'"/>
               </td>
            </tr>
            <tr>
             <td colspan="4" style="border-top:2px solid;"></td>
         </tr>
         </table>   
      </form>
   </div>
   <br/>
</body>
<script>
   var product_id="${vo.product_id}";
   var product_name="${vo.product_name}";
   
   //글자수 실시간 카운팅
   $(frm.answer_contents).keyup(function (e){
       var content = $(this).val();
       $('#counter').html("("+content.length+" / 최대 500자)");   
   
       if (content.length > 500){
           alert("최대 500자까지 입력 가능합니다.");
           $(this).val(content.substring(0, 500));
           $('#counter').html("(500 / 최대 500자)");
       }
   });
   
   //상품문의 등록 버튼
   $(frm).on("submit", function(e){      
      e.preventDefault();
      var answer_contents = $(frm.answer_contents).val();
      if(answer_contents == "") {
         alert("문의 내용을 입력바랍니다"); return;
      }
      if(!confirm(product_id + product_name + "문의 답변을 등록하실래요?")) return;
      frm.action="/admin/admin_boardQA_update";
      frm.method="get"; 
      frm.submit();
      alert("문의 답변 등록이 완료되었습니다.");
   });
</script>
</html>