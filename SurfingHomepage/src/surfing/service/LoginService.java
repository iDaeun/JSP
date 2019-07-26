package surfing.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import surfing.dao.Dao;
import surfing.exception.IdNotFoundException;
import surfing.exception.PwInvalidException;
import surfing.model.MemberInfo;

public class LoginService implements SurfingService {
	
	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {

		String viewPage = "/WEB-INF/view/login/loginProcess.jsp";
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		Connection conn = null;
		MemberInfo memberInfo = null;
		boolean chk = false;
		String msg = "";
		
		try {

			conn = ConnectionProvider.getConnection();
			Dao dao = Dao.getInstance();
			
			// 아이디 존재?
			memberInfo = dao.searchMem(conn, id);
			
			if(memberInfo == null) {
				throw new IdNotFoundException("해당 아이디가 없습니다");
			}
			
			if(!memberInfo.matchPassword(pw)) {
				throw new PwInvalidException("비밀번호가 틀렸습니다");
			}
			
			// 아이디&비밀번호 존재
			chk = true;
			
		} catch(SQLException e) {
			e.printStackTrace();
			msg = e.getMessage();
		} catch (IdNotFoundException e) {
			e.printStackTrace();
			msg = e.getMessage();
		} catch (PwInvalidException e) {
			e.printStackTrace();
			msg = e.getMessage();
		}
		
		request.setAttribute("chk", chk);
		request.setAttribute("msg", msg);
		
		return viewPage;
	}

}
