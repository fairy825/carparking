package carparking.servlet;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carparking.bean.*;
import carparking.util.Page;

public class MessageServlet extends BaseBackServlet {
	
	public String add(HttpServletRequest request, HttpServletResponse response, Page page) {
		int uid = Integer.parseInt(request.getParameter("uid"));
		User user = userDAO.get(uid);
		int pid = Integer.parseInt(request.getParameter("pid"));
		Parking parking = parkingDAO.get(pid);
		String content= request.getParameter("content");
		Message m = new Message();
		m.setUser(user);
		m.setParking(parking);
		m.setContent(content);
		m.setCreateDate(new Date());

		messageDAO.add(m);
		
		return "@admin_message_list";
	}

	
	public String delete(HttpServletRequest request, HttpServletResponse response, Page page) {
		int pid = Integer.parseInt(request.getParameter("pid"));
		int id = Integer.parseInt(request.getParameter("id"));
		messageDAO.delete(id);
		return "@admin_message_list?pid="+pid;
	}

	
	public String edit(HttpServletRequest request, HttpServletResponse response, Page page) {
		return null;
	}

	
	public String update(HttpServletRequest request, HttpServletResponse response, Page page) {
		return null;
	}

	public String list(HttpServletRequest request, HttpServletResponse response, Page page) {
		if(request.getParameter("pid")!=null) {
		int pid = Integer.parseInt(request.getParameter("pid"));
		Parking p = parkingDAO.get(pid);
		
		List<Message> ms = messageDAO.list(pid, page.getStart(),page.getCount());
		
		int total = messageDAO.getTotal(pid);
		page.setTotal(total);
		page.setParam("&pid="+p.getId());
		
		request.setAttribute("ms", ms);
		request.setAttribute("p", p);
		request.setAttribute("page", page);
		}
		else {
			List<Message> ms = messageDAO.list(page.getStart(),page.getCount());
			
			int total = messageDAO.getTotal();
			page.setTotal(total);
			
			request.setAttribute("ms", ms);
			request.setAttribute("page", page);
		}
		return "admin/listMessage.jsp";
	}
		
}
