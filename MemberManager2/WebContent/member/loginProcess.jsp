<%@page import="surfing.model.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	String userId = request.getParameter("uId");	
	String userPw = request.getParameter("uPw");
	
	//boolean loginChk = false;
	
	/* 
		1. 사용자가 입력한 id로 회원 정보 검색
		2. 존재한다 : 해당 객체를 받는다.
		     해당객체의 pw와 사용자가 입력한 pw비교 
		     같다면 -> 로그인 처리 : 세션영역에 회원정보를 저장함
		     틀리면 -> 요류 메시지 전달 -> 로그인 페이지로 이동
		3. 존재하지 않는다 : 오류 메시지 전달 -> 로그인 페이지로 이동
	*/
		
		// 1. 사용자가 입력한 id로 회원 정보 검색
		// ***회원가입 시 : application객체의 속성에 정보 저장함!
		MemberInfo memberInfo = (MemberInfo)application.getAttribute(userId);
		
		if(memberInfo != null && memberInfo.getPw().equals(userPw)){
		//회원 정보가 존재 && 비밀번호가 일치
		//###세션에 회원 로그인 정보를 저장 (LoginInfo객체로!)
		session.setAttribute("loginInfo", memberInfo.toLoginInfo());
		
		//아이디 저장 체크 표시 -> cookie로 저장하기 (유효기간:5분)
		String save = request.getParameter("save");
		
		out.println(save);
		if(save != null && save.equals("on")){
			Cookie c = new Cookie("savedId",userId);
			c.setMaxAge(60*5);
			response.addCookie(c); 
		} 
		
		//로그인 처리 후 메인 페이지로 이동
		response.sendRedirect(request.getContextPath());
			
		} else {
			
	//id 검색결과가 null 또는 pw 비교해서 같이 않은 경우
	%>
			<script>
				alert('아이디 혹은 비밀번호가 틀립니다.\n다시 로그인 해주세요');
				history.go(-1);
			</script>
		<%
			}
		%>
	

<!-- 	if(userId != null && userPw != null && userId.equals("admin") && userPw.equals("admin")){
		
		/* /mm 들어옴 */
		response.sendRedirect(request.getContextPath());
	}  -->
