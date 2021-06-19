<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="all_list">
	<div id="all_list_div">
		<script id="temp" type="text/x-handlebars-template">
		{{#each list}}
		<div class="all_product">
			<a href="/detail">
				<div class="all_image">
					<img src="/displayFile?fullName={{product_image}}" width=320 height=300/>
				</div>
			</a>
			<div class="all_name">{{product_name}}</div>
			<div class="all_detail">{{product_detail}}</div>
			<div class="all_price">{{product_price}}</div>
		</div>
		{{/each}}
		</script>
	</div>
</div>
<script>
	var searchType=$("#category_list .type").html();
	$("#category_list").on("click",".type",function(){
		searchType=$(this).html();
		getProduct_list();
	});
	$("#orderBy").on("change",function(){
		getProduct_list();
	});
	getProduct_list()
	function getProduct_list(){
		var orderBy=$("#orderBy").val();
		$.ajax({
			type:"get",
			url:"/product/product.json",
			dataType:"json",
			data:{"searchType":searchType,"orderBy":orderBy},
			success:function(data){
				console.log(data);
				var temp=Handlebars.compile($("#temp").html());
				$("#all_list_div").html(temp(data));
			}
		});
	}
</script>