<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../common/adminheader.jspf"%>
<%@ include file="../common/adminnavigation.jspf"%>

<div class="title"><h3>공지사항 상세</h3></div>
<hr>
<div class="table">
    <%@ include file="dbconn.jsp"%>
    <%
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM info WHERE info_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(request.getParameter("info_id")));
        rs = pstmt.executeQuery();
        while (rs.next()) {                       
            %>
            <table class="table table-hover">
                <tr>
                    <th>제목:</th>
                    <td><%=rs.getString("info_title") %></td>
                </tr>
                <tr>
                    <th>작성자:</th>
                    <td><%=rs.getString("admin_id") %></td>
                </tr>
                <tr>
                    <th>작성일:</th>
                    <td><%=rs.getString("date").substring(0, 10) %></td>
                </tr>
                <tr>
                    <th>공지사항 내용:</th>
                    <td><%=rs.getString("info_text") %></td>
                </tr>
            </table>
            <%
        } 
    %>
</div>

<!-- 돌아가기 버튼 -->
<div>
    <input type="button" onclick="location.href='infomation.jsp'" class="btn btn-primary" value="목록으로"/>
</div>

<%@ include file="./common/adminfooter.jspf"%>
