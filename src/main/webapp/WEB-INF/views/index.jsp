<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>대파🥬</title>
	<link rel="stylesheet" href="/resources/css/index.css" />
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<div id="container">
		<div id="header">
			<div id="userMenu">
				<div class="menuItem"><a href="">고객센터</a></div>
				<div class="menuItem">
					<c:if test="${user_id != null}">
	  					<span style="margin-right:20px;">${user_id} 님</span>
	 				  	<a href="/user/logout">로그아웃</a>
	   				</c:if>
   					<c:if test="${user_id == null}">
	 					<a href="/user/login">로그인</a>
	  				</c:if>
				</div>
				<div class="menuItem">	
					<c:if test="${user_id != null}">
	  					<a href="/mypage">마이페이지</a>
	  				</c:if>				
					<c:if test="${user_id == null}">
	 					<a href="/user/register">회원가입</a>
	  				</c:if>	  				
				</div>
			</div>
			<a href="/index"><img src="/resources/image/index/Dlogo.jpg" /></a>
			<div id="category">
				<div id="allCategory">
					<ul class="all">
						<li><a href="#">전체 카테고리</a>
				            <ul class="all_sub">
				                <li><a href="/all_product">전체 상품</a>
				                    <ul class="sub">
				                    	<li><a href="#">1인밀키트/완제품</a></li>
				                        <li><a href="#">육류</a></li>
				                        <li><a href="#">해산물</a></li>
				                        <li><a href="#">채소/과일</a></li>
				                        <li><a href="#">양념/조미료</a></li>
				                    </ul>
				                </li>
				                <li><a href="/group_product">공동구매</a>
				                    <ul class="sub">
				                       	<li><a href="#">1인밀키트/완제품</a></li>
				                        <li><a href="#">육류</a></li>
				                        <li><a href="#">해산물</a></li>
				                        <li><a href="#">채소/과일</a></li>
				                        <li><a href="#">양념/조미료</a></li>
				                    </ul>
				                </li>
				            </ul>
				        </li>
			        </ul>
				</div>
				<div id="menu">
					<span class="menuCart"></span>
					<span class="menuLocation"></span>
				</div>
				<div id="searchBox">
					<input type="text" size=20 placeholder="검색" />
					<span class="searchIcon"></span>
				</div>
			</div>
		</div><hr>
		
		<div id="main">	
			<jsp:include page="${pageName}" />
		</div><hr>
		
		<div id="footer">
			<div id="info">
				<div id="cs">
					<img src="/resources/image/index/cs.png" width=23px/>
					<span class="cstxt">대파고객센터</span>
					<h1>1588-5588</h1>
					<p>운영시간 : 오전 9시 - 오후 6시</p>
					<p>대파의 고객센터는 365일 운영됩니다🙂</p><br/>
					<button>1:1 문의하기</button>
					<p>📧 24시간 접수가 가능합니다.</p>
					<p>운영시간 내 순차적으로 답변드리겠습니다.</p>
				</div>
				<div id="company">
					<b>법인명(상호)</b> : 주식회사 대파 <span class="bar"> I </span> <b>사업자등록번호</b> : 123-12-12345
					<br>
					<b>통신판매업</b> : 제 2021-인천학익-01234 호 <span class="bar"> I </span> <b>대파책임자</b> : 김정훈
					<br>
					<b>주소</b> : 인천광역시 미추홀구 매소홀로488번길 6-32, 5층(학익동)
					<br>
					<b>제휴문의</b> : <a href="#" class="link">business@daepa.com</a><span class="bar"> I </span> <b>채용문의</b> : <a href="#" class="link">recruit@daepa.com</a>
					<br>
					<b>팩스</b> : 123 - 4567 - 8910 <span class="bar">I</span> <b>이메일</b> : <a href="" class="link">help@daepa.com</a>
					<br>
					<ul class="list_sns">
						<li>
							<a href="#" class="link_sns" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_instagram.png" alt="대파 인스타그램 바로가기"></a>
						</li>
						<li>
							<a href="#" class="link_sns" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_fb.png" alt="대파 페이스북 바로가기"></a>
						</li>
						<li>
							<a href="#" class="link_sns lst" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_youtube.png" alt="대파 유튜브 바로가기"></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<a href="#" class="scrollToTop"><img src="/resources/image/index/up.png" width=40 /></a>
</body>
<script>
$(document).ready(function(){

    //Check to see if the window is top if not then display button
    $(window).scroll(function(){
        if ($(this).scrollTop() > 300) {
            $('.scrollToTop').fadeIn();
        } else {
            $('.scrollToTop').fadeOut();
        }
    });

    //Click event to scroll to top
    $('.scrollToTop').click(function(){
        $('html, body').animate({scrollTop : 0},800);
        return false;
    });

});
</script>
</html>