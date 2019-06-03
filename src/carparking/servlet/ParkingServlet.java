package carparking.servlet;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import carparking.bean.*;
import carparking.dao.DistrictDAO;
import carparking.util.Page;

public class ParkingServlet extends BaseBackServlet {

	
	public String add(HttpServletRequest request, HttpServletResponse response, Page page) {

		int did = Integer.parseInt(request.getParameter("did"));

		District d = districtDAO.get(did);
		float price = Float.parseFloat(request.getParameter("price"));
		int totalSeat = Integer.parseInt(request.getParameter("totalSeat"));
		int seat = totalSeat;
		String name= request.getParameter("name");
		String introduction= request.getParameter("introduction");
		String phoneNumber= request.getParameter("phoneNumber");
		String location= request.getParameter("location");
		int startTime = Integer.parseInt(request.getParameter("startTime"));
		int endTime = Integer.parseInt(request.getParameter("endTime"));

		Parking p = new Parking();
		p.setName(name);
        p.setIntroduction(introduction);
        p.setPrice(price);
        p.setPhoneNumber(phoneNumber);
        p.setSeat(seat);
        p.setTotalSeat(totalSeat);
        p.setDistrict(d);
        p.setLocation(location);
        p.setStartTime(startTime);
        p.setEndTime(endTime);
		parkingDAO.add(p);
		return "@admin_parking_list?did="+did;
	}

	
	public String delete(HttpServletRequest request, HttpServletResponse response, Page page) {
		int id = Integer.parseInt(request.getParameter("id"));
		Parking p = parkingDAO.get(id);
		parkingDAO.delete(id);
		return "@admin_parking_list?did="+p.getDistrict().getId();
	}

	
	public String edit(HttpServletRequest request, HttpServletResponse response, Page page) {
		int id = Integer.parseInt(request.getParameter("id"));
		Parking p = parkingDAO.get(id);
		request.setAttribute("p", p);
		return "admin/editParking.jsp";		
	}
	

	public String update(HttpServletRequest request, HttpServletResponse response, Page page) {
		int did = Integer.parseInt(request.getParameter("did"));
		District d = districtDAO.get(did);
		
		int id = Integer.parseInt(request.getParameter("id"));
		float price = Float.parseFloat(request.getParameter("price"));
		int totalSeat = Integer.parseInt(request.getParameter("totalSeat"));
		int seat = Integer.parseInt(request.getParameter("seat"));
		String name= request.getParameter("name");
		String introduction= request.getParameter("introduction");
		String phoneNumber= request.getParameter("phoneNumber");
		String location= request.getParameter("location");
		int startTime = Integer.parseInt(request.getParameter("startTime"));
		int endTime = Integer.parseInt(request.getParameter("endTime"));

		Parking p = new Parking();
		p.setName(name);
        p.setIntroduction(introduction);
        p.setPrice(price);
        p.setPhoneNumber(phoneNumber);
        p.setSeat(seat);
        p.setTotalSeat(totalSeat);
        p.setDistrict(d);
        p.setLocation(location);
        p.setStartTime(startTime);
        p.setEndTime(endTime);
        p.setId(id);	

		parkingDAO.update(p);
		return "@admin_parking_list?did="+p.getDistrict().getId();
	}

	
	public String list(HttpServletRequest request, HttpServletResponse response, Page page) {
		int did = Integer.parseInt(request.getParameter("did"));
		District d = districtDAO.get(did);
		
		List<Parking> ps = parkingDAO.list(did, page.getStart(),page.getCount());
		
		int total = parkingDAO.getTotal(did);
		page.setTotal(total);
		page.setParam("&did="+d.getId());
		
		request.setAttribute("ps", ps);
		request.setAttribute("d", d);
		request.setAttribute("page", page);
		
		
		
		return "admin/listParking.jsp";
	}
}
