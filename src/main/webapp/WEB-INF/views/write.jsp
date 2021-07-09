<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--views/include/session_check.jsp -->

  <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
  <c:if test = "${userinfo.user_id == null}" >   // 세션을 체크했을때 null값과 같으면 (로그인을 안했다면)..
      <script>
           alert("로그인 하신 후 이용가능한 페이지 입니다.");    // 다음 메시지를 출력함..
           location.href = "/user/login";          // 로그인 페이지로 이동시켜주는 코드
      </script>
  </c:if>