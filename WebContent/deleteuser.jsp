<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="users.UsersDAO"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@page import="java.sql.*"%>
<%
	String userId = request.getParameter("id");
	
	UsersDAO dao = new UsersDAO();
	int result = dao.delUser(userId);
	
	
	if(result == 1){
		response.sendRedirect("userinfo.jsp");
	}else{
    	response.sendRedirect("error.jsp");
    }
%>