<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="slideBox">
	<input type="radio" name="slide" id="slide01" checked />
	<input type="radio" name="slide" id="slide02" />
	<input type="radio" name="slide" id="slide03" />
	<input type="radio" name="slide" id="slide04" />
	<ul class="slideList">
		<li class="slideItem">
			<div>
				<label for="slide04" class="left"></label>
				<label for="slide02" class="right"></label>
				<a><img src="/resources/image/index/slide01.jpg"/></a>
			</div>
		</li>
		<li class="slideItem">
			<div>
				<label for="slide01" class="left"></label>
				<label for="slide03" class="right"></label>
				<a><img src="/resources/image/index/slide02.jpg"/></a>
			</div>
		</li>
		<li class="slideItem">
			<div>
				<label for="slide02" class="left"></label>
				<label for="slide04" class="right"></label>
				<a><img src="/resources/image/index/slide03.jpg"/></a>
			</div>
		</li>
		<li class="slideItem">
			<div>
				<label for="slide03" class="left"></label>
				<label for="slide01" class="right"></label>
				<a><img src="/resources/image/index/slide04.png"/></a>
			</div>
		</li>
	</ul>

</div>

<div id="monthly">
	<h2>MD의 추천상품👍</h2>
	<ul class="list_category">
		<li><a href="#" class="menu">밀키트/완제품</a></li>
		<li><a href="#" class="menu">육류</a></li>
		<li><a href="#" class="menu">해산물</a></li>
		<li><a href="#" class="menu">채소/과일</a></li>
		<li><a href="#" class="menu">양념/조미료</a></li>
	</ul>
	<div id="product">
		<div class="product_image">상품이미지</div>
		<div class="product_name">상품명</div>
		<div class="product_price">상품가격</div>
	</div>
	<div id="product">
		<div class="product_image">상품이미지</div>
		<div class="product_name">상품명</div>
		<div class="product_price">상품가격</div>
	</div>
	<div id="product">
		<div class="product_image">상품이미지</div>
		<div class="product_name">상품명</div>
		<div class="product_price">상품가격</div>
	</div>
	<div id="product">
		<div class="product_image">상품이미지</div>
		<div class="product_name">상품명</div>
		<div class="product_price">상품가격</div>
	</div>
</div>

<div id="snsBox">
	<h2>📸 SNS 고객후기 📸</h2>
	<div class="slide_wrapper">
		<ul class="slides">
			<li><a href="https://snapwidget.com/v/ib/18100021696216190/?src=pgwrQEbX"><img src="/resources/image/index/sns_slide01.jpg" width=200 height=200 /></a></li>
			<li><a href="https://snapwidget.com/v/ib/17910183724722339/?src=pgwrQEbX"><img src="/resources/image/index/sns_slide02.jpg" width=200 height=200 /></a></li>
			<li><a href="https://snapwidget.com/v/ib/17906110741735648/?src=pgwrQEbX"><img src="/resources/image/index/sns_slide03.jpg" width=200 height=200 /></a></li>
			<li><a href="https://snapwidget.com/v/ib/18146695975197597/?src=pgwrQEbX"><img src="/resources/image/index/sns_slide04.jpg" width=200 height=200 /></a></li>
			<li><a href="https://snapwidget.com/v/ib/17863497893441200/?src=pgwrQEbX"><img src="/resources/image/index/sns_slide05.jpg" width=200 height=200 /></a></li>
		</ul>
	</div>
	<p class="controls">
		<span class="prev"><img src="/resources/image/index/left.png"/></span>
		<span class="next"><img src="/resources/image/index/right.png"/></span>
	</p>
</div>

<script>
	var slides=document.querySelector('.slides'),
		slide=document.querySelectorAll('.slides li'),
		currentIdx=0,
		slideCount=slide.length,
		slideWidth=200,
		slideMargin=30,
		prevBtn=document.querySelector('.prev'),
		nextBtn=document.querySelector('.next')
		
	makeClone();
	
	function makeClone(){
		for(var i=0; i<slideCount; i++){
			var cloneSlide=slide[i].cloneNode(true);
			cloneSlide.classList.add('clone');
			slides.appendChild(cloneSlide);
		}
		for(var i=slideCount -1; i>=0; i--){
			var cloneSlide=slide[i].cloneNode(true);
			cloneSlide.classList.add('clone');
			slides.prepend(cloneSlide);
		}
		updateWidth();
		setInitialPos();
		
		setTimeout(function(){
			slides.classList.add('animated');
		}, 100);
	}
	
	function updateWidth(){
		var currentSlides=document.querySelectorAll('.slides li');
		var newSlideCount=currentSlides.length;
		
		var newWidth=(slideWidth+slideMargin)*newSlideCount-slideMargin+'px';
		slides.style.width=newWidth;
	}
	
	function setInitialPos(){
		var initialTranslateValue = -(slideWidth+slideMargin)*slideCount;
		slides.style.transform='translateX(' + initialTranslateValue + 'px)';
	}
	
	nextBtn.addEventListener('click', function(){
		moveSlide(currentIdx+1);
	});
	prevBtn.addEventListener('click', function(){
		moveSlide(currentIdx-1);
	});
	
	function moveSlide(num){
		slides.style.left = -num*(slideWidth+slideMargin)+'px';
		currentIdx=num;
		
		if(currentIdx == slideCount || currentIdx == -slideCount){
			
			setTimeout(function(){
				slides.classList.remove('animated');
				slides.style.left='0px';
				currentIdx=0;
			}, 500);		
			setTimeout(function(){
				slides.classList.add('animated');
			}, 600);	
		}
	}
</script>