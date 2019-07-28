package surfing.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import surfing.dao.Dao;
import surfing.model.MemberInfo;

public class viewMemService implements SurfingService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		Connection conn = null;
		MemberInfo memberInfo = null;
		
		try {
			
			conn = ConnectionProvider.getConnection();
			Dao dao = Dao.getInstance();
			
			memberInfo = dao.searchMem(conn, id);
			
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		request.setAttribute("memberInfo", memberInfo);
		
		return "/WEB-INF/view/admin/viewMem.jsp";
	}

}
