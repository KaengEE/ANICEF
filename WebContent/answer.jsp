<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../common/adminheader.jspf"%>
<%@ include file="../common/adminnavigation.jspf"%>

<div class="title"><h3>문의답변</h3></div>
<hr>
<div class="row">
    <div class="col-9 mx-auto">
        <div class="bg-light p-5 mt-5">
            <div class="row">
                <div class="col-3">
                    <p>제목:</p>
                    <p>작성자:</p>
                    <p>작성일:</p>
                    <p>동물id:</p>
                    <p>첨부파일:</p>
                    <p>질문내용:</p>
                </div>

                <%@ include file="dbconn.jsp"%>
                <%
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    // qna과 answer user animal 테이블 join
                    String sql = 
                    "SELECT question.*, users.name, animal.id, answer.answer " 
                    + "FROM question "
                    + "LEFT JOIN answer ON question.id = answer.qna_id "
                    + "LEFT JOIN users ON question.name = users.name "
                    + "LEFT JOIN animal ON question.animal_id = animal.id "
                    + "WHERE question.id = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, Integer.parseInt(request.getParameter("id")));
                    rs = pstmt.executeQuery();
                    boolean exist = false; // 답변이 있는지 확인하는 변수

                    while (rs.next()) {
                        // 답변이 있는 경우에만 hasAnswer를 true로 설정
                        if (rs.getString("answer") != null) {
                        	exist = true;}
                        
                        %>
                        <div class="col-8">
                            <p><%=rs.getString("title") %></p>
                            <p><%=rs.getString("name") %></p>
                            <p><%=rs.getString("date") %></p>
                            <p><%=rs.getInt("animal_id") %></p>
                            <p><%=rs.getString("file") %></p> <!-- 임시 파일 -->
                            <div class="background-color-light bg-light"><%=rs.getString("question") %></div>
                        </div>
					
                
                    <!-- 답변 폼 -->
                    <form action="answerAction.jsp" method="post">
                    <div>
                    답변하기:<br> 
                    <!-- DB에 답변이 있다면 DB 불러오기 -->
                    <% if (exist) { %>
                        <textarea rows="10" name="text" cols="100"><%= rs.getString("answer") %></textarea>
                    <% } else { %>
                    	<!-- 답변이 없다면 -->
                        <textarea rows="10" name="text" cols="100"></textarea>
                    <% } %>
                    </div>                       
                    <%
                    } 
                    %>

                    <!-- 작성/취소 버튼 -->
                    <div>
                        <input type="hidden" name="id" value="<%=request.getParameter("id")%>"/>
                        <input type="button" onclick="location.href='qna.jsp'" class="btn btn-danger" value="취소"/>
                        <input type="submit" class="btn btn-primary" value="작성완료"/>
                    </div>
                </form>
                
            </div>
        </div>
    </div>
</div>

<%@ include file="./common/adminfooter.jspf"%>
