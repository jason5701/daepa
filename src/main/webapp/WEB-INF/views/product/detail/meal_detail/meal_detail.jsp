<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	<div id="items"></div>
	<script id="tempitems" type="text/x-handlebars-template">
	<ul class="meterials">
		{{#each list}}
			<li>
				<a href="/vege_detail?meterial_id={{meterial_id}}">
					<img src="/displayFile?fullName={{meterial_image}}" width=150 height=150 />
					<span class="items_name">{{meterial_name}}</span><br>
					<span class="items_price">{{meterial_price}}원</span>
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
    <a onclick="fnMove('3')">상품후기</a>
    <a onclick="fnMove('4')">상품문의</a>
  </p>
</div>
<div class="detailContent">
	<div id="detailContent1" ></div>
	<script id="tempFiles" type="text/x-handlebars-template">
		<img src="/displayFile?fullName=detail/{{fullName}}" width=900px/>
	</script>
	<div id="detailContent2" ></div>
	<div id="detailContent3" ><jsp:include page="${product_review}"></jsp:include></div>
	<div id="detailContent4" ><jsp:include page="${product_boardQA_list}"></jsp:include></div>
</div>

<script>
var product_id="${vo.product_id}";

	//연관재료불러오기
	getMeterial_list();
	function getMeterial_list(){
		$.ajax({
			type:"get",
			url:"/product/meterial_list.json",
			dataType:"json",
			data:{"product_id":product_id},
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
	//첨부 상세설명이미지1
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