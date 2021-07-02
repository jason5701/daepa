<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<style>	
	table td{text-align:left;}
</style>  
<h2>새채소 추가</h2>
<form name="frm" encType="multipart/form-data">
	<table>
		<tr>
			<td>품번</td>
			<td><input type="text" class="admin_text2" name="meterial_id" value="${new_id}" readonly/></td>
			<td>품명</td>
			<td><input type="text" class="admin_text2" name="meterial_name"/></td>
		</tr>
		<tr>
			<td>단가</td>
			<td colspan=3><input type="text" class="admin_text" name="meterial_price"/></td>

		</tr>
		<tr>
			<td>배송정보</td>
			<td>
				<select name="meterial_delivery">
					<option value="0" selected>무료배송</option>
					<option value="1" >일반배송</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>채소색상</td>
			<td colspan=3>
				<select name="meterial_color">
					<c:forEach items="${vege_list}" var="vo">
						<option value="${vo}">${vo}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>상품 설명</td>
			<td colspan=3><textarea name="meterial_description" style="width:500px; height:200px; resize: none;">${vo.meterial_description}</textarea></td>
		</tr>
		<tr>
			<td>대표 이미지</td>
			<td colspan=3>
				<img src="http://placehold.it/300x300" id="meterial_image"/>
				<input type="file" name="file" class="admin_text" style="display:none;"/>	
			</td>
		</tr>
	</table>
	<div>
		<button class="btn_admin" style="float:right; margin-bottom:10px;" id="btn_save">저장</button><input type="button" onClick="location.href='/admin/meterial'" class="btn_admin" style="float:right; margin-bottom:10px;" value="목록">
	</div>
</form>
<script>
	$("#meterial_image").on("click",function(){
		$(frm.file).click();
	});
	$("#btn_save").on("click",function(e){
		e.preventDefault();
		var meterial_name=$(frm.meterial_name).val();
		var meterial_price=$(frm.meterial_price).val();
		if(meterial_name=="") {
			alert("상품명을 입력하세요.");
			$(frm.meterial_name).focus();
			return;
		}else if(meterial_price==""){
			alert("단가를 입력하세요.");
			$(frm.meterial_price).focus();
			return;
		}
		if(!confirm("상품을 추가하시겠습니까?")) return;
		frm.action="/meterial/admin_insert";
		frm.method="post"; 
		frm.submit();
		
	});
	$(frm.file).on("change",function(){
		var file=$(frm.file)[0].files[0];
		$("#meterial_image").attr("src",URL.createObjectURL(file));
	})
</script>