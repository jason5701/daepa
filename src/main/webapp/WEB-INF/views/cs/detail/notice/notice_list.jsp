<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <style>

      table{width:100%;border-collapse: collapse;border-bottom:solid 1px;font-weight:bold;}
     #notice_list{margin-top:25px;}
      td{border:solid 1px rgb(200, 200, 200) solid;padding: 10px;text-align: center;}
      .row:hover{cursor:pointer;}
      .row{border-top:solid 1px rgb(200, 200, 200); font-size:13px;}
      .title{background: #FAFAFA; border-top:2px solid;text-align: center; font-size:15px;}
      #pagination{text-align: center; font-size:12pt; font-weight:bold; }
     #pagination a{text-decoration:none; color:#123478;}
     #pagination .active{color:#ccc;}
     #product_boardQA_insert{text-align:right;}
      #review_insert{text-align:right;}
      .tit{font-size:25px;}
      .titSub{font-size:12px;}
      #total{display:none;}
   </style>
<div id="notice_list">
   <h2 class="tit" style="text-align:left; color:#123478;">공지사항</h2><br/>
   <table id="tbl"></table>
   <script id="temp" type="text/x-handlebars-template">
      <tr class="title">
         <td>번호</td>
         <td width=250>제목</td>
         <td>작성자</td>
         <td>작성일</td>
         <td>조회수</td>
      </tr>
      {{#each notice_hashmap}}
         <tr class="row" onClick="location.href='/cs/notice/read?notice_number={{notice_number}}'" style="cursor:pointer;">
            <td>{{notice_number}}</td>
            <td>{{notice_title}}</td>
            <td>{{notice_writer}}</td>
            <td>{{notice_write_date}}</td>
            <td>{{notice_click}}</td>
         </tr>
      {{/each}}
   </script>
</div>
<br/>
<div id="pagination"></div>

<script>
   var page=1;
   
      getList();
      function getList(){
         var notice_no="${vo.notice_number}";
         $.ajax({
            
            type : "get",
            url : "/board/notice/list.json",
            dataType : "json",
            data : {"page":page},
            success : function(data){
               //alert("notice_list페이지");
               var temp = Handlebars.compile($("#temp").html());
               $("#tbl").html(temp(data));
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
            getList();
         });

</script>