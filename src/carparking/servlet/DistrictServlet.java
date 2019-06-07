package carparking.servlet;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carparking.bean.*;
import carparking.dao.DistrictDAO;
import carparking.dao.NewsDAO;
import carparking.util.Page;

public class DistrictServlet extends BaseBackServlet {
	
	public String add(HttpServletRequest request, HttpServletResponse response, Page page) {
		String name= request.getParameter("name");
		District d = new District();
		d.setName(name);
		districtDAO.add(d);
		
		return "@admin_district_list";
	}

	
	public String delete(HttpServletRequest request, HttpServletResponse response, Page page) {
		int id = Integer.parseInt(request.getParameter("id"));
		districtDAO.delete(id);
		return "@admin_district_list";
	}

	
	public String edit(HttpServletRequest request, HttpServletResponse response, Page page) {
		int id = Integer.parseInt(request.getParameter("id"));
		District d = districtDAO.get(id);
		request.setAttribute("d", d);
		return "admin/editDistrict.jsp";		
	}

	
	public String update(HttpServletRequest request, HttpServletResponse response, Page page) {
		int id = Integer.parseInt(request.getParameter("id"));
		String name= request.getParameter("name");
		District d = new District();
		d.setId(id);
		d.setName(name);
		districtDAO.update(d);
		return "@admin_district_list";
	}

	public String list(HttpServletRequest request, HttpServletResponse response, Page page) {
		List<District> ds = null;
		int total = 0;
		String search = request.getParameter("search");

		if(null!=search) {
			if(search.equals("name")) {
		      String keyword = request.getParameter("keyword");
			  ds= new DistrictDAO().search(keyword,0,20);
    		  total = ds.size();
		    }
		}
		else {
			Date today = new Date();
			if(!timeSlotDAO.isExist(new java.sql.Date(today.getTime()))) {
				List<Parking> ps = parkingDAO.list();
				for(Parking p:ps) {
					parkingDAO.setTimeSlots(p);
				}
				timeSlotDAO.fill(ps);
			}
			 ds = districtDAO.list(page.getStart(),page.getCount());
			 total = districtDAO.getTotal();
		}
		page.setTotal(total);
		request.setAttribute("ds", ds);
		request.setAttribute("page", page);
		
		return "admin/listDistrict.jsp";
	}
	
}
