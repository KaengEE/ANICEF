<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="info.InfoDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="java.sql.*"%>
<%
	String infoIdStr = request.getParameter("info_id");
	int infoId = Integer.parseInt(infoIdStr);
	
	InfoDAO dao = new InfoDAO();
	int result = dao.delInfo(infoId);
	
	
	if(result == 1){
		response.sendRedirect("infomation.jsp");
	}else{
    	response.sendRedirect("error.jsp");
    }
%>