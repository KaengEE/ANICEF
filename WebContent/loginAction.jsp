<%@page import="admin.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="users.UsersDAO"%>
<!-- form으로 부터 전달된 값을 User객체의 프로퍼티(필드변수)에 설정 
	 input 태그의 name과 자바빈의 프로퍼티명과 동일한 것에 대응-->
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="users.Users" scope="page" />
<jsp:setProperty name="user" property="id" />
<jsp:setProperty name="user" property="pw" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String loginType = request.getParameter("loginType");

 	if (loginType.equals("user")) {
		UsersDAO usersDAO = new UsersDAO();
		int result = usersDAO.login(user.getId(), user.getPw());
		if (result == 1) {
			session.setAttribute("userID", user.getId());//세션에 추가
			out.println("<script>");
			out.println("location.href = 'main.jsp'");
			out.println("</script>");

		} else if (result == 0) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.')");
			out.println("history.back()");
			out.println("</script>");
		} else if (result == -1) {
			out.println("<script>");
			out.println("alert('존재하지 않는 아이디입니다.')");
			out.println("history.back()");
			out.println("</script>");
		} else if (result == -2) {
			out.println("<script>");
			out.println("alert('데이터베이스 오류가 발생했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}

	} else if (loginType.equals("admin")) {
		AdminDAO adminDAO = new AdminDAO();
		int result = adminDAO.login(user.getId(), user.getPw());
		if (result == 1) {
			session.setAttribute("adminID", user.getId());//세션에 추가
			out.println("<script>");
			out.println("location.href = 'adminindex.jsp'");
			out.println("</script>");

		} else if (result == 0) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.')");
			out.println("history.back()");
			out.println("</script>");
		} else if (result == -1) {
			out.println("<script>");
			out.println("alert('존재하지 않는 아이디입니다.')");
			out.println("history.back()");
			out.println("</script>");
		} else if (result == -2) {
			out.println("<script>");
			out.println("alert('데이터베이스 오류가 발생했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		} 

	}
	%>
</body>
</html>
