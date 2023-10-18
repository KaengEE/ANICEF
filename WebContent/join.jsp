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
	String userID = null; //유저ID가 null이 아니면 가져오기
	if (session.getAttribute("userID") != null) {
		out.println("<script>");
		out.println("alert('이미 로그인이 되어있습니다.')");
		out.println("location.href = 'main.jsp'");
		out.println("</script>");
	}
	%>

	<!-- 헤더 시작 -->
	<jsp:include page="header.jsp" />
	<!-- 헤더 종료 -->
	<!-- 메인 시작 -->
	<div class="main">
		<form action="joinAction.jsp" method="get" class="login">
			<h2 class="login_title">회원가입</h2>
			<input type="text" name="name" placeholder="이름" required /> <input
				type="date" name="date" required /> <input type="text" name="id"
				placeholder="아이디" required /> <input type="password" name="pw"
				placeholder="비밀번호" required /> <input type="tel" name="ph"
				placeholder="전화번호" required /> <input type="text" name="ad"
				placeholder="주소" required />
			<button type="submit">회원가입</button>
		</form>
	</div>

	<!-- 메인 종료 -->
	<jsp:include page="footer.jsp" />
	<script src="./js/app.js"></script>
</body>
</html>