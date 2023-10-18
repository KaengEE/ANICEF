<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/adminheader.jspf"%>
<%@ include file="../common/adminnavigation.jspf"%>

			<h3>동물 등록/수정</h3>
			<hr>
			<div class="main mx-5 mt-4">
				<form name="newAnimal" action="./processAddAnimal.jsp"
					class="form-horizontal mb-3" method="post">
					<div class="form-group row">
						<label class="col-sm-2">보호 지역</label>
						<div class="col-sm-3">
							<select style="width: 275px; height: 35px; text-align: center;">
								<option selected value="부산">부산</option>
								<option value="서울">서울</option>
								<option value="경기">경기</option>
								<option value="광주">광주</option>
							</select>
						</div>
					</div>
					<br>
					<div class="form-group row">
						<label class="col-sm-2">카테고리</label>
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
						<label class="col-sm-2">동물 나이</label>
						<div class="col-sm-3">
							<input type="text" id="animalAge" name="animalAge"
								class="form-control">
						</div>
					</div>
					<br>
					<div class="form-group row">
						<label class="col-sm-2">동물 이름</label>
						<div class="col-sm-3">
							<input type="text" name="animalName" class="form-control">
						</div>
					</div>
					<br>
					<div class="form-group row">
						<label class="col-sm-2">중성화 여부</label>
						<div class="col-sm-2 form-check">
							<input class="animalOX" type="radio" name="OX" value="완료" checked>
							<label class="form-check-label">O</label>
						</div>
						<div class="col-sm-2 form-check">
							<input class="animalOX" type="radio" name="OX" value="미완료">
							<label class="form-check-label">X</label>
						</div>
					</div>
					<br>
					<div class="form-group row">
						<label class="col-sm-2">동물 성별</label>
						<div class="col-sm-2 form-check">
							<input class="form-check-input" type="radio" name="gender"
								value="남성" checked> <label class="form-check-label">남성</label>
						</div>
						<div class="col-sm-2 form-check">
							<input class="form-check-input" type="radio" name="gender"
								value="여성"> <label class="form-check-label">여성</label>
						</div>
					</div>
					<br>
					<div class="form-group row">
						<label class="col-sm-2">건강 상태</label>
						<div class="col-sm-3">
							<input type="text" name="Health" class="form-control">
						</div>
					</div>
					<br>
					<div class="form-group row">
						<label class="col-sm-2">상세 설명</label>
						<div class="col-sm-5">
							<textarea name="description" cols="50" rows="2"
								class="form-control" placeholder="100자 이상 적어주세요"></textarea>
						</div>
					</div>
					<br>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
							<input type="submit" class="btn btn-primary" value="등록">
						</div>
					</div>
				</form>
			</div>
<%@ include file="./common/adminfooter.jspf"%>