<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="product_image">
	<img src="/displayFile?fullName=${vo.meterial_image}" width=400 height=400 />
</div>
<div id="product_detail">
	<div class="product_name">${vo.sales_name}</div>
	<div class="product_detail">${vo.sales_contents}</div><br>
	<div class="product_price"><fmt:formatNumber value="${vo.sales_price}" pattern="#,###,###"/>원</div><hr>
	<dl class="list fst">
		<dt class="tit">나눔판매자</dt> 
		<dd class="desc">${vo.user_id}</dd>
		<dt class="tit">나눔품목</dt> 
		<dd class="desc">${vo.meterial_name}</dd>
	</dl><hr>
	<dl class="list fst">
		<dt class="tit">최대구매수량</dt> 
		<dd class="desc">${vo.sales_whole_qtt}</dd>
	</dl><hr>
	<dl class="list fst">
		<dt class="tit">나눔인원</dt> 
		<dd class="desc">${vo.seles_people}</dd>
	</dl>
	<dl class="list fst">
		<dt class="tit">마감일</dt> 
		<dd class="desc">${vo.sales_end}</dd>
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
		<span id="product_sum"></span>
		<span>원</span>
	</div>
</div>
<script>
	var sales_price="${vo.sales_price}";
	//수량업다운 스크립트
	$(function(){
		$("#product_sum").html(sales_price*1);
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
			$("#product_sum").html(sales_price*num);
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
			$("#product_sum").html(sales_price*num);
		});
	});
</script>