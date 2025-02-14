<%@page import="org.iclass.dto.BookUser"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.iclass.dao.BookUserDao"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
		String password = request.getParameter("password");
		//할일 : dao 로 id,password 확인하는 메소드 실행
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("password", password);
		BookUserDao dao = new BookUserDao();
		BookUser vo = dao.login(map);
		
		String url = request.getContextPath();  // jspboard (index.jsp)
		
		// 글쓰기에서 로그인이 필요하면 login.jsp 이동
		// loginAction.jsp 에서 로그인이 완료된 후 다시 글쓰기 페이지로 가기위해
		// 저장한 애트리뷰트 이름이 back 입니다.
		String back = (String) session.getAttribute("back");
		if (vo != null) {
			//로그인 성공
			session.setAttribute("user", vo); //핵심.
			if (back != null) {
				url = back;
				session.removeAttribute("back"); //back 이름의 애트리뷰트 삭제
			}
		} else { //로그인 실패
	url = "login.jsp?incorrect=y";
		}
		
		response.sendRedirect(url);
%>