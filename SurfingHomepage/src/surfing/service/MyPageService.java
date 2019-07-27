package surfing.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import surfing.dao.Dao;
import surfing.model.LoginInfo1;
import surfing.model.MemberInfo;

public class MyPageService implements SurfingService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		LoginInfo1 loginInfo =  (LoginInfo1) request.getSession(false).getAttribute("loginInfo");
		String id = loginInfo.getId();
		System.out.println(id);
		
		Connection conn = null;
		MemberInfo memberInfo = null;
		
		try {
			
			conn = ConnectionProvider.getConnection();
			Dao dao = Dao.getInstance();
			
			// 해당 아이디 정보 가져오기
			memberInfo = dao.searchMem(conn, id);
			System.out.println(memberInfo);
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		request.setAttribute("memberInfo", memberInfo);
		
		return "/WEB-INF/view/myPage/myPage.jsp";
	}
	
}
