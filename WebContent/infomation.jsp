<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="./common/adminheader.jspf"%>
<%@ include file="./common/adminnavigation.jspf"%>
	<div class="title"><h3>공지사항</h3></div>
	<hr>
		<div class="table">
			<table class="table table-hover">
	        <tr>
	            <th>no</th>
	            <th>제목</th>
	            <th>작성일</th>
	            <th>편집</th>
	        </tr>
	    <%@ include file="dbconn.jsp"%>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM info";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		    int index = 1; // 인덱스
			while (rs.next()) {
		%>
	    <!-- 반복문 -->
	        <tr>
	        	<td><%=index %></td>
	        	<td><a href="viewinfo.jsp?info_id=<%=rs.getInt("info_id")%>"><%=rs.getString("info_title") %></a></td>
	        	<td><%=rs.getString("date").substring(0,10) %></td>
	        	<td>
	        	<!-- 수정삭제버튼 -->
					<div>
						<a id="edit" class="btn btn-info" href="editinfo.jsp?info_id=<%=rs.getInt("info_id")%>">수정</a>
						<a id="del" class="btn btn-danger" onclick="confirmDelete(<%=rs.getInt("info_id")%>)">삭제</a>
		        	</div>
		        </td>
	        </tr>
	  		 <% index++; 
	  		 } 
	  		 %>
	    	</table>
		</div>

		<!-- 글쓰기버튼 -->
		<div>
			<button type="button" class="btn btn-primary" onclick="location.href='addinfo.jsp'">글쓰기</button>
		</div>

<script>
function confirmDelete(infoid){
    const check = confirm("정말 삭제하시겠습니까?");
    if (check) {
        window.location.href = "deleteinfo.jsp?info_id=" + infoid;

    } else{
    	alert("삭제를 취소하였습니다.");
    }
}

</script>

<%@ include file="./common/adminfooter.jspf"%>