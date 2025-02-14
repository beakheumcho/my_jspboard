<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
<header>
<h3>메인 Main</h3>
<hr>
</header>
<nav>
<!-- "user" 라는 이름의 애트리뷰트 가져오기 -->
<c:if test="${user !=null }">
	<h4><c:out value="${user.name }"/> 님 환영합니다.</h4>
	<p><a href="logout.jsp">로그아웃</a></p>
</c:if>
<c:if test="${user ==null }">
	<p><a href="login.jsp">로그인</a></p>
	<p><a href="member/join.jsp">회원가입</a></p>
</c:if>
	<p><a href="community/list.jsp">커뮤니티</a></p>
</nav>
</body>
</html>