<%@page import="users.Users"%>
<%@page import="users.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- form으로 부터 전달된 값을 user객체의 프로퍼티(필드변수)에 설정 
	 input 태그의 name과 자바빈의 프로퍼티명과 동일한 것에 대응-->
<%
	request.setCharacterEncoding("UTF-8");
%>
<!--user객체로 수정데이터 받음 -->
<jsp:useBean id="users" class="users.Users" scope="page" />
<jsp:setProperty name="users" property="*" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		out.println("<script>");
		out.println("alert('로그인을 해주세요')");
		out.println("location.href = 'login.jsp'");
		out.println("</script>");
	}

	UsersDAO usersdao = new UsersDAO();
	/* DB에서 게시글을 가져와 현재 로그인 유저와 같은지 비교함 */
	Users user = usersdao.getUser(userID);
	if (!userID.equals(user.getId())) {
		out.println("<script>");
		out.println("alert('권한이 없습니다.')");// 비교 후 다르면 
		out.println("location.href = 'main.jsp'");
		out.println("</script>");
	} else { 
		/* 글쓴 유저가 맞을 경우 업데이트 한다.  */
			int result = usersdao.updateUser(userID,  request.getParameter("name"), request.getParameter("date"),request.getParameter("pw"), request.getParameter("ph"),request.getParameter("ad"));
			if (result == -1) {

		out.println("<script>");
		out.println("alert('수정에 실패했습니다.')");
		out.println("history.back()");
		out.println("</script>");
			} else {

		out.println("<script>");
		out.println("alert('수정에 성공하였습니다.')");
		out.println("location.href = 'main.jsp'");
		out.println("</script>");
			}
		}

	%>
</body>
</html>
