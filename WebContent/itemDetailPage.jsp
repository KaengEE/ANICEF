<%@page import="item.Item"%>
<%@page import="item.ItemDAO"%>
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

	//상품ID가져오기
	int itemId = 0;
	if (request.getParameter("id") != null) {
		itemId = Integer.parseInt(request.getParameter("id"));
	}
	ItemDAO itemdao = new ItemDAO();
	Item item = itemdao.getItemDetail(itemId);
	%>
	<!-- 헤더 시작  -->
	<jsp:include page="header.jsp" />
	<!-- 헤더 종료 -->
	<!-- 메인 시작 -->
	<div class="main">
		<div>
			<h3 class="main_title">
				[<%=item.getName()%>]
			</h3>
		</div>
		<div class="main_content">
			<div class="main_detail">
				<div class="detail_img">
					<img src="./images/<%=item.getMain_image()%>" />
				</div>
				<div class="detail_text">
					<ul>
						<li>상품명 : <%=item.getName()%></li>
						<li>가격 : <%=item.getPrice()%>원
						</li>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
					<div class="detail_button">
						<form name="cartform" action="myCart.jsp" method="get">
							<select name="amount">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
							</select> <input type="hidden" name="itemId" value="<%=item.getId()%>"> <input
								type="hidden" name="userID" value="${userID}"> <a
								href="" onclick="(alert('[<%=item.getName()%>]을 장바구니에 담았습니다!'))"><button>장바구니</button></a>
						</form>
							<button onclick='buy()'>구매하기</button>
					</div>
				</div>
			</div>
			<div class="detail_content">
				<div class="sub_img">
					<img src="/upload/<%=item.getSub_image()%>" alt="" />
				</div>
				<h4>내용</h4>
				<p>
					<%=item.getText()%>
				</p>
			</div>
		</div>
		<!-- 메인 종료 -->
		<jsp:include page="footer.jsp" />
		<script src="./js/app.js"></script>
		<script>
		function buy(){
			const carturl_userid = '&userID=' + document.cartform.userID.value;
			const carturl_amount = '&amount=' + document.cartform.amount.value;
			
			const url = "purchase.jsp?itemId=" +document.cartform.itemId.value + carturl_userid + carturl_amount;
			location.href= url;
		}
		</script>
</body>
</html>