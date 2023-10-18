<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../common/adminheader.jspf"%>
<%@ include file="../common/adminnavigation.jspf"%>
<script>
	//state 변경 
	function updateState(bookingId) {
	        // AJAX 요청 보내기
	        //alert("확인");
			$.ajax({
				  url: "updateState.jsp",
				  type: "GET",
				  data: {
				    booking_id: bookingId,
				    state: "방문완료" 
				  },
				  success: function(data) {
				    // 성공한 경우
				    let modal = '#modal'+bookingId;
				    $(modal).modal('hide');
			        location.reload(); //새로고침
			        
			        },
			      error: function() {
			         alert("AJAX 요청 실패!");
			      }
				    
				});
			
	      };
</script>
<div class="title">
	<h3>예약현황</h3>
</div>
<hr>
<div class="table">
	<table class="table table-hover">
		<tr>
			<th>no</th>
			<th>예약자명</th>
			<th>예약자ID</th>
			<th>전화번호</th>
			<th>예약일자</th>
			<th>방문시간</th>
			<th>방문센터</th>
			<th>방문현황</th>
			<th>방문완료</th>
		</tr>
		<!-- 반복문 -->
		<%@ include file="dbconn.jsp"%>
		<%
			PreparedStatement pstmt = null;
		ResultSet rs = null;
		//booking과 users JOIN
		String sql = "SELECT * FROM booking LEFT JOIN users ON users.id = booking.user_id";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int index = 1; // 인덱스
		while (rs.next()) {
		%>
		<tr>
			<td><%=index%></td>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("id")%></td>
			<td><%=rs.getString("ph")%></td>
			<td><%=rs.getString("book_date")%></td>
			<td><%=rs.getString("book_time")%></td>
			<td><%=rs.getString("local")%></td>
			<td><%=rs.getString("state")%></td>
			<td>
				<!-- 부트스트랩 모달창 -->
				<button id="madalbtn" name="modalbtn" type="button"
					class="btn btn-primary" data-toggle="modal"
					data-target="#modal<%=rs.getInt("booking_id")%>">확인</button> <!-- Modal -->
				<div class="modal fade" id="modal<%=rs.getInt("booking_id")%>"
					tabindex="-1" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">상세 예약 내역</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<p>
									예약자명:
									<%=rs.getString("name")%></p>
								<p>
									예약일자:
									<%=rs.getString("book_date")%></p>
								<p>
									예약시간:
									<%=rs.getString("book_time")%></p>
								<p>
									예약센터:
									<%=rs.getString("local")%></p>
								<p> 예약내용:
									<%=rs.getString("text")%></p>
								<p><%=rs.getString("name")%>님이 방문하신것이 맞습니까?
								</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-primary"
									onclick="updateState(<%=rs.getInt("booking_id")%>)">확인</button>
							</div>
						</div>
					</div>
				</div>
			</td>
		</tr>
		<%
			index++;
		}
		%>
	</table>
</div>


<%@ include file="./common/adminfooter.jspf"%>
