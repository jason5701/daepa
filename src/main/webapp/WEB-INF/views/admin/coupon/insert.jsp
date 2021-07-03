<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<style>	
	table td{text-align:left;}
</style>
<h2>쿠폰발행</h2>
<form name="frm" encType="multipart/form-data">
	<table>
		<tr>
			<td>작성자</td>
			<td><input type="text" class="admin_text"  name="coupon_id" value="${coupon_id}" readonly></td>
		</tr>
		<tr>
			<td>발행일</td>
			<td><input type="text" class="admin_text2"  value="<%= sf.format(nowTime)%>" readonly/></td>
			<td>종료일</td>
			<td><input type="text" class="admin_text2"  name="coupon_end" value="<%= sf.format(nowTime)%>"/></td>
		</tr>
		<tr>
			<td>쿠폰명</td>
			<td><input type="text" class="admin_text"  name="coupon_name" placeholder="쿠폰 명을 입력하세요."/></td>
		</tr>
		<tr>
			<td>할인가</td>
			<td><input type="text" class="admin_text"  name="coupon_discount" placeholder="할인가격을 입력하세요."/></td>
		</tr>
		<tr>
			<td>쿠폰이미지</td>
			<td>
				<img src="http://placehold.it/300x300" id="coupon_img" width=300/>
				<input type="file" name="file" style="display:none;"/>
			</td>
		</tr>
	</table>
	<button class="btn_admin" style="float:right; margin-bottom:10px;" id="btn_write">발행</button>
</form>
<script>
	$("#coupon_img").on("click",function(){
		$(frm.file).click();
	});
	$(frm.file).on("change",function(){
		var file=$(frm.file)[0].files[0];
		$("#coupon_img").attr("src",URL.createObjectURL(file));
	});
	$("#btn_write").on("click",function(e){
		e.preventDefault();
		var coupon_name=$(frm.coupon_name).val();
		var coupon_discount=$(frm.coupon_discount).val();

		if(coupon_name=="") {
			alert("쿠폰명을 입력하세요.");
			$(frm.coupon_name).focus();
			return;
		}else if(coupon_discount==""){
			alert("할인가격을 입력하세요.");
			$(frm.coupon_discount).focus();
			return;
		}
		if(!confirm("'"+coupon_name+"'"+" 을 저장하시겠습니까?")) return;
		frm.action="/coupon/admin_insert";
		frm.method="post";
		frm.submit();
	});
</script>