<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
<%@ include file="../common/adminheader.jspf"%>
<%@ include file="../common/adminnavigation.jspf"%>
	<div class="title"><h3>문의답변</h3></div>
	<hr>
		<div class="table">
			<table class="table table-hover">
	        <tr>
	            <th>no</th>
	            <th>제목</th>
	            <th>작성자</th>
	            <th>작성일</th>
	            <th>답변현황</th>
	            <th>답변</th>
	        </tr>
	    <!-- 반복문 -->
	    <%@ include file="dbconn.jsp"%>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			//qna과 answer테이블 join
			String sql = 
			"SELECT * FROM question LEFT JOIN answer ON question.id = answer.qna_id LEFT JOIN users ON question.name = users.name;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		    int index = 1; // 인덱스
			while (rs.next()) {
		%>
	        <tr>
	        	<td><%=index %></td>
	        	<td><%=rs.getString("title") %></td>
	        	<td><%=rs.getString("name") %></td>
	        	<td><%=rs.getString("date").substring(0,10) %></td>
	        	
	        	<%if(rs.getString("state") != null) {%>
	        		<td><%= rs.getString("state") %></td>
	        	<%} else {%>
	        		<td>대기중</td>
	        	<%} %>
	        	
	        	<td>
					<a id="del" class="btn btn-info"  href="answer.jsp?id=<%=rs.getString("id")%>">답변하기</a>
		        </td>
	        </tr>
	  		 <% 
	  			 index++;
			} %>
	    	</table>
		</div>

<%@ include file="./common/adminfooter.jspf"%>