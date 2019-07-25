package surfing.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SurfingService {
	String getViewName(HttpServletRequest request, HttpServletResponse response);
}
