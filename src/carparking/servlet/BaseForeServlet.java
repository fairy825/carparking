package carparking.servlet;

import java.lang.reflect.Method;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carparking.dao.*;
import carparking.util.Page;

public class BaseForeServlet extends HttpServlet{

	protected DistrictDAO districtDAO = new DistrictDAO();
	protected UserDAO userDAO = new UserDAO();
	protected AdminDAO adminDAO = new AdminDAO();
	protected ParkingDAO parkingDAO = new ParkingDAO();
	protected ParkingImageDAO parkingImageDAO = new ParkingImageDAO();
	protected NewsDAO newsDAO = new NewsDAO();
	protected MessageDAO messageDAO = new MessageDAO();
	protected BookingDAO bookingDAO = new BookingDAO();
	protected TimeSlotDAO timeSlotDAO = new TimeSlotDAO();

	public void service(HttpServletRequest request, HttpServletResponse response) {
		try {
			
			int start= 0;
			int count = 5;
			try {
				start = Integer.parseInt(request.getParameter("page.start"));
			} catch (Exception e) {
				
			}
			
			try {
				count = Integer.parseInt(request.getParameter("page.count"));
			} catch (Exception e) {
			}
			
			Page page = new Page(start,count);
			
			String method = (String) request.getAttribute("method");

			Method m = this.getClass().getMethod(method, javax.servlet.http.HttpServletRequest.class,
					javax.servlet.http.HttpServletResponse.class,Page.class);
			
			String redirect = m.invoke(this,request, response,page).toString();
			
			if(redirect.startsWith("@"))
				response.sendRedirect(redirect.substring(1));
			else if(redirect.startsWith("%"))
				response.getWriter().print(redirect.substring(1));
			else
				request.getRequestDispatcher(redirect).forward(request, response);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
