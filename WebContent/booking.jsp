<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- footer -->
<link rel="stylesheet" href="css/footer.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>

	<%@ include file="header.jsp"%>
	<main class="d-flex justify-content">
		<%@ include file="menu.jsp"%>
		<div class="container mt-5">
			<h3>ANICEF 방문 예약</h3>
			<hr>
			<div class="main mx-5 mt-4">
				<form name="newAnimal" action="./bookingAction.jsp"
					class="form-horizontal mb-3" method="get">

					<div class="form-group row">
						<label class="col-sm-3">유저 아이디</label>
						<div class="col-sm-5" style="font-size: 20px; margin-left: 30px;">
							<input type="hidden" name="userID" value="${userID}" />${userID}님
						</div>
					</div>
					<br>
					<div class="form-group row">
						<label class="col-sm-2">방문 지점</label>
						<div class="col-sm-3">
							<select name="local"
								style="width: 275px; height: 35px; text-align: center;">
								<option selected value="부산">부산 센텀 지점</option>
								<option value="서울">서울 강남 지점</option>
								<option value="경기">경기 수원 지점</option>
								<option value="광주">광주 중구 지점</option>
							</select>
						</div>
					</div>
					<br>
					<div class="form-group row">
						<label class="col-sm-2">입양 동물</label>
						<div class="col-sm-3">
							<select style="width: 275px; height: 35px; text-align: center;">
								<option selected value="강아지">강아지</option>
								<option value="고양이">고양이</option>
								<option value="그외">그 외</option>
							</select>
						</div>
					</div>
					<br>
					<div class="form-group row">
						<label class="col-sm-3">입양 동물 이름</label>
						<div class="col-sm-3">
							<input type="text" name="booking_name" class="form-control">
						</div>
					</div>
					<br>
					<div class="form-group row">
						<label class="col-sm-3">방문 예정 날짜</label>
						<div class="col-sm-3">
							<input type="date" name="book_date" id="book_date"
								class="form-control">
						</div>
					</div>
					<br>
					<div class="form-group row">
						<label class="col-sm-3">방문 예정 시간</label>
						<div class="col-sm-3">
							<input type="number" name="book_time" id="book_time"
								class="form-control">
						</div>
					</div>
					<br>
					<div class="form-group row">
						<label class="col-sm-2">상세 설명</label>
						<div class="col-sm-5">
							<textarea name="text" id="text" cols="100" rows="5"
								class="form-control" placeholder="100자 이상 적어주세요"></textarea>
						</div>
					</div>
					<br>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
							<input type="submit" class="btn btn-primary" value="수정">
							<input type="submit" class="btn btn-primary" value="등록">
						</div>
					</div>
					<script>
						$(function() {
							$("#book_time").timepicker();
						});
					</script>
				</form>
			</div>
		</div>
	</main>
	<%@ include file="footer.jsp"%>
</body>
</html>