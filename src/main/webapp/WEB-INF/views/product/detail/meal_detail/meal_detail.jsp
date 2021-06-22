<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<!-- 레시피재료 -->
<div id="recipeItems">
<h2>▮ RECIPE ITEMS</h2>
	<div class="slide_wrapper">
	<!-- <script id="temp" type="text/x-handlebars-template"> -->
	<ul class="meterials">
		<!-- {{#each list}} -->
			<li>
				<img src="" width=180 height=150 />
				<span class="meterial_name">매운 청양고추 100g</span><br>
				<span class="meterial_price">5,000원</span>
			</li>
		<!-- {{/each}} -->
	</ul>
	<!-- </script> -->
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
		<img src="/displayFile?fullName=detail/{{fullName}} width=900px"/>
	</script>
	<div id="detailContent2" >상세정보</div>
	<div id="detailContent3" >고객후기<jsp:include page="${product_review}"></jsp:include></div>
	<div id="detailContent4" >상품문의</div>
</div>

<script>
	var product_id="${vo.product_id}";
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
			url:"/product/getAttach",
			data:{"product_id":product_id},
			success:function(data){
				var temp=Handlebars.compile($("#tempFiles").html());
				$(data).each(function(){
					var tempData={"fullName":this};
					$("#detailContent1").append(temp(tempData));
				});
			}
		});
	}
</script>