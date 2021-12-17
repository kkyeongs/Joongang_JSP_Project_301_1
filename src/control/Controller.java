package control;

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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

/**
 * Servlet implementation class Controller
 */
//@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> commandMap = new HashMap<String, Object>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		//web.xml에서 propertyConfig에 해당하는 init-para의 값을 읽어옴
		String props = config.getInitParameter("config");
		
		//명렁어와 처리클래스의 맵핑정보를 저장할 properties객체 생성
		//System.out.println("Controller props->"+props);
		Properties pr = new Properties();
		
		FileInputStream f = null;
		
		
		try {
			String configFilePath = config.getServletContext().getRealPath(props); 
			//System.out.println("Controller configFilePath->"+configFilePath);
			f = new FileInputStream(configFilePath);
			//command.properties파일의 정보를 Properties객체에 저장
			pr.load(f);
		} catch (IOException e) {
			throw new ServletException(e);
		}finally {
			if(f != null) try {
				f.close();
			}catch(IOException ex) {}
		}
		//Iterator객체는 Enumberation객체를 확장시킨 개념의 객체
			Iterator keyIter = pr.keySet().iterator();
			
		//객체를 하나씩 꺼내서 그 객체명으로 Properties객체에 저장된 객체에 접근
			while(keyIter.hasNext()) {
				String command = (String)keyIter.next(); //writeForm.do / list.do
				String className = pr.getProperty(command);  // service.WriteFormAction service.List
			//	System.out.println("Controller className->"+className);
			//	System.out.println("Controller command->"+command);
				//ListAction la = new ListAction();
				try {
					Class<?> commandClass = Class.forName(className); //해당 문자열을 클래스로 만든다.
					
					// Object commandInstance = commandClass.newInstance(); // 해당 클래스의 객체를 생성.
					Object commandInstance = commandClass.getDeclaredConstructor().newInstance();
				
					// WriteFormAction wfa = new WriteformAction();
					commandMap.put(command, commandInstance); // Map 객체인 commandMap에 객체 저장
				}catch(Exception e) {
					throw new ServletException(e);
				}
			}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		contRequestPro(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		contRequestPro(request, response);
	}

	//사용자의 요청을 분석해서 해당 작업을 처리
	private void contRequestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String view = null;
		CommandProcess com = null;
		String command = request.getRequestURI();
		try {
		//	System.out.println(command); // /ch16/list.do
			command = command.substring(request.getContextPath().length());
			
			com = (CommandProcess)commandMap.get(command);
			
			
		//	System.out.println("command1=>"+command); // /ch16/com
		//	System.out.println("com=>"+com); // /ch16/com
			view = com.requestPro(request, response);
			
			
		//	System.out.println("view=>"+view); // /ch16/com
		}catch (Throwable e) {
			throw new ServletException(e);
		}
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
				dispatcher.forward(request, response);
	}
	
	
	
}





