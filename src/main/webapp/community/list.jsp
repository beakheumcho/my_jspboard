<%@page import="org.iclass.dto.Paging"%>
<%@page import="java.time.LocalDate"%>
<%@page import="org.iclass.dto.Community"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.iclass.dao.CommunityDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int pageNo;
//페이지 번호를 파라미터로 받습니다
	if(request.getParameter("page")==null) pageNo=1;
	else pageNo = Integer.parseInt(request.getParameter("page"));

	CommunityDao dao = CommunityDao.getInstance();
	int pageSize=10;	//한페이지에 몇개의 글개수인가?
//  아래 2줄 명령은 Paging 객체로 대체합니다.
//	int startNo = (pageNo-1)*pageSize + 1;	//pageNo=1,2,3,4,5...
						//startNo=?  1 11 21 31 41
//	int endNo = startNo+(pageSize-1);	//endNo=? 10  20 30 40 50		
	Paging pages = new Paging(pageNo,dao.count(),pageSize);		
	
	
	Map<String,Integer> map = new HashMap<>();
	map.put("start",pages.getStartNo());		//요청된 페이지번호로 글목록 시작번호
	map.put("end",pages.getEndNo());			//					   마지막번호
	
	List<Community> list = dao.pagelist(map);	//sql 실행
	request.setAttribute("list", list);			// 메인글 목록
	request.setAttribute("today", LocalDate.now());		//오늘 날짜
	
	//페이지 번호를 애트리뷰트로 저장
	request.setAttribute("page", pageNo);		// 현재 페이지 번호
	request.setAttribute("paging", pages);		// 현재 페이지 번호에 따라 계산된 페이지 목록
	pageContext.forward("listView.jsp");
%>
<%--
	실행방법 : http://localhost:8082/jspBoard/community/list.jsp
	실행방법 : http://localhost:8082/jspBoard/community/list.jsp?page=2
	실행방법 : http://localhost:8082/jspBoard/community/list.jsp?page=6
  --%>