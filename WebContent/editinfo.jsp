<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../common/adminheader.jspf"%>
<%@ include file="../common/adminnavigation.jspf"%>


	<div class="title"><h3>공지사항 수정</h3></div>
	<hr>
	<div class="row">
		<div class="col-9 mx-auto">
			<div "bg-light p-5 mt-5">
				<form action="editinfoAction.jsp" method="post">
				
					<%@ include file="dbconn.jsp"%>
					<%
	                  int info_id = Integer.parseInt(request.getParameter("info_id"));
	                  String sql = "SELECT * FROM info WHERE info_id = ?";
	                  PreparedStatement pstmt = conn.prepareStatement(sql);
	                  pstmt.setInt(1, info_id);
	                  ResultSet rs = pstmt.executeQuery();
	                  if (rs.next()) {
					%>
				
					<div>
					제목: <input type="text" name="title" cols="100" value="<%=rs.getString("info_title") %>"/>
					</div>
					<div>
					내용:</br> 
					<textarea rows="10" name="text" cols="100"><%=rs.getString("info_text") %></textarea>
					</div>
					<%
					} 
					%>
					<!-- 취소/작성완료-->
					<div>
						<!-- info_id 보내기 -->
						<input type="hidden" name="info_id" value="<%=rs.getInt("info_id")%>"/>
						<input type="button" onclick="location.href='infomation.jsp'" class="btn btn-danger" value="취소"/>
						<input type="submit" class="btn btn-primary" value="작성완료"/>					
					</div>
				</form>
				
			</div>
		</div>
	</div>

<%@ include file="./common/adminfooter.jspf"%>