<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="all_list">
	<div id="all_list_div"></div>
		<script id="temp" type="text/x-handlebars-template">
		{{#each list}}
		<div class="all_product">
			<a href="/detail">
				<div class="all_image">
					<img src="/displayFile?fullName={{meterial_image}}" width=320 height=300/>
				</div>
			</a>
			<div class="all_name">{{meterial_name}}</div>
			<div class="all_price">{{meterial_price}}원</div>
		</div>
		{{/each}}
	</script>
</div>
<script>
	var page=1;
	getMeterial_list();
	function getMeterial_list(){
		var keyword="";
		$.ajax({
			type:"get",
			url:"/meterial/meterial.json",
			dataType:"json",
			data:{"page":page,"keyword":keyword},
			success:function(data){
				console.log(data);
				var temp=Handlebars.compile($("#temp").html());
				$("#all_list_div").html(temp(data));
			}
		});
	}
</script>