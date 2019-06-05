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
		List<Booking> bs = bookingDAO.list(page.getStart(),page.getCount());
		//timeSlotDAO.fill(bs);
		int total = bookingDAO.getTotal();
		page.setTotal(total);
		request.setAttribute("bs", bs);
		request.setAttribute("page", page);
		
		return "admin/listBooking.jsp";
	}
	public String search(HttpServletRequest request, HttpServletResponse response, Page page){
	    String keyword = request.getParameter("keyword");
	    System.out.println(keyword);

	    List<Booking> bss= new BookingDAO().search(keyword,0,20);
	    int num = bss.size();
//	    System.out.println(ds);
		page.setTotal(num);
	    request.setAttribute("bs",bss);
		request.setAttribute("page", page);

//	    request.setAttribute("num",num);
	    return "admin/listBooking.jsp";
	}  
}
