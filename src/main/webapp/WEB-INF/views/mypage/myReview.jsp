<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page_section">
	<div class="head_aticle">
		<h2 class="tit">상품 후기
			<span class="tit_sub">즐겨찾기로 등록한 상품목록입니다</span>
		</h2>				
	</div>	
	<div class="div_container">
		<div class="div_checkbox">
			<select id="keyword" style="float:right;">
				<option value="review_number desc" selected>최근등록순</option>
				<option value="review_click desc">조회많은순</option>
			</select>
			<span id="total" style="display:none;"></span>
		</div>
	</div>
	<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
		<tr class="title">
			<td width=50>번호</td>
			<td width=100>상품이름</td>
			<td width=100>제목</td>
        	<td width=50>작성자</td>
         	<td width=100>작성일</td>
			<td width=50>조회</td>      	
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
	
	$("#keyword").on("change", function(){
		page=1;
		getUser_review_list();
	});
	
	function getUser_review_list(){
		var keyword=$("#keyword").val();
		$.ajax({
			type:"get",
			url:"/board/user_review_list.json",
			dataType:"json",
			data:{"page":page,"keyword":keyword,"searchType":user_id},
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
		getUser_review_list();
	});
</script>
</div>