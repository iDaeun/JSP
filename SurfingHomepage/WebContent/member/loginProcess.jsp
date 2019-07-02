<%@page import="member.LoginInfo"%>
<%@page import="member.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--     	로그인 데이터 받아 처리하기
		▶ <loginProcess.jsp> 
		1) 로그인 정보(id, pw) session속성에 저장
		2) 아이디 저장 여부 체크 => 체크시 id cookie에 저장
		3) 로그인 처리 후 메인페이지로 이동 -->
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String checked = request.getParameter("save");
	%>
	
   	
<!--     1) 사용자가 입력한 id로 회원 정보 검색
			있음 -> 해당 객체를 받음
					해당 객체의 pw와 사용자가 입력한 pw비교
						같다면 : 로그인처리 -> session 속성에 저장
						틀리면 : 오류 메시지 전달 -> 로그인 페이지로 이동
			없음 -> 오류 메시지 전달 -> 로그인 페이지로 이동 -->
   	
   	<%	
   		// 입력받은 id이 존재하는지 검색
   		/* !!회원가입 시 application속성에 정보 저장하였음 */
   		MemberInfo memberInfo = (MemberInfo)application.getAttribute(id);
   		
   		if(memberInfo != null && memberInfo.getPw().equals(pw)){
   		// 입력받은 pw -> null이 아니고 비밀번호가 일치
   		// session 속성에 저장 (LoginInfo.java 객체로)
   			session.setAttribute("loginInfo", memberInfo.toLoginInfo()); %>
   				
   			<script>
   			alert('로그인 완료!!');
   			</script>
   			
   			<!-- 2) 아이디 저장 여부 체크 => 체크시 id cookie에 저장 -->
   			<%
   			if(checked != null && checked.equals("checked")){
   				Cookie cookie = new Cookie("savedId",id);
   				// 유효기간 : 5분
   				cookie.setMaxAge(60*5);
   				response.addCookie(cookie); %>
   				<!-- 왜 알람 안뜨냐!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	   			<script>
	   			alert('아이디 저장 완료!!');
	   			</script>
	   			
   			<%
   			}

   			/* 3) 로그인 처리 후 메인페이지로 이동 */
			response.sendRedirect(request.getContextPath());
   		} else { %>
   		<!-- 불일치 -->
   			<script>
   			alert('아이디 혹은 비밀번호 불일치, 다시 로그인해주세요!!');
   			location.href='loginForm.jsp';
   			</script>   			
   		<%   		
   		}
   		%>
   	