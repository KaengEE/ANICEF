<%@page import="users.Users"%>
<%@page import="users.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANICEF</title>
<link rel="stylesheet" href="./css/join.css" />
<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" />
<body>
	<%
	//세션의 userID가 있으면 가져온다. 
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");

	}
	if (userID == null) {
		out.println("<script>");
		out.println("alert('로그인을 하세요.')");
		out.println("location.href = 'login.jsp'");
		out.println("</script>");
	}
	
	UsersDAO userdao = new UsersDAO();
	Users users = userdao.getUser(userID);
	
	%>
	<!-- 헤더 시작 -->
	<jsp:include page="header.jsp" />
	<!-- 헤더 종료  -->
	<!-- 메인 시작 -->
	<div class="main">
		<form action="updateAction.jsp" method="get" class="login">
			<!--아이디는 수정 불가능-->
			<h2 class="login_title">회원정보 수정</h2>
			<input type="text" name="name" placeholder="이름" value="<%=users.getName()%>" required /> 
			<input type="date" name="date" required value="<%=users.getDate()%>"/> 
			<input type="text" name="id" placeholder="아이디" required readonly value="<%=users.getId()%>"/> 
			<input type="password" name="pw" placeholder="비밀번호" required value="<%=users.getPw()%>"/>
			<input type="tel" name="ph" placeholder="전화번호" required value="<%=users.getPh()%>"/>
			<input type="text" name="ad" placeholder="주소" required value="<%=users.getAd()%>"/>
			<button type="submit">회원정보수정</button>
		</form>
	</div>

	<!-- 메인 종료 -->
	<jsp:include page="footer.jsp" />
	<script src="./js/app.js"></script>
</body>
</html>