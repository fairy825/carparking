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
		int id = Integer.parseInt(request.getParameter("id"));
		TimeSlot ts = timeSlotDAO.get(id);
		request.setAttribute("ts", ts);
		return "admin/editTimeSlot.jsp";		
	}

	
	public String update(HttpServletRequest request, HttpServletResponse response, Page page) {
		int pid = Integer.parseInt(request.getParameter("pid"));
		Parking parking = parkingDAO.get(pid);
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		int seat = Integer.parseInt(request.getParameter("seat"));
		System.out.println("begin");
		System.out.println(request.getParameter("beginTime"));
		int beginTime = Integer.parseInt(request.getParameter("beginTime"));
		Date bookingDate = new Date();
		TimeSlot ts = new TimeSlot();
		ts.setSeat(seat);
		ts.setParking(parking);
		ts.setBookingDate(bookingDate);
		ts.setBeginTime(beginTime);
        ts.setId(id);	

		timeSlotDAO.update(ts);
		return "@admin_timeSlot_list?pid="+ts.getParking().getId();
	}

	public String list(HttpServletRequest request, HttpServletResponse response, Page page) {
		Date today = new Date();
		int pid = Integer.parseInt(request.getParameter("pid"));
		Parking p = parkingDAO.get(pid);
		
		List<TimeSlot> tss = timeSlotDAO.list(today, pid, page.getStart(),page.getCount());
		
		int total = timeSlotDAO.getTotal(new java.sql.Date(today.getTime()),pid);
    
		page.setTotal(total);
		page.setParam("&thedate="+p.getId());
		
		request.setAttribute("tss", tss);
		request.setAttribute("p", p);
		request.setAttribute("page", page);
		
		return "admin/listTimeSlot.jsp";
		
	}
		
}
