package surfing.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegFormService implements SurfingService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {

		String viewPage = "/WEB-INF/view/regForm.jsp";
		
		return viewPage;
	}

}
