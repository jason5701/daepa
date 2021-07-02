<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<h2>${vo.product_name}</h2>
<form name="frm" encType="multipart/form-data">
	<table  class="tbl_read">
		<tr>
			<td>품번</td>
			<td><input type="text"  class="admin_text2" name="meterial_id" value="${vo.meterial_id}" readonly/></td>
			<td>품명</td>
			<td><input type="text" class="admin_text" value="${vo.meterial_name}" readonly/></td>
		</tr>
		<tr>
			<td>단가</td>
			<td colspan=3><input type="text" class="admin_text2" name="meterial_price" value="${vo.meterial_price}"/></td>

		</tr>
		<tr>
			<td>배송정보</td>
			<td>
				<select name="meterial_delivery">
					<option value="0" <c:out value="${vo.meterial_delivery=='0'?'selected':''}"/>>무료배송</option>
					<option value="1" <c:out value="${vo.meterial_delivery=='1'?'selected':''}"/>>일반배송</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${vo.meterial_click}</td>
			<td>판매량</td>
			<td>${vo.meterial_selling}</td>
		</tr>
		<tr>
			<td>상태</td>
			<td colspan=3>
				<select name="meterial_drop">
						<option value="0" <c:out value="${vo.meterial_drop=='0'?'selected':''}"/>>판매중</option>
						<option value="1" <c:out value="${vo.meterial_drop=='1'?'selected':''}"/>>판매중지</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>상품 설명</td>
			<td colspan=3><textarea name="meterial_description" class="admin_text" style="width:500px; height:200px; resize: none;">${vo.meterial_description}</textarea></td>
		</tr>
		<tr>
			<td>대표 이미지</td>
			<td colspan=3>
				<c:if test="${vo.meterial_image==null}">
					<img src="http://placehold.it/300x300" id="product_image"/>
				</c:if>
				<c:if test="${vo.meterial_image!=null}">
					<img src="/displayFile?fullName=${vo.meterial_image}" width=300 id="product_image"/>
				</c:if>
				<input type="file" name="file" style="display:none;"/>	
			</td>
		</tr>
	</table>
	
	<h2>상세설명이미지</h2>
	<div id="upload">
		<input type="file" name="files" accept="image/*" multiple/>
	</div>
	<div id="uploaded">
		<ul id="uploadFiles"></ul>
		<script id="tempFiles" type="text/x-handlebars-template">
			<li>
				<img src="/displayFile?fullName=detail/{{fullName}}" width=100/>
				<input type="text" name="detail_images" style="display:none;" value="{{fullName}}"/>
				<input type="button"  value="삭제" class="btnDelete" fullName={{fullName}}/>
			</li>
		</script>
	</div>
	<div>
		<button  class="btn_admin" style="float:right; margin-bottom:10px;" id="btn_modify">수정</button><input type="button"  class="btn_admin" style="float:right; margin-bottom:10px;"  id="btn_list" value="목록">
	</div>
</form>
<script>
	var meterial_id="${vo.meterial_id}";
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
		frm.action="/meterial/update";
		frm.method="post";
		frm.submit();
	});
	$("#btn_list").on("click",function(e){
		e.preventDefault();
		location.href="/admin/meterial";
	});
	//상세이미지 저장
	$(frm.files).on("change", function(){
	    var files=$(frm.files)[0].files;
	    $.each(files, function(index, file){
	       uploadFile(file);
	    });
    });
	function uploadFile(file){
	    if(file == null) return;
		var formData = new FormData();
		formData.append("file", file);
		formData.append("add_path", "detail");
		
		$.ajax({
			type:"post", 
			url:"/uploadFile",
			processData:false, 
			contentType:false,
			data:formData, 
			success:function(data){
				var temp=Handlebars.compile($("#tempFiles").html());
				var tempData={"fullName":data};
				$("#uploadFiles").append(temp(tempData));
			}
		});
	}
	//상세이미지 삭제(내부폴더에서도 삭제)
	$("#uploadFiles").on("click","li .btnDelete",function(){
		var li=$(this).parent();
		var fullName=$(this).attr("fullName");
		if(!confirm("파일을 삭제하시겠습니까?")) return;
		$.ajax({
			type:"get",
			url:"/deleteFile",
			data:{"fullName":"/detail/"+fullName},
			success:function(){
				alert("삭제완료.");
				li.remove();
			}
		});
	});
	
	//상세이미지 리스트
	getAttach();
	function getAttach(){
		$.ajax({
			type:"post",
			url:"/meterial/getAttach",
			data:{"meterial_id":meterial_id},
			success:function(data){
				var temp=Handlebars.compile($("#tempFiles").html());
				$(data).each(function(){
					var tempData={"fullName":this};
					$("#uploadFiles").append(temp(tempData));
				});
			}
		});
	}
</script>