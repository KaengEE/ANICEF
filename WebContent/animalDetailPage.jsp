<%@page import="animal.Animal"%>
<%@page import="animal.AnimalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANICEF</title>
<link rel="stylesheet" href="./css/detailPage.css" />
<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" />
<body>
	<%
		//세션의 userID가 있으면 가져온다. 
	String userID = null; //유저ID가 null이 아니면 가져오기
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	
	int id = 0; //게시글 번호 초기값은 0이고 파라미터를 받음
	if (request.getParameter("id") != null) {
		id = Integer.parseInt(request.getParameter("id"));
	}
	AnimalDAO animaldao = new AnimalDAO();
	Animal animal = animaldao.getAnimalDetail(id);
	%>
	<!-- 헤더 시작 -->
	<jsp:include page="header.jsp" />
	<!-- 헤더 종료  -->
	<!-- 메인 시작 -->
	<div class="main">
		<div>
			<h3 class="main_title">[<%=animal.getLocal() %>]/[<%=animal.getSpecies()%>]/<%=animal.getName()%> </h3>
		</div>
		<div class="main_content">
			<div class="main_detail">
				<div class="detail_img">
					<img src="./images/<%=animal.getMain_image()%>" />
				</div>
				<div class="detail_text">
					<ul>
						<li>지역 : <%= animal.getLocal() %></li>
						<li>이름 : <%=animal.getName() %></li>
						<li>성별 : <%=animal.getSex() %></li>
						<li>나이 : <%=animal.getAge() %></li>
						<li>들어온날짜 : <%=animal.getDate() %></li>
						<li>중성화 여부 : <%=animal.getOx() %></li>
						<li>건강상태 : <%=animal.getHealth() %></li>
					</ul>
					<div class="detail_button">
						<a href="qna.jsp?animalId=<%=animal.getId()%>"><button>1대1 문의하기</button></a> 
						<a href="booking.jsp?animalId=<%=animal.getId()%>"><button>방문예약</button></a>
					</div>
				</div>
			</div>
		</div>
		<div class="detail_content">
			<div class="sub_img">
				<img src="/upload/<%=animal.getSub_image()%>"/>
			</div>
			<h4>내용</h4>
			<p><%=animal.getText()%></p>
		</div>
	</div>
	<!-- 메인 종료 -->
	<jsp:include page="footer.jsp" />
	<script src="./js/app.js"></script>
</body>
</html>