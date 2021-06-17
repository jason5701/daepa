<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<h2>쿠폰관리</h2>
<form name="frm" encType="multipart/form-data">
	<table>
		<tr>
			<td>쿠폰번호</td>
			<td><input type="text" name="coupon_id" value="${vo.coupon_id}" readonly/></td>
		</tr>
		<tr>
			<td>쿠폰명</td>
			<td><input type="text" name="coupon_name" value="${vo.coupon_name}" readonly/></td>
			<td>할인가</td>
			<td><input type="text" name="coupon_discount" value="<fmt:formatNumber value="${vo.coupon_discount}" pattern="#,###"/>" /></td>
		</tr>
		<tr>
			<td>발행일</td>
			<td><input type="text" value="<fmt:formatDate value="${vo.coupon_register}" pattern="yyyy-MM-dd"/>" readonly/></td>
			<td>마감일</td>
			<fmt:parseDate var="parsedDate" value="${vo.coupon_end}" pattern="yyyy-MM-dd"/>
			<td><input type="text" name="coupon_end" value="<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd"/>"/></td>
		</tr>
		<tr>
			<td>상태</td>
			<td colspan=3>
				<select name="coupon_exp">
					<option value=0 <c:out value="${vo.coupon_exp=='0'?'selected':''}"/>>발행</option>
					<option value=1 <c:out value="${vo.coupon_exp=='1'?'selected':''}"/>>쿠폰만료</option>
					<option value=2 <c:out value="${vo.coupon_exp=='2'?'selected':''}"/>>사용중지</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>이미지</td>
			<td>
				<c:if test="${vo.coupon_image!=null}">
					<img src="/displayFile?fullName=${vo.coupon_image}" width=150 height=170 id="coupon_img"/>
				</c:if>
				<c:if test="${vo.coupon_image==null}">
					<img src="http://placehold.it/50x70" id="coupon_img"/>
				</c:if>
				<input type="file" name="file" style="display:none;"/>
			</td>
		</tr>
	</table>
	<div>
		<input type="button" id="coupon_confirm" value="확인">
		<input type="button" onClick="location.href='/coupon/admin'" value="목록">
	</div>
</form>
<script>
	$("#coupon_confirm").on("click",function(e){
		e.preventDefault();
		if(!confirm("쿠폰을 수정하시겠습니까?")) return;
		frm.action="/coupon/admin_update";
		frm.method="post";
		frm.submit();
	});
	$("#coupon_img").on("click",function(){
		$(frm.file).click();
	});
	$(frm.file).on("change",function(){
		var file=$(frm.file)[0].files[0];
		$("#coupon_img").attr("src",URL.createObjectURL(file));
	})
</script>