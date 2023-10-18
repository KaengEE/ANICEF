<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../common/adminheader.jspf"%>
<%@ include file="../common/adminnavigation.jspf"%>


	<div class="title"><h3>공지사항 작성</h3></div>
	<hr>
	<div class="row">
		<div class="col-9 mx-auto">
			<div "bg-light p-5 mt-5>
				<form action="addinfoAction.jsp" method="post">
					<div>
					제목: <input type="text" name="title" cols="100" placeholder="제목을 입력해주세요.">
					</div>
					<div>
					내용:</br> 
					<textarea rows="10" name="text" cols="100"></textarea>
					</div>
					<!-- 작성/취소 버튼 -->
					<div>
						<!-- <input type="hidden" name="admin_id" value="${adminID}"> -->
						<input type="button" onclick="location.href='infomation.jsp'" class="btn btn-danger" value="취소"/>
						<input type="submit" class="btn btn-primary" value="작성완료"/>
					</div>
				</form>
				
			</div>
		</div>
	</div>

<%@ include file="./common/adminfooter.jspf"%>