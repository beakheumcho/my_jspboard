<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- request.getRequestURL() : 실행후 브라우저의 URL 주소 
     request.getRequestURI() : 위의 URL 중에서 경로이후의 값
     request.getContextPath() : jspBoard (첫번째 path이고 프로젝트 이름)
     request.getRemoteAddr() : 클라이언트의 ip 주소.
                    ㄴ ipv6 : 0:0:0:0:0:0:0:1 (ipv4 127.0.0.1) localhost 주소
     request.getRemoteHost() : 클라이언트 컴퓨터 이름 따로 설정하지 않으면 ip 주소
-->
	<h2>JSP 내장 객체 request 의 메소드들</h2>
	<ul>
		<li><%= request.getRequestURL() %></li>
		<li><%= request.getRequestURI() %></li>
		<li><%= request.getContextPath() %></li>
		<!-- 서버 코드이므로 Remote 는 클라이언트 -->
		<li><%= request.getRemoteAddr() %></li>
		<li><%= request.getRemoteHost() %></li>
		<!-- 서버 코드이므로 Local 은 서버 -->
		<li><%= request.getLocalAddr() %></li>
		<li><%= request.getLocalName() %></li>
		<li><%= request.getLocalPort() %></li>
		<li><%= request.getLocale() %></li>
	</ul>
</body>
</html>