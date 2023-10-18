<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
<%@ include file="../common/adminheader.jspf"%>
<%@ include file="../common/adminnavigation.jspf"%>
	<div class="title"><h3>회원정보</h3></div>
	<hr>
		<div class="table">
			<table class="table table-hover">
	        <tr>
	            <th>no</th>
	            <th>id</th>
	            <th>이름</th>
	            <th>전화번호</th>
	            <th>주소</th>
	            <th>생년월일</th>
	            <th>삭제</th>
	        </tr>
	    <!-- 반복문 -->
	    <%@ include file="dbconn.jsp"%>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM users";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		    int index = 1; // 인덱스
			while (rs.next()) {
		%>
	        <tr>
	        	<td><%=index %></td>
	        	<td><%=rs.getString("id") %></td>
	        	<td><%=rs.getString("name") %></td>
	        	<td><%=rs.getString("ph") %></td>
	        	<td><%=rs.getString("ad") %></td>
	        	<td><%=rs.getString("date").substring(0,10) %></td>
	        	<td>
					<a id="del" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?')" href="deleteuser.jsp?id=<%=rs.getString("id")%>">삭제</a>
		        </td>
	        </tr>
	  		 <% 
	  			 index++;
			} %>
	    	</table>
		</div>

<%@ include file="./common/adminfooter.jspf"%>