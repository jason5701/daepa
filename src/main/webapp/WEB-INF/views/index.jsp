<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>λνπ₯¬</title>
   <link rel="stylesheet" href="/resources/css/index.css" />
   <link rel="preconnect" href="https://fonts.gstatic.com">
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <!-- -κ΅¬κΈ μ°¨νΈ λΌμ΄λΈλ¬λ¦¬ -->
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
   <div id="container">
      <div id="header">
         <c:if test="${user_info.user_id==null}">
         <div id="userMenu">
         	<div class="menuItem">
            	<c:if test="${user_info.user_id==null}">
			    	 <a href="/admin/login">κ΄λ¦¬μ</a>    
			    </c:if>			  
			</div>
			<div class="menuItem">
			   <a href="/cs/notice">κ³ κ°μΌν°</a>
			</div>
			<div class="menuItem">   
			     <c:if test="${user_info.user_id!=null}">
                    <a href="/mypage/all">λ§μ΄νμ΄μ§</a>
                 </c:if>
			</div>   
			<div class="menuItem">
				<c:if test="${user_info.user_id==null}">
			    	<a href="/user/login">λ‘κ·ΈμΈ</a>
			    </c:if>
			    <c:if test="${user_info.user_id!=null}">
			        <span id="user_name">πββοΈ ${user_info.user_name}λ ,
			        μλνμΈμ!</span>			    
			    	<a href="/user/logout">λ‘κ·Έμμ</a>
			    </c:if>
			</div>
			<div class="menuItem">    
				<c:if test="${user_info.user_id==null}">
			    	<a href="/user/register">νμκ°μ</a>    
			    </c:if>  			              
			</div>
         </div>
         </c:if>
         <c:if test="${user_info.user_id!=null}">
         <div id="userMenu">
         	<div class="menuItem">
            	<c:if test="${user_info.user_id==null}">
			    	 <a href="/admin/login">κ΄λ¦¬μ</a>    
			    </c:if>			  
			</div>
			<div class="menuItem">
			   <a href="/cs/notice">κ³ κ°μΌν°</a>
			</div>
			<div class="menuItem">   
			     <c:if test="${user_info.user_id!=null}">
                    <a href="/mypage/all">λ§μ΄νμ΄μ§</a>
                 </c:if>
			</div>   
			<div class="menuItem">
				<c:if test="${user_info.user_id==null}">
			    	<a href="/user/login">λ‘κ·ΈμΈ</a>
			    </c:if>
			    <c:if test="${user_info.user_id!=null}">
			        <span id="user_name">πββοΈ ${user_info.user_name}λ ,
			        μλνμΈμ!</span>			    
			    	<a href="/user/logout">λ‘κ·Έμμ</a>
			    </c:if>
			</div>
			<div class="menuItem">    
				<c:if test="${user_info.user_id==null}">
			    	<a href="/user/register">νμκ°μ</a>    
			    </c:if>  			              
			</div>
         </div>
         </c:if>
         
         <a href="/index"><img src="/resources/image/index/Dlogo.jpg" /></a>
         <div id="category">
            <div id="allCategory">
               <ul class="all">
                  <li>
                     <div style="overflow:hidden; padding-left:15px; width:140px;  margin-left:10px; ">
                        <img src="/resources/image/index/menu.png" style="margin-top:13px; float:left; "/>
                        <span style="float:left; margin-left:10px; font-weight:bold; ">μ μ²΄ μΉ΄νκ³ λ¦¬</span>
                     </div>
                        <ul class="all_sub">
                            <li><a href="/meals">1μΈλ°ν€νΈ/μμ ν</a>
                                <ul class="sub">
                                    <li><a href="/meals?searchType=μ‘λ₯">μ‘λ₯</a></li>
                                    <li><a href="/meals?searchType=ν΄μ°λ¬Ό">ν΄μ°λ¬Ό</a></li>
                                    <li><a href="/meals?searchType=λ©΄/λ°κ°λ£¨">λ©΄/λ°κ°λ£¨</a></li>
                                </ul>
                            </li>
                            <li><a href="/veges">μ±μ</a>
                                <ul class="sub">
                                    <li><a href="/veges?searchType=μ΄λ‘">λΉμμ±μ</a></li>
                                    <li><a href="/veges?searchType=λ³΄λΌ">λ³΄λΌμμ±μ</a></li>
                                    <li><a href="/veges?searchType=λΉ¨κ°">λΉ¨κ°μ±μ</a></li>
                                    <li><a href="/veges?searchType=νμ">ν°μ±μ</a></li>
                                </ul>
                            </li>
                            <li><a href="/group_product">λλκ΅¬λ§€</a>
                                <ul class="sub">
                                    <li><a href="#">μ μ²΄</a></li>
                                    <li><a href="#">μμΈ</a></li>
                                    <li><a href="#">μΈμ²</a></li>
                                    <li><a href="#">κ²½κΈ°</a></li>
                                    <li><a href="#">λΆμ°</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                 </ul>
            </div>
            <div id="menu">
               <span class="menuCart" onClick="location.href='/cart/list'"></span>
               <span class="menuFavo" onClick="location.href='/favorite/list'"></span>
            </div>
            <div id="searchBox">
               <input type="text" size=20 placeholder="κ²μ" id="keyword" style="font-weight:bold;"/>
               <span class="searchIcon" ></span>
            </div>
         </div>
      </div><hr>
      
      <div id="main">   
         <jsp:include page="${pageName}" />
      </div><hr>
      
      <div id="footer">
         <div id="info">
            <div id="cs">
               <img src="/resources/image/index/cs.png" width=23px/>
               <span class="cstxt">λνκ³ κ°μΌν°</span>
               <h1>1588-5588</h1>
               <p>μ΄μμκ° : μ€μ  9μ - μ€ν 6μ</p>
               <p>λνμ κ³ κ°μΌν°λ 365μΌ μ΄μλ©λλ€π</p><br/>
               <a href="mailto:help@daepa.com"><button>1:1 λ¬ΈμνκΈ°</button></a>
               <p>π§ 24μκ° μ μκ° κ°λ₯ν©λλ€.</p>
               <p>μ΄μμκ° λ΄ μμ°¨μ μΌλ‘ λ΅λ³λλ¦¬κ² μ΅λλ€.</p>
            </div>
            <div id="company">
               <b>λ²μΈλͺ(μνΈ)</b> : μ£Όμνμ¬ λν <span class="bar"> I </span> <b>μ¬μμλ±λ‘λ²νΈ</b> : 123-12-12345
               <br>
               <b>ν΅μ νλ§€μ</b> : μ  2021-μΈμ²νμ΅-01234 νΈ <span class="bar"> I </span> <b>λνμ±μμ</b> : κΉμ ν
               <br>
               <b>μ£Όμ</b> : μΈμ²κ΄μ­μ λ―ΈμΆνκ΅¬ λ§€μνλ‘488λ²κΈΈ 6-32, 5μΈ΅(νμ΅λ)
               <br>
               <b>μ ν΄λ¬Έμ</b> : <a href="#" class="link">business@daepa.com</a><span class="bar"> I </span> <b>μ±μ©λ¬Έμ</b> : <a href="#" class="link">recruit@daepa.com</a>
               <br>
               <b>ν©μ€</b> : 123 - 4567 - 8910 <span class="bar">I</span> <b>μ΄λ©μΌ</b> : <a href="" class="link">help@daepa.com</a>
               <br>
               <ul class="list_sns">
                  <li>
                     <a href="#" class="link_sns" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_instagram.png" alt="λν μΈμ€νκ·Έλ¨ λ°λ‘κ°κΈ°"></a>
                  </li>
                  <li>
                     <a href="#" class="link_sns" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_fb.png" alt="λν νμ΄μ€λΆ λ°λ‘κ°κΈ°"></a>
                  </li>
                  <li>
                     <a href="#" class="link_sns lst" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_youtube.png" alt="λν μ νλΈ λ°λ‘κ°κΈ°"></a>
                  </li>
               </ul>
            </div>
         </div>
      </div>
   </div>
   <a href="#" class="scrollToTop"><img src="/resources/image/index/up.png" width=40 /></a>
</body>
<script>

$("#keyword").on("keydown",function(e){
	if(e.keyCode==13) {
		$(".searchIcon").click();
	}
});

$(".searchIcon").on("click", function(){
	var keyword=$("#keyword").val();
	if(keyword == ""){
		alert("κ²μμ΄λ₯Ό μλ ₯ν΄μ£ΌμΈμ.");
	}else{
		location.href="/search/list?keyword="+keyword;
	}
	$("#keyword").val("");
});

//μ€ν¬λ‘€ μλ€μ΄ λ²νΌ μ€ν¬λ¦½νΈ
$(document).ready(function(){

    //Check to see if the window is top if not then display button
    $(window).scroll(function(){
        if ($(this).scrollTop() > 300) {
            $('.scrollToTop').fadeIn();
        } else {
            $('.scrollToTop').fadeOut();
        }
    });

    //Click event to scroll to top
    $('.scrollToTop').click(function(){
        $('html, body').animate({scrollTop : 0},800);
        return false;
    });
});
</script>
</html>