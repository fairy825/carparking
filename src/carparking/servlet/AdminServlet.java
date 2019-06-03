package carparking.servlet;

import java.util.List;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.util.HtmlUtils;

import carparking.bean.Admin;
import carparking.util.Page;

public class AdminServlet extends BaseBackServlet {

	
	public String add(HttpServletRequest request, HttpServletResponse response, Page page) {

		return null;
	}

	
	public String delete(HttpServletRequest request, HttpServletResponse response, Page page) {
		return null;
	}

	
	public String edit(HttpServletRequest request, HttpServletResponse response, Page page) {
		return null;		
	}

	
	public String update(HttpServletRequest request, HttpServletResponse response, Page page) {
		return null;
	}

	
	public String list(HttpServletRequest request, HttpServletResponse response, Page page) {
		List<Admin> as = adminDAO.list(page.getStart(),page.getCount());
		int total = adminDAO.getTotal();
		page.setTotal(total);
		
		request.setAttribute("as", as);
		request.setAttribute("page", page);
		
		return "admin/listAdmin.jsp";
	}
}
