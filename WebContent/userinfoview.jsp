<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" />

<link rel="stylesheet" href="./css/info.css" />
</head>
<body>
	<%
		//세션의 userID가 있으면 가져온다. 
	String userID = null; //유저ID가 null이 아니면 가져오기
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<!-- 헤더 시작  -->
	<jsp:include page="header.jsp" />
	<!-- 헤더 종료  -->

	<!-- 메인 시작  -->
	<div class="row main">
		<%@ include file="dbconn.jsp"%>
		<%
			PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM info LEFT JOIN admin ON admin.admin_id = info.admin_id WHERE info_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(request.getParameter("id")));
		rs = pstmt.executeQuery();
		while (rs.next()) {
		%>
		<table class="info_table ">
			<tr>
				<th>제목:</th>
				<td><%=rs.getString("info_title")%></td>
			</tr>
			<tr>
				<th>작성자:</th>
				<td><%=rs.getString("admin_id")%></td>
			</tr>
			<tr>
				<th>작성일:</th>
				<td><%=rs.getString("date").substring(0, 10)%></td>
			</tr>
			<tr>
				<th>공지사항 내용:</th>
				<td><%=rs.getString("info_text")%></td>
			</tr>
			<tr>
				<th>공백</th>
				<td><button class="btn btn-primary" onclick="location.href='main.jsp'">뒤로가기</button></td>
			</tr>
		</table>
		<%
			}
		%>

	</div>

	<!-- 메인 종료 -->
	<!-- 푸터 시작 -->
	<jsp:include page="footer.jsp" />
	<!-- 푸터 종료 -->
</body>
</html>