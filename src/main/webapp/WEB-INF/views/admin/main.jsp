<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<link rel="stylesheet" href="/resources/css/admin_main.css"/>
<div id="notice_main">
	<div id="content">
		<div class="page_aticle aticle_type2">
			<div id="snb" class="snb_cc">
				<h2 class="tit_snb">관리자</h2>
				<div>
					<c:if test="${admin_id!=null}">
						<button class="btn_admin2" style="margin-bottom:20px; margin-left:35px;" onClick="location.href='/admin/logout'">로그아웃</button>
					</c:if>
				</div>
				<div class="inner_snb">
					<ul class="list_menu">
						<li class="on">
							<a href="#none" onclick="location.href='/admin/main'">공지사항</a>
						</li>
						<li class="on">
							<a href="#none" onclick="location.href='/admin/commonQA'">자주하는질문</a>
						</li>
						<li class="on">
							<a href="#none" onclick="location.href='/admin/orders'">주문내역</a>
						</li>
						<li class="on">
							<a href="#none" onclick="location.href='/cs_service'">1:1채팅</a>
						</li>
						<li class="on">
							<a href="#none" onclick="location.href='/board/suggestion'">제안</a>
						</li>
						<li class="on">
							<a href="#none" onclick="location.href='/admin/hotDeal'">핫딜</a>
						</li>
						<li class="on">
							<a href="#none" onclick="location.href='/coupon/admin'">쿠폰</a>
						</li>
						<li class="on">
							<a href="#none" onclick="location.href='/admin/product'">완제품 관리</a>
						</li>
						<li class="on">
							<a href="#none" onclick="location.href='/admin/meterial'">재료 관리</a>
						</li>
						<li class="on">
							<a href="#none" onclick="location.href='/admin/analyze'">분석</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="page_section">
				<jsp:include page="${rightPage}"></jsp:include>
			</div>
		</div>
	</div>
</div>