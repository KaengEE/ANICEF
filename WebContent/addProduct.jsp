<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/adminheader.jspf"%>
<%@ include file="../common/adminnavigation.jspf"%>
			<h3>상품 등록/수정</h3>
			<hr>
			<div class="main mx-5 mt-4">
				<form name="newAnimal" action="./processAddProduct.jsp"
					class="form-horizontal mb-3" method="post">
					<div class="form-group row">
						<label class="col-sm-2">상품명</label>
						<div class="col-sm-3">
							<input type="text" name="productName" class="form-control">
						</div>
					</div>
					<br>
					<div class="form-group row">
						<label class="col-sm-2">상품 가격</label>
						<div class="col-sm-3">
							<input type="text" name="price" class="form-control">
						</div>
					</div>
					<br>
					<div class="form-group row">
						<label class="col-sm-2">상품 재고</label>
						<div class="col-sm-3">
							<input type="text" name="stock" class="form-control">
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