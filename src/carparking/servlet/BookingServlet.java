package carparking.servlet;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carparking.bean.Booking;
import carparking.bean.Parking;
import carparking.dao.BookingDAO;
import carparking.dao.ParkingDAO;
import carparking.util.Page;

public class BookingServlet extends BaseBackServlet {
	public String add(HttpServletRequest request, HttpServletResponse response, Page page) {
		return null;
	}
	public String delete(HttpServletRequest request, HttpServletResponse response, Page page) {
		return null;
	}
	/*
	public String delivery(HttpServletRequest request, HttpServletResponse response, Page page) {
		int id = Integer.parseInt(request.getParameter("id"));
		Order o = orderDAO.get(id);
		o.setDeliveryDate(new Date());
		o.setStatus(OrderDAO.waitConfirm);
		orderDAO.update(o);
		return "@admin_order_list";
	}
*/
	public String edit(HttpServletRequest request, HttpServletResponse response, Page page) {
		return null;	
	}
	public String update(HttpServletRequest request, HttpServletResponse response, Page page) {
		return null;
	}
	public String list(HttpServletRequest request, HttpServletResponse response, Page page) {
		List<Booking> bs = null;
		int total = 0;
		//timeSlotDAO.fill(bs);
		String state = request.getParameter("state");
		String search = request.getParameter("search");

		if(null!=state){
		    bs= new BookingDAO().searchByState(state,0,20);
            //System.out.println(id);
    		total = bs.size();

		}
		else if(null!=search) {
			if(search.equals("username")) {
		      String keyword = request.getParameter("keyword");
			  bs= new BookingDAO().searchByUser(keyword,0,20);
    		  total = bs.size();
		    }
		    else if(search.equals("parkingname")) {
		      String keyword = request.getParameter("keyword");
			  bs= new BookingDAO().searchByParking(keyword,0,20);
      		  total = bs.size();
		}
		}
		else {
		bs = bookingDAO.list(page.getStart(),page.getCount());
		total = bs.size();

		}
		page.setTotal(total);
		request.setAttribute("bs", bs);
		request.setAttribute("page", page);
		
		return "admin/listBooking.jsp";
	}
	
}
