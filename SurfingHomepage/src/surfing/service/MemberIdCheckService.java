package surfing.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import surfing.dao.Dao;
import surfing.model.MemberInfo;

public class MemberIdCheckService implements SurfingService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		
		Connection conn = null;
		Dao dao = Dao.getInstance();
		MemberInfo memberInfo = null;
		
		String resultCode = "N";
		
		try {
			conn = ConnectionProvider.getConnection();
			memberInfo = dao.searchMem(conn, id);
			
			if(memberInfo == null) {
				// 사용가능한 아이디임
				resultCode = "Y";
			}
		}catch (SQLException e) {
			// TODO: handle exception
		}
		
		request.setAttribute("resultCode", resultCode);
		
		return "/WEB-INF/view/login/idCheck.jsp";
	}

}
