<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/resources/css/mypage.css"/>

<!-- 마이페이지 head -->
<div id="content">
	<div class="page_aticle">
		<div class="mypage_top">
			<div id="mypage_top_user" class="mypagetop_user">
				<div id="inner_mypagetop" class="inner_mypagetop">
					<div class="grade_user">
						<div class="grade_wrap">
							<div class="grade_logo">웰컴</div>
							<strong class="user_name">${user_info.user_name} 님</strong>
						</div>
						<div class="grade_bnenfit">
							<div class="benefit">
								<strong class="tit"></strong>
								적립 5%
							</div>
							<div class="benefit">
								<strong class="tit"></strong>
								최초 1회 무료배송
							</div>
							<div class="benefit"></div>
						</div>
						<div class="next">
							<a class="total_grade">전체등급 보기</a>
							<a class="next_month">다음달 예상등급 보기</a>
						</div>
					</div>
					<div class="list_mypage">
						<div class="list">
							<a class="link_wrap">
								<div class="link_title">적립금
									<img src="/resources/image/mypage/arrow_right_gray_56_56.png"/>
								</div>
								<div class="spacer"></div>
								<p class="info"><fmt:formatNumber pattern="#,###" value="${user_info.user_point}" />원</p>						
							</a>
							<a class="link_wrap">
								<div class="link_title">쿠폰
									<img src="/resources/image/mypage/arrow_right_gray_56_56.png"/>
								</div>
							<div class="spacer"></div>
							<p class="info">0개</p>
						</a>
						<a class="link_wrap">
							<div class="link_title" onClick="location.href='/group/sales'">나눔관리
								<img src="/resources/image/mypage/arrow_right_gray_56_56.png"/>
							</div>
							<div class="spacer"></div>
							<p class="info" onClick="location.href='/group/sales'">자세히보기</p>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="mypage_content">
		<div class="aticle_type2">
			<div id="snb" class="snb_my">
				<jsp:include page="${leftPage}"/>
			</div>
		</div>
		<div class="page_section">
			<jsp:include page="${rightPage}"/>
		</div>
	</div>
</div>
</div>