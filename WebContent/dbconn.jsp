<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;
	try{
		String url = "jdbc:mysql://localhost:3306/anicef?useSSL=false&allowPublicKeyRetrieval=true"; //데이터베이스 주소
		String user = "root";
		String password = "1234";
		
        //Class.forName("com.mysql.cj.jdbc.Driver"); 드라이버
		conn = DriverManager.getConnection(url, user, password);
		//out.println("데이터베이스 연결 성공!<br>");
		
	}catch(SQLException ex){
		out.println("데이터베이스 연결이 실패했습니다.<br>");
		out.println("SQLException: "+ ex.getMessage());
	}
%>