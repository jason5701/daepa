<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>나눠사자</h2>
<form name="frm">
	<input type="hidden" name="user_id" value="${vo.user_id}"/>
	<table>
		<tr>
			<td>나눔구매채소</td>
			<td>
				<input type="text" placeholder="클릭 " id="meterial_name"/>
				<input type="hidden" name="meterial_id"/>
			</td>
		</tr>
		<tr>
			<td>나눔판매이름</td>
			<td>
				<input type="text" name="sales_name"/>
			</td>
			<td>최대구매수량</td>
			<td>
				<select name="sales_whole_qtt">
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>나눔코멘트</td>
			<td>
				<input type="text" name="sales_contents"/>	
			</td>
			<td>구매최소인원</td>
			<td>
				<select name="sales_people">
					<option value="3">2</option>
					<option value="3">3</option>	
					<option value="4">4</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>나눔마감일</td>
			<td>
				<input type="text" name="sales_end" placeholder="yyyy-mm-dd"/>	
			</td>
		</tr>
	</table>
</form>

<script>
	$("#meterial_name").on("click",function(){
		
	});
</script>