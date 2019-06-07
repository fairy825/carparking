package carparking.servlet;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carparking.bean.*;
import carparking.dao.BookingDAO;
import carparking.dao.DistrictDAO;
import carparking.dao.NewsDAO;
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
		List<News> ns = null;
		int total = 0;
		String search = request.getParameter("search");

		if(null!=search) {
			if(search.equals("title")) {
		      String keyword = request.getParameter("keyword");
			  ns= new NewsDAO().search(keyword,0,20);
    		  total = ns.size();
		    }
		}
		else {
			 ns = newsDAO.list(page.getStart(),page.getCount());
			 total = newsDAO.getTotal();
		}
		page.setTotal(total);
		
		request.setAttribute("ns", ns);
		request.setAttribute("page", page);
		System.out.println(ns);
		return "admin/listNews.jsp";
	}
	public String search(HttpServletRequest request, HttpServletResponse response, Page page){
	    String keyword = request.getParameter("keyword");
	    System.out.println(keyword);

	    List<News> ns= new NewsDAO().search(keyword,0,20);
	    int num = ns.size();
//	    System.out.println(ds);
		page.setTotal(num);
	    request.setAttribute("ns",ns);
		request.setAttribute("page", page);

//	    request.setAttribute("num",num);
	    return "admin/listNews.jsp";
	}  
}
