<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/mypage.css"/>
<link rel="stylesheet" href="/resources/css/admin_main.css"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="page_section">
   <div class="head_aticle_qna">
      <br/>
      <h2>고객문의목록
      </h2><br/>
      <table id="tbl1"></table>
      <script id="temp1" type="text/x-handlebars-template">
      <tr class="title" style="background:#fafafa;">
         <td width=100> 순번 </td>
         <td width=100>상품번호</td>
         <td width=400> 제목 </td>
         <td width=100> 작성자 </td>
         <td width=200> 작성일 </td>
         <td width=100> 답변상태 </td>
      </tr>
      {{#each list}}
         <tr class="row" onClick="location.href='/admin/boardQA/read?boardQA_number={{boardQA_number}}'" style="cursor:pointer;">
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
   var page1=1;
   getBoardQA_list();
   function getBoardQA_list(){
      $.ajax({
         type:"get",
         url:"/admin/product_boardQA_list.json",
         dataType:"json",
         data:{"page":page1},
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