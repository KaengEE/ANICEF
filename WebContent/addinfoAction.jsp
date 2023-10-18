<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="info.InfoDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>


<%

    // 폼에서 전달된 데이터 가져오기
    String info_title = request.getParameter("title");
    String info_text = request.getParameter("text");
    //String admin_id = "admin1"; //임시
    //세션에 저장된 아이디 가져오기
    HttpSession session1 = request.getSession();
    String admin_id = (String) session1.getAttribute("adminID");
    
    
    InfoDAO dao = new InfoDAO();
    int result = dao.addInfo(info_title, info_text, admin_id);

    if (result == 1) {
    	response.sendRedirect("infomation.jsp"); //성공시 페이지 지동
    } else {
    	response.sendRedirect("error.jsp");
    }
%>