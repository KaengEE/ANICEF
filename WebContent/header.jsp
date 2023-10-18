<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/header.css" />
</head>
<body>
	<!-- 네브바 시작 -->
	<nav class="navbar">
		<!-- 로고 -->
		<div class="navbar_logo">
			<i class="fa-duotone fa-cat"></i> <a href="main.jsp">ANICEF</a>
		</div>
		<!-- 네브바 메뉴 -->
		<ul class="navbar_menu">
			<li><a href="dogList.jsp">강아지</a></li>
			<li><a href="catList.jsp">고양이</a></li>
			<li><a href="otherList.jsp">그 외</a></li>
			<li><a href="itemList.jsp">펫 용품</a></li>
		</ul>
		<!-- 아이콘 -->
		<ul class="navbar_icons">

			<%
				String userID = null; //유저ID가 null이 아니면 가져오기
			if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
			}
			//userID가 없는 사람은 로그인과 가입하기만 보여주고 ID가 있는 사람은 로그아웃만
			if (userID != null) {
			%>
			<span class="nav_welcome_user">안녕하세요${userID}님</span>
			<a class="nav_logout" href="logoutAction.jsp">로그아웃</a>
			<%
				}
			%>

			<li>
			<%
			//userID가 없는 사람은 로그인 화면으로 이동, 로그인 시 장바구니페이지 이동
			if (userID != null) {
			%>
			<a href="bookingList.jsp">
			<%
				} else {
			%>
			<a href="login.jsp">
						<%
				}
			%><i class="fa-duotone fa-cart-shopping"></i></a>
			</li>
			
			
			<li>
			<%
			//userID가 없는 사람은 로그인 화면으로 이동, 로그인 시 마이페이지 이동
			if (userID != null) {
			%>
			<a href="bookingList.jsp">
			<%
				} else {
			%>
			<a href="login.jsp">
						<%
				}
			%> <i class="fa-duotone fa-user"></i></a></li>
		</ul>
		<!-- 토글 버튼 -->
		<a href="#" class="navbar_toggleBtn"> <i class="fa-solid fa-bars"></i>
		</a>
	</nav>
	<!-- 네브바 종료 -->

</body>
</html>