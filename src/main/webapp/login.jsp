<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>우리 북카페</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <style type="text/css">
  	.width30{
  		width:30%;
  	}
  	h2{
  		margin: 5rem 0;
  	}
  	#incorrect {
  		display: none;
  		color: red;
  		font-weight: 1.2rem;
  	}
  </style>
</head>
<body>
<%
String temp=request.getParameter("back");
if(temp!=null && temp.equals("w")) 
	session .setAttribute("back","community/write.jsp");
%>
<div class="container mt-3 width30">
  <h2>회원 로그인</h2>
  <label id="incorrect">계정 정보가 일치하지 않습니다.</label>
  <form action="loginAction.jsp" method="post">
    <div class="mb-3 mt-3">
      <label for="userid">아이디:</label>
      <input class="form-control" id="userid" placeholder="Enter id" 
      		name="id" required>
    </div>
    <div class="mb-3">
      <label for="pwd">패스워드:</label>
      <input type="password" class="form-control" id="password" placeholder="Enter password" 
      		name="password" required>
    </div>
    <div class="form-check mb-3">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember"> Remember me
      </label>
    </div>
    <button type="submit" class="btn btn-primary">로그인</button>
    <button type="button" class="btn btn-primary" 
    		onclick="location.href='${pageContext.request.contextPath}'">HOME</button>
  </form>
</div>
  <script type="text/javascript">
  	console.log('${param.incorrect}')
  	if('${param.incorrect}'==='y')
  		document.getElementById('incorrect').style.display='inline-block'
  </script>
</body>
</html>
    