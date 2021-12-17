package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Member;
import dao.MemberDao;

public class DeleteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			
			String id = (String)request.getSession().getAttribute("id");
			
			MemberDao md = MemberDao.getInstance();
			Member member = md.member_select(id); 
			request.setAttribute("member", member);//다른페이지로가지고갈때
				
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "deleteForm.jsp";
	}

}
