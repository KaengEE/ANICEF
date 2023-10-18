<%@page import="animal.Animal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="animal.AnimalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANICEF</title>
<link rel="stylesheet" href="./css/list.css" />
<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" />
<body>
	<%
	//세션의 userID가 있으면 가져온다. 
	String userID = null; //로그인을 해야 볼 수 있음
	String adminID = null; 
	if (session.getAttribute("userID") == null && session.getAttribute("adminID") == null) {
		out.println("<script>");
		out.println("alert('로그인이 필요합니다.')");
		out.println("location.href = 'main.jsp'");
		out.println("</script>");
	}
	
	%>
	<!--헤더 시작-->
	<jsp:include page="header.jsp" />
	<!--헤더 종료-->
	<!-- 메인 시작 -->
	<div class="main">
		<div>
			<h3 class="main_title">|고양이|</h3>
		</div>
		<div class="main_content">
			<%
				AnimalDAO animalDao = new AnimalDAO();
			ArrayList<Animal> list = animalDao.getListCat();

			for (int i = 0; i < list.size(); i++) {
			%>
			<div class="main_list">
				<div class="list_image">
					<a href="animalDetailPage.jsp?id=<%=list.get(i).getId()%>"><img src="./images/<%=list.get(i).getMain_image()%>" /></a>
				</div>
				<div class="list_name">
					<a href="animalDetailPage.jsp?id=<%=list.get(i).getId()%>">
					[<%=list.get(i).getLocal()%>]
					<%=list.get(i).getName()%></a>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<!-- 메인 종료 -->

	<jsp:include page="footer.jsp" />
	<script src="./js/app.js"></script>
</body>
</html>