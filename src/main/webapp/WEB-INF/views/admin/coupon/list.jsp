<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<h2>쿠폰리스트</h2>
<div>
	<button onClick="location.href='/coupon/admin_insert'">쿠폰발행</button>
</div>
<div>
	<c:forEach items="${list}" var="vo">
		<div class="coupon_box" style="float:left; margin-left:20px;">
			<div>
				<c:if test="${vo.coupon_image!=null}">
					<img src="/displayFile?fullName=${vo.coupon_image}" width=50 height=70/>
				</c:if>
				<c:if test="${vo.coupon_image==null}">
					<img src="http://placehold.it/50x70"/>
				</c:if>
			</div>
			<div>${vo.coupon_id}</div>
			<div>${vo.coupon_name}</div>
			<div>할인가 : <fmt:formatNumber value="${vo.coupon_discount}" pattern="#,###원"/></div>
			<fmt:parseDate var="parsedDate" value="${vo.coupon_end}" pattern="yyyy-MM-dd"/>
			<div>마감일 : <fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd"/></div>
			<c:if test="${vo.coupon_exp==0}">
				<div>상태 : <b>사용중</b></div>
			</c:if>
			<c:if test="${vo.coupon_exp==1}">
				<div>상태 : <b>쿠폰만료</b></div>
			</c:if>
			<c:if test="${vo.coupon_exp==2}">
				<div>상태 : <b>사용중지</b></div>
			</c:if>
			<div>
				<button onClick="location.href='/coupon/read_set?coupon_id=${vo.coupon_id}'">쿠폰 설정</button>
			</div>
		</div>
	</c:forEach>
</div>
