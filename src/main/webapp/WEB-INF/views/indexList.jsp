<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<ul class="list_category" id="list_category">
		<li>
			<a class="menu">
				<input class="item" type="hidden" value="product_detail desc"/>MD추천
			</a>
			<a class="menu">
				<input class="item" type="hidden" value="product_click desc"/>✨인기상품
			</a>
			<a class="menu">
				<input class="item" type="hidden" value="product_register desc"/>new ❗❗
			</a>
			<a class="menu">
				<input class="item" type="hidden" value="product_selling desc"/>제일 많이 팔렸어요
			</a>
		</li>
	</ul>
	<div id="best_product"></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each list}}
		<div id="product">
			<a href="/meal_detail?product_id={{product_id}}">
				<div class="product_image">
					<img src="/displayFile?fullName={{product_image}}" width=240 height=240/>
				</div>
			</a>
			<div class="product_name">{{product_name}}</div>
			<div class="product_price">{{nf product_price}}원</div>
		</div>
		{{/each}}
	</script>
</div>
<script>
Handlebars.registerHelper("nf", function(price){
    var regexp = /\B(?=(\d{3})+(?!\d))/g; 
    return price.toString().replace(regexp, ",");
});
</script>
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
	Handlebars.registerHelper("nf", function(product_price){
	    var regexp = /\B(?=(\d{3})+(?!\d))/g; 
	    return product_price.toString().replace(regexp, ",");
	});
</script>

<script>

//md추천 목록 
var orderBy="product_click desc";
getmain_list();

$("#list_category").on("click", ".menu", function(){
	orderBy=$(this).children(".item").val();
	getmain_list();
});

function getmain_list(){
	$.ajax({
		type:"get",
		url:"/product/main_product.json",
		dataType:"json",
		data:{"orderBy":orderBy},
		success:function(data){
			//alert(orderBy);
			console.log(data);
			var temp=Handlebars.compile($("#temp").html());
			$("#best_product").html(temp(data));
		}
	});
}
	
//sns고객후기 스크립트	
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