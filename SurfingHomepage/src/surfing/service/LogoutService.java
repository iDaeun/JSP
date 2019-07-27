package surfing.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutService implements SurfingService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		request.getSession(false).invalidate();
		
		return "/WEB-INF/view/login/logout.jsp";
	}
	
}
