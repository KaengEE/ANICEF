<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="users.UsersDAO"%>
<!-- form으로 부터 전달된 값을 User객체의 프로퍼티(필드변수)에 설정 
	 input 태그의 name과 자바빈의 프로퍼티명과 동일한 것에 대응-->
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="users.Users" scope="page" />
<jsp:setProperty name="user" property="*" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		if (user.getId() == null || user.getPw() == null || user.getName() == null
		|| user.getPh() == null || user.getAd() == null) {
			out.println("<script>");
			out.println("alert('입력이 안 된 사항이 있습니다.')");
			out.println("history.back()"); //돌아가기 
			out.println("</script>");
		} else {
			UsersDAO usersDAO = new UsersDAO();
			int result = usersDAO.join(user);
			if (result == -1) {
		out.println("<script>");
		out.println("alert('이미 존재하는 아이디입니다..')");
		out.println("history.back()");
		out.println("</script>");
			} else {
		out.println("<script>");
		out.println("location.href = 'login.jsp'");
		out.println("</script>");
			}
		}
	%>
</body>
</html>

