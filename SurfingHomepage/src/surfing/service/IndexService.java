package surfing.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexService implements SurfingService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {

		String viewPage = "/WEB-INF/view/home.jsp";
		
		return viewPage;
	}

}
