<%@page import="qna.AnswerDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="info.InfoDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>


<%

    // 폼에서 전달된 데이터 가져오기
    String answer = request.getParameter("text");
    String qna_id = request.getParameter("id");
    //int qnaId = Integer.parseInt(qna_id); //정수로 변환
    
    String state = "답변완료"; //작성시 답변완료
    //String admin_id = "admin1"; //임시
    
   
    //세션에 저장된 아이디 가져오기
    HttpSession session1 = request.getSession();
    String admin_id = (String) session1.getAttribute("adminID");
    
	AnswerDAO dao = new AnswerDAO();
	int answerId = Integer.parseInt(request.getParameter("id"));
	
	// 기존 답변 확인
	if (dao.AnswerExist(Integer.parseInt(request.getParameter("id")))) {

	    // 답변이 이미 존재하면 수정 메서드 호출
	    dao.updateAnswer(answerId, answer, admin_id);
	} else {
	    // 답변이 없으면 추가 메서드 호출
	    dao.addAnswer(qna_id, answer, admin_id, state);
	    
	}
	
    response.sendRedirect("qna.jsp"); // 성공 시 페이지 이동
	
    
%>