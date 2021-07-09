<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	  #favorite{width:1000px; margin:0 auto; margin-bottom:70px;}
	  table{width: 100%;border-collapse: collapse;border-bottom:solid 1px;}
      tr,td{border-bottom:1px #ccc solid;padding: 10px;text-align: center;}
      .title{background: #FAFAFA; border-top:2px solid;text-align: center; font-size:15px;}
</style>
<div id="favorite">
<br/><h2>찜목록</h2><br/>
   <c:if test="${productflist.size() == 0 && meterialflist.size() == 0}">
      <br/><h3>찜목록에 담긴 상품이 없어요 😥</h3><br/>
   </c:if>
   
   <c:if test="${productflist.size() > 0}">
   <div id="favorite">
      <div class="chkBox">         
         <button type="button" class="selectDelete_btn">선 택 삭 제</button> 
      </div><br/>
      <table id="productftbl">
       	<tr class="title">
       		<td><input type="checkbox" name="chkAll" id="chkAll" style="margin-right:5px;" /><label for="chkAll"></label></td>
       		<td>상품이미지</td>
       		<td>상품이름</td>
       		<td>단가</td>
       		<td>삭제</td>       		
       	</tr>
         <c:forEach items="${productflist}" var="productflist">
         <tr class="row">
            <td class="product_id" style="display:none;">${productflist.product_id}</td>
            <td width=50><input type="checkbox" name="chk" class="chk" data-favoriteNum="${productflist.favorite_number}" /></td>
            <td width=100 onClick="location.href='../meal_detail?product_id=${productflist.product_id}'"><img src="/displayFile?fullName=${productflist.product_image}" width=100/></td>
            <td width=340>${productflist.product_name}</td>
            <td width=100><fmt:formatNumber pattern="#,###" value="${productflist.product_price}" />원</td>
            <td width=100>
               <input type="button" class="delete_btn" data-favoriteNum="${productflist.favorite_number}" value="삭제">
            </td>
         </tr>
         </c:forEach>
      </table>
   </div>   
   </c:if>
   
   <c:if test="${meterialflist.size() > 0}">
   <div id="favorite">
      <table id="meterialftbl">
         <c:forEach items="${meterialflist}" var="meterialflist">
         <tr class="row">
            <td class="meterial_id" style="display:none;">${meterialflist.meterial_id}</td>
            <td width=50><input type="checkbox" name="chk" class="chk" data-favoriteNum="${meterialflist.favorite_number}" /></td>
            <td width=100 onClick="location.href='../meal_detail?meterial_id=${meterialflist.meterial_id}'"><img src="/displayFile?fullName=${meterialflist.meterial_image}" width=100/></td>
            <td width=340>${meterialflist.meterial_name}</td>
            <td width=100><fmt:formatNumber pattern="#,###" value="${meterialflist.meterial_price}" />원</td>
            <td width=100>
               <input type="button" class="delete_btn" data-favoriteNum="${meterialflist.favorite_number}" value="삭제">
            </td>
         </tr>
         </c:forEach>
      </table>
   </div>
   </c:if>
</div>

<script>
//product 목록에서 각 삭제버튼 클릭 시
$("#productftbl").on("click", ".delete_btn", function(){
   var favorite_number=$(this).attr("data-favoriteNum");
   if(!confirm("해당 상품을 찜목록에서 삭제할까요?")) return;
   $.ajax({
      type:"post",
      url:"/favorite/delete",
      data:{"favorite_number":favorite_number},
      success:function(){
         alert("상품 삭제가 완료되었습니다.");
         location.href="/favorite/list";
      }
   });
});
//meterial 목록에서 각 삭제버튼 클릭 시
$("#meterialftbl").on("click", ".delete_btn", function(){
   var favorite_number=$(this).attr("data-favoriteNum");
   if(!confirm("해당 상품을 찜목록에서 삭제할까요?")) return;
   $.ajax({
      type:"post",
      url:"/favorite/delete",
      data:{"favorite_number":favorite_number},
      success:function(){
         alert("상품 삭제가 완료되었습니다.");
         location.href="/favorite/list";
      }
   });
});


//선택삭제버튼 클릭 시
$(".chkBox").on("click", ".selectDelete_btn", function(){
   if($("#productftbl .row .chk:checked").length==0 && $("#meterialftbl .row .chk:checked").length==0){
      alert("선택한 상품이 없습니다.");
   }else if($("#productftbl .row .chk:checked").length!=0 || $("#meterialftbl .row .chk:checked").length!=0){
      if(!confirm("선택한 상품을 삭제할까요?")) return;
         
         $("#productftbl .row .chk:checked").each(function(){
         var array=[];
         favorite_number=$(this).attr("data-favoriteNum");
         var data={"favorite_number":favorite_number};
         array.push(data);
         
         $.ajax({
             type:"post",
             url:"/favorite/delete",
             data:{"favorite_number":favorite_number},
             success:function(){
             }
          });
         
         $("#meterialftbl .row .chk:checked").each(function(){
         var array=[];
         favorite_number=$(this).attr("data-favoriteNum");
         var data={"favorite_number":favorite_number};
         array.push(data);         
         
         $.ajax({
            type:"post",
            url:"/favorite/delete",
            data:{"favorite_number":favorite_number},
            success:function(){
            }
         });
      });
      });
      alert("선택한 상품의 삭제가 완료되었습니다.");
      location.href="/favorite/list";
   }
});
         

//전체체크박스 클릭 시
$("#chkAll").on("click", function(){
   if($(this).is(":checked")){
      $("#productftbl .row .chk").each(function(){
         $(this).prop("checked", true);
      });
      $("#meterialftbl .row .chk").each(function(){
          $(this).prop("checked", true);
       });
      
   }else{
      $("#productftbl .row .chk").each(function(){
         $(this).prop("checked", false);
      });
      $("#meterialftbl .row .chk").each(function(){
          $(this).prop("checked", false);
       });
   }
});


//모든 체크박스 클릭 시 전체선택
$("#productftbl").on("click", ".row .chk", function(){
   var num1=$("#productftbl .row .chk").length;
   var num2=$("#productftbl .row .chk:checked").length;
   var num3=$("#meterialftbl .row .chk").length;
   var num4=$("#meterialftbl .row .chk:checked").length;
   if(num1==num2 && num3==num4){
      $("#chkAll").prop("checked", true);
   }else{
      $("#chkAll").prop("checked", false);
   }
});

$("#meterialftbl").on("click", ".row .chk", function(){
	   var num1=$("#productftbl .row .chk").length;
	   var num2=$("#productftbl .row .chk:checked").length;
	   var num3=$("#meterialftbl .row .chk").length;
	   var num4=$("#meterialftbl .row .chk:checked").length;
	   if(num1==num2 && num3==num4){
	      $("#chkAll").prop("checked", true);
	   }else{
	      $("#chkAll").prop("checked", false);
	   }
	});
</script>

