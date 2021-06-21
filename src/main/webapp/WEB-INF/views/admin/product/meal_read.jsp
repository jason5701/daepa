<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<h2>${vo.product_name}</h2>
<form name="frm" encType="multipart/form-data">
	<table>
		<tr>
			<td>품번</td>
			<td><input type="text" name="product_id" value="${vo.product_id}" readonly/></td>
			<td>품명</td>
			<td><input type="text" value="${vo.product_name}" readonly/></td>
		</tr>
		<tr>
			<td>단가</td>
			<td colspan=3><input type="text" name="product_price" value="${vo.product_price}"/></td>

		</tr>
		<tr>
			<td>배송정보</td>
			<td>
				<select name="product_delivery">
					<option value="0" <c:out value="${vo.product_delivery=='0'?'selected':''}"/>>무료배송</option>
					<option value="1" <c:out value="${vo.product_delivery=='1'?'selected':''}"/>>일반배송</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${vo.product_click}</td>
			<td>판매량</td>
			<td>${vo.product_selling}</td>
		</tr>
		<tr>
			<td>상태</td>
			<td>
				<select name="product_drop">
						<option value="0" <c:out value="${vo.product_drop=='0'?'selected':''}"/>>판매중</option>
						<option value="1" <c:out value="${vo.product_drop=='1'?'selected':''}"/>>판매중지</option>
				</select>
			</td>
			<td>대표재료</td>
			<td>
				<select name="product_main_meterial">
					<c:forEach items="${main_list}" var="vo">
						<option>${vo}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>상품 설명</td>
			<td colspan=3><textarea name="product_detail" style="width:500px; height:200px; resize: none;">${vo.product_detail}</textarea></td>
		</tr>
		<tr>
			<td>대표 이미지</td>
			<td colspan=3>
				<c:if test="${vo.product_image==null}">
					<img src="http://placehold.it/300x300" id="product_image"/>
				</c:if>
				<c:if test="${vo.product_image!=null}">
					<img src="/displayFile?fullName=${vo.product_image}" id="product_image"/>
				</c:if>
				<input type="file" name="file" style="display:none;"/>	
			</td>
		</tr>
	</table>
	<div>
		<button id="btn_modify">수정</button><input type="button" id="btn_list" value="목록">
	</div>
</form>
<script>
	$("#product_image").on("click",function(){
		$(frm.file).click();
	});
	$(frm.file).on("change",function(){
		var file=$(frm.file)[0].files[0];
		$("#product_image").attr("src",URL.createObjectURL(file));
	});
	$("#btn_modify").on("click",function(e){
		e.preventDefault();
		if(!confirm("수정하시겠습니까?")) return;
		frm.action="/product/update";
		frm.method="post";
		frm.submit();
	});
	$("#btn_list").on("click",function(e){
		e.preventDefault();
		location.href="/admin/product";
	});
</script>