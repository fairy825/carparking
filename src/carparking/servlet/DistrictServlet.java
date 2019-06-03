package carparking.servlet;


import java.awt.image.BufferedImage;
	
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carparking.bean.*;
import carparking.util.ImageUtil;
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
		List<District> ds = districtDAO.list(page.getStart(),page.getCount());
		
		int total = districtDAO.getTotal();
		page.setTotal(total);
		
		request.setAttribute("ds", ds);
		request.setAttribute("page", page);
		
		return "admin/listDistrict.jsp";
	}
}
