<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="https://dapi.kakao.com/v2/search/blog?query=채소"></script>
<head>
	<link rel="stylesheet" href="/resources/css/detail.css" />
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<div id="detail">
	<div>
		<jsp:include page="${product_div}"></jsp:include>
	</div>
</div>
<!-- 블로그 API  -->
<h2>▮ POPULAR BLOG RECIPE </h2>
<div class="slide_wrapper">
<div id="blogs"></div>
	<script id="tempblogs" type="text/x-handlebars-template">
		{{#each documents}}
		<div style="float:left; width:220px; margin-left:20px;">
			<div class="thumb"><a href="{{url}}"><img src="{{thumbnail}}"></a></div>
			<br>
			<div class="title">{{{title}}}</div>
		</div>
		{{/each}}
	</script>
	</div>
<!-- 레시피재료 -->
<div id="recipeItems">
<h2>▮ ${vo.meterial_name} 재료로 만들 수 있는 요리가 있어요👨‍🍳</h2>
	<div class="slide_wrapper">
	<div id="items"></div>
	<script id="tempitems" type="text/x-handlebars-template">
	<ul class="meterials">
		{{#each list}}
			<li>
				<a href="/meal_detail?product_id={{product_id}}">
					<img src="/displayFile?fullName={{product_image}}" width=150 height=150 />
					<span class="items_name">{{product_name}}</span><br>
					<span class="items_price">{{product_price}}원</span>
				</a>
			</li>
		{{/each}}
	</ul>
	</script>
	</div>
</div>

<!-- 디테일 메뉴탭 -->
<div class="detailMenu">
  <p>
    <a onclick="fnMove('1')">상품설명</a>
    <a onclick="fnMove('2')">상세정보</a>
    <a onclick="fnMove('3')">고객후기(count)</a>
    <a onclick="fnMove('4')">상품문의(count)</a>
  </p>
</div>
<div class="detailContent">
	<div id="detailContent1" ></div>
	<script id="tempFiles" type="text/x-handlebars-template">
		<img src="/displayFile?fullName=detail/{{fullName}}" width=900px/>
	</script>
	<div id="detailContent2" >상세정보</div>
	<div id="detailContent3" >고객후기<jsp:include page="${meterial_review}"></jsp:include></div>
	<div id="detailContent4" >상품문의</div>
</div>

<script>
	var meterial_id="${vo.meterial_id}";
	var meterial_name="${vo.meterial_name}";
	var size="4";
	
	//연관음식불러오기
	getProduct_list();
	function getProduct_list(){
		$.ajax({
			type:"get",
			url:"/meterial/product_list.json",
			dataType:"json",
			data:{"meterial_id":meterial_id},
			success:function(data){
				console.log(data);
				var temp=Handlebars.compile($("#tempitems").html());
				$("#items").html(temp(data));
			}
		});
	}
	
	//스크롤 메뉴 스크립트
	$(function() {
	  $(document).ready(function() {
	
	    var scrollOffset = $('.detailMenu').offset();
	
	    $(window).scroll(function() {
	      if ($(document).scrollTop() > scrollOffset.top) {
	        $('.detailMenu').addClass('scroll-fixed');
	      }
	      else {
	        $('.detailMenu').removeClass('scroll-fixed');
	      }
	    });
	  });
	});
		
	function fnMove(seq){
		var offset = $("#detailContent" + seq).offset();
		$('html, body').animate({scrollTop : offset.top}, 400);
	}
	//첨부 상세설명이미지
	getAttach();
	function getAttach(){
		$.ajax({
			type:"post",
			url:"/meterial/getAttach",
			data:{"meterial_id":meterial_id},
			success:function(data){
				var temp=Handlebars.compile($("#tempFiles").html());
				$(data).each(function(){
					var tempData={"fullName":this};
					$("#detailContent1").append(temp(tempData));
				});
			}
		});
	}
	
	getlist();
	//블로그 API 스크립트
	function getlist(){
		$.ajax({
			type:"get",
			url:"https://dapi.kakao.com/v2/search/blog",
			headers:{"Authorization" : "KakaoAK a18571056e052529162aacd67fd66c8c"},
			dataType:"json",
			data:{"query":meterial_name + "반찬 요리", "size":size},
			success:function(data){
				var temp = Handlebars.compile($("#tempblogs").html());
				console.log(data);
				$("#blogs").html(temp(data));
			}
		});
	}
</script>