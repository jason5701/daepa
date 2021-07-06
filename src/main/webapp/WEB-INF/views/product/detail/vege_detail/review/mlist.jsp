<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <title>REVIEW 목록</title>
   <style>
      table{width: 100%;border-collapse: collapse;border-bottom:solid 1px;}
      td{border:solid 1px rgb(200, 200, 200) solid;padding: 10px;text-align: center;}
      .row:hover{background: rgb(200, 200, 200);color: white;}
      .row{border-top:solid 1px rgb(200, 200, 200);}
      .title{border-top:2px solid;text-align: center;}
      #pagination{text-align: center;}
      #pagination a{text-decoration:none; color:black}
      #pagination .active{color:red}
      #review_insert{text-align:right;}
      #total{display:none;}
   </style>
</head>
<body>
   <h2>PRODUCT REVIEW</h2>
   <ul>
      <li>상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
      <li>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이대파 내 1:1 문의에 남겨주세요.</li>
   </ul>
   <br/>   
   <div class="div_container">
      <div class="div_checkbox">
         <select id="orderBy" style="float:right;">
            <option value="review_number desc" selected>최근등록순</option>
            <option value="review_click desc">조회많은순</option>
         </select>
         <span id="total"></span>
      </div>
   </div>
   <table id="tbl"></table>
   <script id="temp" type="text/x-handlebars-template">
      <tr class="title">
         <td width=50>번호</td>
         <td width=50>상품번호</td>
         <td width=100>제목</td>
           <td width=50>작성자</td>
            <td width=100>작성일</td>
         <td width=50>조회</td>         
      </tr>
      {{#each list}}
       <tr class="row" onClick="location.href='/board/meterial_review_read?review_number={{review_number}}'">  
         <td>{{review_number}}</td>
         <td>{{meterial_id}}</td>
         <td>{{review_title}}</td>
          <td>{{review_writer}}</td>
          <td>{{review_write_date}}</td>
         <td>{{review_click}}</td>
      <tr>
      {{/each}}
   </script>
   <div id="review_insert">
      <button class="btn_style" onClick="location.href='/board/meterial_review_insert?meterial_id=${vo.meterial_id}'">상품후기작성</button>
   </div>
   <div id="pagination"></div>
</body>
<script>
   var meterial_id="${vo.meterial_id}";
   var page=1;
   getMeterial_review_list();
   
   $("#orderBy").on("change", function(){
      page=1;
      getMeterial_review_list();
   });
   
   function getMeterial_review_list(){
      var orderBy=$("#orderBy").val();
      $.ajax({
         type:"get",
         url:"/board/meterial_review_list.json",
         dataType:"json",
         data:{"page":page,"orderBy":orderBy,"searchType":meterial_id},
         success:function(data){
            //alert(meterial_id);
            console.log(data);
            var temp = Handlebars.compile($("#temp").html());
            $("#tbl").html(temp(data));
            $("#total").html("검색수:" + data.pm.totalCount);
            //페이징목록출력
            var str="";
            var prev=data.pm.startPage-1;
            var next=data.pm.endPage+1;
            
            if(data.pm.prev) str +="<a href='" + prev + "'>◀</a>";
            for(var i=data.pm.startPage;i<=data.pm.endPage; i++){
               if(i==page){
                  str += "[<a class='active' href='" + i + "'>" + i + "</a>] ";
               }else{
                  str += "[<a href='" + i + "'>" + i + "</a>] ";
               }   
            }
            if(data.pm.next) str +="<a href='" + next + "'>▶</a>";
            $("#pagination").html(str);
            }
      });
   };
   
   $("#pagination").on("click","a",function(e){
      e.preventDefault();
      page = $(this).attr("href");
      getMeterial_review_list();
   });
</script>
</html>