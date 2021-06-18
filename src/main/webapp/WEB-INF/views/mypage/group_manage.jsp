<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>나눔판매 관리</h2>
<div style="float:right; ">
	<div style="overflow:hidden; width:700;">
		<div id="meterial_div"></div>
		<script id="temp" type="text/x-handlebars-template">
			{{#each list}}
				<div style="float:left;">
					<div><img src="/displayFile?fullName={{meterial_image}}" width=120 height=100 /></div>
					<div>{{meterial_id}}</div>
					<div>{{meterial_name}}</div>
				</div>
			{{/each}}
		</script>
	</div>
	<div id="pagination"></div>
	<div class="div_search">
		<input type="text" id="keyword" placeholder="검색어를 입력하세요."/>
		<button id="btn_search">검색</button>
	</div>
</div>
<script>
	var page=1;
	var keyword="";
	$("#keyword").on("keydown",function(e){
		if(e.keyCode==13) {
			$("#btn_search").click();
		}
	});
	$("#btn_search").on("click",function(){
		page=1;
		keyword=$("#keyword").val();
		getMeterial_list();
	});
	getMeterial_list();
	function getMeterial_list(){
		$.ajax({
			type:"get",
			url:"/meterial/meterial.json",
			dataType:"json",
			data:{"page":page,"keyword":keyword},
			success:function(data){
				var temp=Handlebars.compile($("#temp").html());
				$("#meterial_div").html(temp(data));
				
				var str="";
				for(var i=data.pm.startPage; i<=data.pm.endPage; i++){
					if(i==page){
						str+="<a style='color:red;' href='"+i+"'>"+i+"</a>"
					}else{
						str+="<a href='"+i+"'>"+i+"</a>"
					}
				}
				$("#pagination").html(str);
			}
		});
	}
	$("#pagination").on("click","a",function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getMeterial_list();
	});
</script>