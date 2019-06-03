package carparking.servlet;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carparking.bean.*;
import carparking.util.Page;
import carparking.util.DateUtil;;

public class NewsServlet extends BaseBackServlet {
	
	public String add(HttpServletRequest request, HttpServletResponse response, Page page) {
		String title= request.getParameter("title");
		String content= request.getParameter("content");
		News n = new News();
		n.setTitle(title);
		n.setContent(content);
		n.setCreateDate(new Date());

		newsDAO.add(n);
		
		return "@admin_news_list";
	}

	
	public String delete(HttpServletRequest request, HttpServletResponse response, Page page) {
		int id = Integer.parseInt(request.getParameter("id"));
		newsDAO.delete(id);
		return "@admin_news_list";
	}

	
	public String edit(HttpServletRequest request, HttpServletResponse response, Page page) {
		return null;
	}

	
	public String update(HttpServletRequest request, HttpServletResponse response, Page page) {
		return null;
	}

	public String list(HttpServletRequest request, HttpServletResponse response, Page page) {
		List<News> ns = newsDAO.list(page.getStart(),page.getCount());
		
		int total = newsDAO.getTotal();
		page.setTotal(total);
		
		request.setAttribute("ns", ns);
		request.setAttribute("page", page);
		System.out.println(ns);
		return "admin/listNews.jsp";
	}
}