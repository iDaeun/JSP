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

public class memListService implements SurfingService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		Connection conn = null;
		List<MemberInfo> list = new ArrayList<MemberInfo>();
		
		try {
			
			conn = ConnectionProvider.getConnection();
			Dao dao = Dao.getInstance();
			
			list = dao.selectAllMem(conn);
			
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		request.setAttribute("list", list);
		
		return "/WEB-INF/view/admin/memList.jsp";
	}

}
