<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 현재 session 강제소멸 */
	request.getSession(false).invalidate();

	/* 데이터 삭제하고 홈으로 이동 */
	response.sendRedirect(request.getContextPath());

%>