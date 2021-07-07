 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/mypage.css"/>
    <style>
       .page_section{width:810px; height:600px; float:right; margin-top:20px; }
      table{width: 100%;border-collapse: collapse;border-bottom:solid 1px;  font-weight:bold;}
      td{border:solid 1px rgb(200, 200, 200) solid;padding: 10px;text-align: center;}
      .row:hover{cursor:pointer;}
      .row{border-top:solid 1px rgb(200, 200, 200);}
      .title{border-top:2px solid;text-align: center;}
      #pagination{text-align: center; margin-top:10px;}
      #pagination a{text-decoration:none; color:#123478;font-weight:bold;}
      #pagination .active{color:#ccc}
      #review_insert{text-align:right;}
      #total{display:none;}
   </style>
<div class="page_section">
   <div class="head_aticle_review">
      <h2 class="tit">상품 후기
         <span class="tit_sub">즐겨찾기로 등록한 상품목록입니다</span>
      </h2>            
   </div>   
   <div class="div_container">
      <div class="div_checkbox">
         <select id="orderBy" style="float:right;">
            <option value="review_number desc" selected>최근등록순</option>
            <option value="review_click desc">조회많은순</option>
         </select>
         <span id="total" style="display:none;"></span>
      </div>
   </div>
   <table id="tbl"></table>
   <script id="temp" type="text/x-handlebars-template">
      <tr class="title" style="background:#fafafa;">
         <td width=30>번호</td>
         <td width=200>상품이름</td>
         <td width=100>제목</td>
         <td width=50>작성자</td>
         <td width=200>작성일</td>
         <td width=30>조회</td>         
      </tr>
      {{#each list}}
      <tr class="row" onClick="location.href='/board/user_review_read?review_number={{review_number}}'">  
         <td>{{review_number}}</td>
         <td>{{product_name}}</td>
         <td>{{review_title}}</td>
          <td>{{review_writer}}</td>
          <td>{{review_write_date}}</td>
         <td>{{review_click}}</td>
      <tr>
      {{/each}}
   </script>
   <div id="pagination"></div>
<script>
   var user_id="${user_info.user_id}";
   var page=1;
   getUser_review_list();
   
   $("#orderBy").on("change", function(){
      page=1;
      getUser_review_list();
   });
   
   function getUser_review_list(){
      var orderBy=$("#orderBy").val();
      $.ajax({
         type:"get",
         url:"/board/user_review_list.json",
         dataType:"json",
         data:{"page":page,"orderBy":orderBy,"searchType":user_id},
         success:function(data){
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
      page = $(this).attr("href");
      getUser_review_list();
   });
</script>
</div>