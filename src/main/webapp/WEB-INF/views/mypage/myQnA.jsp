<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script> 


<style>
       .page_section{width:810px;float:right;}
      table{width:90%;border-collapse: collapse;border-bottom:solid 1px;}
      td{border:solid 1px rgb(200, 200, 200) solid;padding: 10px;text-align: center;}
      .row:hover{background: rgb(200, 200, 200);color: white;}
      .row{border-top:solid 1px rgb(200, 200, 200); font-size:13px;}
      .title{background: #FAFAFA; border-top:2px solid;text-align: center; font-size:13px;}
      #pagination{text-align: center; font-size:12pt; font-weight:bold; }
     #pagination a{text-decoration:none; color:#123478;}
     #pagination .active{color:#ccc;}
     #product_boardQA_insert{text-align:right;}
      #review_insert{text-align:right;}
      .tit{font-size:25px;}
      .titSub{font-size:12px;}
      #total{display:none;}
   </style>
<div class="page_section">
   <div class="head_aticle">
      <br/>
      <h2 class="tit" style="text-align:left;">상품문의<br>
         <span class="tit_sub_qna">
            · 배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이대파 내 1:1문의에 남겨주세요.
         </span>
      </h2>
      <span id="total"></span>
      <br/><br/>   
      <table id="tbl1"></table>
      <script id="temp1" type="text/x-handlebars-template">
      <tr class="title">
         <td width=100> 순번 </td>
         <td width=100>상품번호</td>
         <td width=400> 제목 </td>
         <td width=100> 작성자 </td>
         <td width=200> 작성일 </td>
         <td width=100> 답변상태 </td>
      </tr>
      {{#each list}}
         <tr class="row" onClick="location.href='/board/boardQA/boardQA_read?boardQA_number={{boardQA_number}}'" style="cursor:pointer;">
            <td>{{boardQA_number}}</td>
            <td>{{product_id}}</td>
            <td>{{boardQA_title}}</td>
              <td>{{boardQA_writer}}</td>
              <td>{{boardQA_write_date}}</td>
            <td class="boardQA_click">{{answer_status boardQA_click}}</td>
         </tr>
      {{/each}}   
      </script>
      
      <script>
         Handlebars.registerHelper("answer_status", function(boardQA_click){
            var status="";
            if(boardQA_click==1) status="답변완료"; else status="답변대기"; 
            return status;
         });
      </script>
   <br/><br/>   
   <div id="pagination"></div>
   </div>   
</div>

<script>
   var user_id="${user_info.user_id}";
   var page1=1;
   getBoardQA_list();
   function getBoardQA_list(){
      $.ajax({
         type:"get",
         url:"/board/user_boardQA_list.json",
         dataType:"json",
         data:{"page":page1,"searchType":user_id},
         success:function(data){
            console.log(data);
            //alert(".............."+user_id);
            var temp = Handlebars.compile($("#temp1").html());
            $("#tbl1").html(temp(data));
            $("#total").html("검색수:" + data.pm.totalCount);
            //페이징목록출력
            var str="";
            var prev=data.pm.startPage-1;
            var next=data.pm.endPage+1;
            
            if(data.pm.prev) str +="<a href='" + prev + "'>◀</a>";
            for(var i=data.pm.startPage;i<=data.pm.endPage; i++){
               if(i==page1){
                  str += "<a class='active' href='" + i + "'>&nbsp&nbsp" + i + "&nbsp&nbsp</a> ";
               }else{
                  str += "<a href='" + i + "'>&nbsp&nbsp" + i + "&nbsp&nbsp</a> ";
               }   
            }
            if(data.pm.next) str +="<a href='" + next + "'>▶</a>";
            $("#pagination").html(str);
            }
      });
   };
   
   $("#pagination").on("click","a",function(e){
      e.preventDefault();
      page1 = $(this).attr("href");
      getBoardQA_list();
   });
</script>