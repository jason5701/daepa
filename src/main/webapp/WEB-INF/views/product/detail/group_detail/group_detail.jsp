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

<!-- 디테일 메뉴탭 -->
<div class="detailMenu" style="margin-top:70px; ">
  <p>
    <a onclick="fnMove('1')">상품설명</a> <!-- 나눔판매설명 -->
    <a onclick="fnMove('2')">상세정보</a> <!-- 나눔판매정보 -->
    <a onclick="fnMove('3')">오프너등급</a> <!-- 나눔판매 user의 포인트에 따른 등급 -->
    <a onclick="fnMove('4')">나눔하는곳</a> <!-- user 주소 api? 또는 api지도로 나눔 직거래 장소 표시 -->
  </p>
</div>
<div class="detailContent">
	<div id="detailContent1" ></div>
	<div id="detailContent2" >상세정보</div>
	<div id="detailContent3" >고객후기</div>
	<div id="detailContent4" >상품문의</div>
</div>

<script>
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

</script>