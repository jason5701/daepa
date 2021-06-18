<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<link rel="stylesheet" href="/resources/css/detail.css" />
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<div id="detail">
	<div id="product_image">
		<img src="http://placehold.it/320x320" />
	</div>
	<div id="product_detail">
		<div class="product_name" >제육볶음 1인분</div>
		<div class="product_detail">돼지고기를 맛있게 볶음</div><br>
		<div class="product_price">8,900원</div><hr>
		<dl class="list fst">
			<dt class="tit">판매단위</dt> 
			<dd class="desc">1봉</dd>
		</dl>
		<dl class="list fst">
			<dt class="tit">중량/용량</dt> 
			<dd class="desc">600g</dd>
		</dl><hr>
		<dl class="list fst">
			<dt class="tit">배송구분</dt> 
			<dd class="desc">대파배송/택배배송</dd>
		</dl>
		<dl class="list fst">
			<dt class="tit">포장타입</dt> 
			<dd class="desc">냉장/종이포장</dd>
		</dl><hr>
		<dl class="list fst">
			<dt class="tit">구매수량</dt> 
			<dd class="qtt">
			  <a id="qtt_down"><img src="/resources/image/index/minus.png"/></a>
			  <span id="product_qtt">1</span>
			  <a id="qtt_up"><img src="/resources/image/index/plus.png"/></a>
			</dd>
		</dl><hr>
		<div id="groupBtn">
			<button class="btnAlarm">재입고알림</button>
			<button class="btnSave">늘 사는 것</button>
			<button class="btnCart">장바구니 담기</button>
		</div>
		<div id="price">
			총 합산금액 :
			<span>sum</span>
			<span>원</span>
		</div>
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
	<div id="detailContent1" >상품설명</div>
	<div id="detailContent2" >상세정보</div>
	<div id="detailContent3" >고객후기</div>
	<div id="detailContent4" >상품문의</div>
</div>

<script>

//수량업다운 스크립트
$(function(){
	$('#qtt_down').click(function(e){
		e.preventDefault();
		var stat = $('#product_qtt').text();
		var num = parseInt(stat,10);
		num--;
		if(num<=0){
			alert('더 이상 줄일 수 없습니다.');
			num=1;
		}
		$('#product_qtt').text(num);
	});
	
	$('#qtt_up').click(function(e){
		e.preventDefault();
		var stat = $('#product_qtt').text();
		var num = parseInt(stat,10);
		num++;
		if(num>100){
			alert('더 이상 늘릴 수 없습니다.');
			num=100;
		}
		$('#product_qtt').text(num);
	});
});

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