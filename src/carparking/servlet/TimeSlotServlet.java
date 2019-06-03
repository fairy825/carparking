package carparking.servlet;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carparking.bean.*;
import carparking.util.Page;

public class TimeSlotServlet extends BaseBackServlet {
	
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
		/*int dateid = Integer.parseInt(request.getParameter("thedate"));
		Parking p = parkingDAO.get(dateid);
		
		List<TimeSlot> tss = timeSlotDAO.list(thedate, page.getStart(),page.getCount());
		
		int total = timeSlotDAO.getTotal(thedate);
		page.setTotal(total);
		page.setParam("&thedate="+p.getId());
		
		request.setAttribute("tss", tss);
		request.setAttribute("d", d);
		request.setAttribute("page", page);
		*/
		return "admin/listTimeSlot.jsp";
		
	}
		
}
