<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="product_image">
	<img src="/displayFile?fullName=${vo.product_image}" width=400 height=400 />
</div>
<div id="product_detail">
	<div class="product_id" style="display:none; ">${vo.product_id}</div>
	<div class="product_name">${vo.product_name}</div>
	<div class="product_detail">${vo.product_detail}</div><br>
	<div class="product_price"><fmt:formatNumber value="${vo.product_price}" pattern="#,###,###"/>원</div><hr>
	<dl class="list fst">
		<dt class="tit">판매단위</dt> 
		<dd class="desc">1봉</dd>
	</dl>
	<dl class="list fst">
		<dt class="tit">중량/용량</dt> 
		<dd class="desc">200g</dd>
	</dl><hr>
	<dl class="list fst">
		<dt class="tit">배송구분</dt> 
		<c:if test="${vo.product_delivery==0}">
			<dd class="desc">무료배송</dd>
		</c:if>
		<c:if test="${vo.product_delivery!=0}">
			<dd class="desc">일반배송</dd>
		</c:if>
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
		<span id="product_sum"></span>
		<span>원</span>
	</div>
</div>
<script>

var product_price="${vo.product_price}";

//카트담기
$(".btnCart").click(function(){
var product_qtt = $("#product_qtt").html();
var product_id = $(".product_id").html();
var product_name = $(".product_name").html();

	$.ajax({
		url : "/cart/insert",
		type : "post",
		data : {"product_id":product_id, "cart_product_qtt":product_qtt},
		success : function(result){
			if(result == 1){
				if(!confirm(product_name+" 을(를) 장바구니에 추가할까요?")) return;
				alert("장바구니에 추가되었습니다.");
			}else{
				alert("로그인된 회원만 사용할 수 있습니다.");
			}
		}
	});
});

	//수량업다운 스크립트
	$(function(){
		$("#product_sum").html(product_price*1);
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
			$("#product_sum").html(product_price*num);
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
			$("#product_sum").html(product_price*num);
		});
	});
</script>