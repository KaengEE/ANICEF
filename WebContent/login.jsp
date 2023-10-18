<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANICEF</title>
<link rel="stylesheet" href="./css/login.css" />
<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" />
<body>

	<jsp:include page="header.jsp" />

	<!-- 메인 시작 -->
	<div class="main">
		<div class="main_content">
			<form action="loginAction.jsp" method="get" class="login">
				<div class="dflex">
					<div class="radio_login">
						<input onclick="user_login()" type="radio" name="loginType"
							value="user" checked /> <label
							onclick="user_login()">로그인</label>
					</div>
					<div class="radio_login">
						<input onclick="admin_login()" type="radio" name="loginType"
							value="admin" /> <label onclick="admin_login()">관리자로그인</label>
					</div>
				</div>
				<h2 class="login_title">로그인</h2>
				<input type="text" name="id" placeholder="ID" required /> <input
					type="password" name="pw" placeholder="PASSWORD" required /><br />

				<button type="submit">로그인</button>
			</form>
			<form action="join.jsp" method="post" class="join">
				<a href="join.jsp"><button type="button">회원가입</button></a>
			</form>
		</div>
	</div>
	<!-- 메인 종료 -->
	<jsp:include page="footer.jsp" />
	<script src="./js/app.js"></script>
</body>
</html>