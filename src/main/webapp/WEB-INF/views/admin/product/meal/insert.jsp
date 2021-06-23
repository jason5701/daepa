<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<h2>1인 밀키트 추가</h2>
<form name="frm" encType="multipart/form-data">
	<table>
		<tr>
			<td>품번</td>
			<td><input type="text" name="product_id" value="${new_id}" readonly/></td>
			<td>품명</td>
			<td><input type="text" name="product_name"/></td>
		</tr>
		<tr>
			<td>단가</td>
			<td colspan=3><input type="text" name="product_price"/></td>

		</tr>
		<tr>
			<td>배송정보</td>
			<td>
				<select name="product_delivery">
					<option value="0" selected>무료배송</option>
					<option value="1" >일반배송</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>대표재료</td>
			<td colspan=3>
				<select name="product_main_meterial">
					<c:forEach items="${main_list}" var="vo">
						<option >${vo}</option>
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
				<img src="http://placehold.it/300x300" id="product_image"/>
				<input type="file" name="file" style="display:none;"/>	
			</td>
		</tr>
	</table>
	<div>
		<button id="btn_save">저장</button><input type="button" onClick="location.href='/admin/product'" value="목록">
	</div>
</form>
<script>
	$("#product_image").on("click",function(){
		$(frm.file).click();
	});
	$("#btn_save").on("click",function(e){
		e.preventDefault();
		var product_name=$(frm.product_name).val();
		var product_price=$(frm.product_price).val();
		if(product_name=="") {
			alert("상품명을 입력하세요.");
			$(frm.product_name).focus();
			return;
		}else if(product_price==""){
			alert("단가를 입력하세요.");
			$(frm.product_price).focus();
			return;
		}
		if(!confirm("상품을 추가하시겠습니까?")) return;
		frm.action="/product/admin_insert";
		frm.method="post"; 
		frm.submit();
		
	});
	$(frm.file).on("change",function(){
		var file=$(frm.file)[0].files[0];
		$("#product_image").attr("src",URL.createObjectURL(file));
	})
</script>