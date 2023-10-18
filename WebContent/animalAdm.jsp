<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="animal.*"%>
<%@ include file="../common/adminheader.jspf"%>
<%@ include file="../common/adminnavigation.jspf"%>
			<h3>동물 관리</h3>
			<hr>
			<div class="table">
				<table class="table table-hover">
					<tr>
						<th><input type="checkbox"></th>
						<th>동물 ID</th>
						<th>이름</th>
						<th>성별</th>
						<th>나이</th>
						<th>중성화 여부</th>
						<th>보호 지역</th>
						<th>건강 상태</th>
					</tr>
	    			<%@ include file="dbconn.jsp"%>
				</table>
			</div>
<%@ include file="./common/adminfooter.jspf"%>