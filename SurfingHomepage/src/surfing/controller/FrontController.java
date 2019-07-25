package surfing.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import surfing.service.SurfingService;

//properties

	// /loginForm=LoginFormService
	// /loginProcess=LoginService
	
	// /regForm=regFormService
	// /regProcess=RegService
	
	// /deleteMemForm=deleteMemFormService
	// /deleteMem=deleteMemService

	// /=indexService
	

@WebServlet(
		urlPatterns = { "/" }, 
		initParams = { 
				@WebInitParam(name = "config", value = "/WEB-INF/commandService1.properties")
		})
public class FrontController extends HttpServlet {

	// command패턴 쓰기위해 MAP사용
	private Map<String, SurfingService> commands = new HashMap<String, SurfingService>();
    
    // init
	public void init(ServletConfig config) throws ServletException {
		String configfile = config.getInitParameter("config");
		
		// properties객체 생성 (문서로 저장된 경로&서비스)
		Properties prop = new Properties();
		
		// 절대경로를 위한 파일입출력
		FileInputStream fis = null;
		// config파일의 절대경로
		String configFilePath = config.getServletContext().getRealPath(configfile);
		
		try {
			
			// properties에 load하기
			fis = new FileInputStream(configFilePath);
			prop.load(fis);
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// properties -> keySet으로 만들어주기, iterator사용
		Iterator itr = prop.keySet().iterator();
		
		while(itr.hasNext()) {
			
			String command = (String) itr.next();
			String serviceClassName = prop.getProperty(command);
			
			try {
				// prop에 있는 클래스 이름으로 인스턴스 생성
				Class serviceClass = Class.forName(serviceClassName);
				SurfingService service = (SurfingService) serviceClass.newInstance();
				
				// MAP에 저장
				commands.put(command, service);
			
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		}
				
	}
	

	// 생성자
    public FrontController() {
        
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) {

		// 1. 사용자 요청 분석
		String commandUri = request.getRequestURI();
		if(commandUri.indexOf(request.getContextPath()) == 0 ) {
			commandUri = commandUri.substring(request.getContextPath().length());
		}
		
		String viewPage = "/WEB-INF/view/null.jsp";
		
		// MAP -> get KEY -> value(서비스객체) 가져옴
		SurfingService service = commands.get(commandUri);
		
		if(service != null) {
			// 2. 사용자 요청에 맞는 viewpage 반환
			viewPage = service.getViewName(request, response);
		}
		
		// 3. view로 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		
		try {
			
			dispatcher.forward(request, response);
			
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
