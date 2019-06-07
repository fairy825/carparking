package carparking.servlet;
import java.util.Collections;


import org.springframework.web.util.HtmlUtils;
import java.util.Date;
import java.text.SimpleDateFormat;

import org.apache.commons.lang.math.RandomUtils;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carparking.bean.*;
import carparking.dao.*;

import carparking.util.Page;
import carparking.comparator.*;

public class ForeServlet extends BaseForeServlet {
	public String home(HttpServletRequest request, HttpServletResponse response, Page page) {
//		List<District> ds= new DistrictDAO().list();
		List<News> ns= new NewsDAO().list(0,6);
//
//		new ParkingDAO().fill(ds);
//		request.setAttribute("ds", ds);
		request.setAttribute("ns", ns);

		return "home.jsp";
	}
	public String news(HttpServletRequest request, HttpServletResponse response, Page page) {
	    if(request.getParameter("id")!=null) {
		  int id = Integer.parseInt(request.getParameter("id"));
		  List<News> ns= new NewsDAO().list();
		  News n = newsDAO.get(id);

		  request.setAttribute("ns", ns);
		  request.setAttribute("nn", n);
		  return "news.jsp";
	    }
	    else {
	    	 List<News> ns= new NewsDAO().list();
			  request.setAttribute("ns", ns);
			  request.setAttribute("nn", ns.get(0));
			  return "news.jsp";
	    }
	}
	
	public String register(HttpServletRequest request, HttpServletResponse response, Page page) {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String phoneNumber = request.getParameter("phoneNumber");

		name = HtmlUtils.htmlEscape(name);
		boolean exist = userDAO.isExist(name);
		if(exist) {
			request.setAttribute("msg", "用户名已经被使用,不能使用");
            return "register.jsp"; 	
		}
		System.out.println("1");

		User user = new User();
		user.setName(name);
		user.setPhoneNumber(phoneNumber);
		user.setPassword(password);
		System.out.println("2");

		userDAO.add(user);
		System.out.println("3");
		return "login.jsp";
	}
	public String checkRegister(HttpServletRequest request, HttpServletResponse response, Page page) {
		System.out.println("in checkregister");

		String name = request.getParameter("name");
		name = HtmlUtils.htmlEscape(name);
		boolean exist = userDAO.isExist(name);
		if(exist) {
            return "%fail"; 	
		}
		return "%success";
	}
	
	
	public String login(HttpServletRequest request, HttpServletResponse response, Page page) {
	        String name = request.getParameter("name");
	        name = HtmlUtils.htmlEscape(name);
	        String password = request.getParameter("password");    
	        User user = userDAO.get(name, password);
	        if(user==null) {
	        	request.setAttribute("msg", "账号密码错误");
	            return "login.jsp"; 	
	        }
        	request.setAttribute("msg", "");

			request.getSession().setAttribute("user", user);
			return "@forehome";
	}  
	public String logout(HttpServletRequest request, HttpServletResponse response, Page page) {
		request.getSession().removeAttribute("user");
		return "@forehome";
    }  
	public String adminlogin(HttpServletRequest request, HttpServletResponse response, Page page) {
        String name = request.getParameter("name");
        name = HtmlUtils.htmlEscape(name);
        String password = request.getParameter("password");    
        Admin admin = adminDAO.get(name, password);
        if(admin==null) {
        	request.setAttribute("msg", "账号密码错误");
            return "adminLogin.jsp"; 	
        }
		request.getSession().setAttribute("admin", admin);
		return "@admin_district_list";
}  
	public String district(HttpServletRequest request, HttpServletResponse response, Page page) {
     
	    List<District> ds = districtDAO.list(page.getStart(),page.getCount());
		  int total = districtDAO.getTotal();
			page.setTotal(total);
			request.setAttribute("page", page);
	    request.setAttribute("ds", ds);
	    return "district.jsp";   
	} 
	public String parkinglist(HttpServletRequest request, HttpServletResponse response, Page page) {
	    int did = Integer.parseInt(request.getParameter("did"));
	    District d = districtDAO.get(did);
        parkingDAO.fill(d);
	    List<Parking> ps = parkingDAO.list(did, page.getStart(), page.getCount());
        parkingDAO.setSaleAndReviewNumber(ps);;

	    for (Parking p : ps) {
            parkingDAO.setFirstParkingImage(p);
        }
	    
	    String sort = request.getParameter("sort");
	    if(null!=sort){
	    switch(sort){
	        case "review":
	            Collections.sort(ps,new ParkingReviewComparator());
	            break;
	       
	        case "seat" :
	            Collections.sort(ps,new ParkingSeatComparator());
	            break;
	             
	        case "price":
	            Collections.sort(ps,new ParkingPriceComparator());
	            break;
	             
	        case "all":
	            Collections.sort(ps,new ParkingAllComparator());
	            break;
	        }
	    }
        int total = parkingDAO.getTotal(did);
		page.setTotal(total);
		page.setParam("&did="+did);
		request.setAttribute("page", page);
	    request.setAttribute("ps", ps);
	    request.setAttribute("d", d);

	    return "parkingsInDistrict.jsp";   
	} 
	public String parking(HttpServletRequest request, HttpServletResponse response, Page page) {
	    Date today = new Date();
		int pid = Integer.parseInt(request.getParameter("pid"));
	    Parking p = parkingDAO.get(pid);
	     
	    List<ParkingImage> parkingSingleImages = parkingImageDAO.list(p, ParkingImageDAO.type_single);
	    List<ParkingImage> parkingDetailImages = parkingImageDAO.list(p, ParkingImageDAO.type_detail);
	    p.setParkingSingleImages(parkingSingleImages);
	    p.setParkingDetailImages(parkingDetailImages);
	     	 
	    List<Message> messages = messageDAO.list(pid,page.getStart(),page.getCount());
	    List<TimeSlot> tss = timeSlotDAO.list(new java.sql.Date(today.getTime()),pid,page.getStart(),page.getCount());
	    messageDAO.fill(p);
	    timeSlotDAO.fill(p);
	    parkingDAO.setSaleAndReviewNumber(p);

		int total = messageDAO.getTotal(pid);
		page.setTotal(total);
		page.setParam("&pid="+pid);
		request.setAttribute("page", page);
	    request.setAttribute("ms", messages);
	    request.setAttribute("tss", tss);
	    request.setAttribute("p", p);
	    return "parking.jsp";   
	 
	} 
	public String parkingSearch(HttpServletRequest request, HttpServletResponse response, Page page){
	    String keyword = request.getParameter("keyword");

	    List<Parking> ps= new ParkingDAO().searchByName(keyword,0,20);
	    parkingDAO.setSaleAndReviewNumber(ps);
		int total = ps.size();
		page.setTotal(total);
		request.setAttribute("page", page);
	    request.setAttribute("ps",ps);
	    return "parkingsInDistrict.jsp";
	}  
	public String loginAjax(HttpServletRequest request, HttpServletResponse response, Page page) {
        String name = request.getParameter("name");
        String password = request.getParameter("password");    
        User user = userDAO.get(name, password);
        if(user==null) 
        return "%fail";
		request.getSession().setAttribute("user", user);
		return "%success";
    }  
	
	public String checkLogin(HttpServletRequest request, HttpServletResponse response, Page page) { 
        User user = (User) request.getSession().getAttribute("user");
        if(user != null)
		return "%success";
        return "%fail";
    }
	/*
	public String search(HttpServletRequest request, HttpServletResponse response, Page page){
        String keyword = request.getParameter("keyword");
        List<Product> ps= new ProductDAO().search(keyword,0,20);
        productDAO.setSaleAndReviewNumber(ps);
        request.setAttribute("ps", ps);
	    return "searchResult.jsp";

	}  
	*/
	public String pay(HttpServletRequest request, HttpServletResponse response, Page page) {
		int bid = Integer.parseInt(request.getParameter("bid"));
		Booking b = bookingDAO.get(bid);
		request.setAttribute("b", b);

		return "pay.jsp";
	}
	public String createBooking(HttpServletRequest request, HttpServletResponse response, Page page) {
	    User user =(User) request.getSession().getAttribute("user");

	    if(user == null) return "login.jsp";
		int tid = Integer.parseInt(request.getParameter("tid"));
		TimeSlot timeSlot = timeSlotDAO.get(tid);
		Parking parking = timeSlot.getParking();

	
	    Booking booking = new Booking();
	    booking.setCreateDate(new Date());
	    booking.setState(BookingDAO.waitPay);
	    booking.setUser(user);
	    booking.setParking(parking);
	    booking.setTimeSlot(timeSlot);
	    bookingDAO.add(booking);
	    return "@forepay?bid="+booking.getId() +"&total="+booking.getParking().getPrice();
	 }
	
	 public String payed(HttpServletRequest request, HttpServletResponse response, Page page){
		 int bid = Integer.parseInt(request.getParameter("bid"));		
		    Booking b = bookingDAO.get(bid);
			TimeSlot t = b.getTimeSlot();
			int seat = t.getSeat()-1;
			System.out.println(seat);
			System.out.println(t.getId());

			t.setSeat(seat);
			new TimeSlotDAO().update(t);
			System.out.println(t.getSeat());

		    b.setState(BookingDAO.waitTime);
		    b.setPayDate(new Date());
		    new BookingDAO().update(b);
		    return "@forebought";    
     }
	 @SuppressWarnings("deprecation")
	public String bought(HttpServletRequest request, HttpServletResponse response, Page page) {
		    User user =(User) request.getSession().getAttribute("user");
		    if(user == null) return "login.jsp";
		    Date today = new Date();
		    List<Booking> bs= bookingDAO.list(user.getId(),BookingDAO.delete,page.getStart(),page.getCount());
		    for(Booking b : bs) {
		    	if(b.getState().equals(BookingDAO.waitTime)) {
		    		if(today.getHours()>=b.getTimeSlot().getBeginTime()+1)
		    		b.setState(BookingDAO.finish);
		    		else if(today.getHours()==b.getTimeSlot().getBeginTime())
			    		b.setState(BookingDAO.waitArrive);
		    	}
		    	else if(b.getState().equals(BookingDAO.waitPay)) {
		    		if(today.getHours()>=b.getTimeSlot().getBeginTime()+1)
		    		b.setState(BookingDAO.finish);
		    	}
		    	else if(b.getState().equals(BookingDAO.waitFinish)) {
		    		if(today.getHours()>=b.getTimeSlot().getBeginTime()+1)
		    		b.setState(BookingDAO.waitReview);
		    	}
		    	else if(b.getState().equals(BookingDAO.waitArrive)) {
		    		if(today.getHours()>=b.getTimeSlot().getBeginTime()+1)
		    		b.setState(BookingDAO.finish);
		    	}

		    }
		     int total = bookingDAO.getTotal(user.getId(),BookingDAO.delete);
				page.setTotal(total);
				request.setAttribute("page", page);
		    request.setAttribute("bs", bs);

		    return "bought.jsp";       
	 }
	
	
	 public String bookingArrive(HttpServletRequest request, HttpServletResponse response, Page page) {
		 int bid = Integer.parseInt(request.getParameter("bid"));
		    Booking b = bookingDAO.get(bid);
		    b.setState(BookingDAO.waitFinish);
		    b.setArriveDate(new Date());
		    bookingDAO.update(b);
		    return "%success";
	 }
	 public String deleteBooking(HttpServletRequest request, HttpServletResponse response, Page page){
		    int bid = Integer.parseInt(request.getParameter("bid"));
		    Booking b = bookingDAO.get(bid);
		    b.setState(BookingDAO.delete);
		    bookingDAO.update(b);
		    return "%success";     
	 }
	 
	 public String review(HttpServletRequest request, HttpServletResponse response, Page page) {
		    int bid = Integer.parseInt(request.getParameter("bid"));
		    Booking b = bookingDAO.get(bid);
		    Parking p = b.getParking();
		    List<Message> ms = messageDAO.list(p.getId(),page.getStart(),page.getCount());
		    parkingDAO.setSaleAndReviewNumber(p);
		   
			  int total = messageDAO.getTotal(p.getId());
				page.setTotal(total);
				page.setParam("bid="+bid+"&showonly=true");
				request.setAttribute("page", page);
		    request.setAttribute("p", p);
		    request.setAttribute("b", b);
		    request.setAttribute("ms", ms);
		    return "review.jsp";       
	 }	 
	 public String user(HttpServletRequest request, HttpServletResponse response, Page page) {
		    User user =(User) request.getSession().getAttribute("user");
		  
		    request.setAttribute("user", user);
		    return "user.jsp";       
	 }
	 public String changeInfo(HttpServletRequest request, HttpServletResponse response, Page page) {
		    int id = Integer.parseInt(request.getParameter("id"));
		    String name = request.getParameter("name");
		    String phoneNumber = request.getParameter("phoneNumber");
		    User user =  userDAO.get(id);
		    user.setName(name);
		    user.setPhoneNumber(phoneNumber);
		    userDAO.update(user);
		    request.setAttribute("user", user);
		    return "user.jsp";       
	 }	
	 public String password(HttpServletRequest request, HttpServletResponse response, Page page) {
		    User user =(User) request.getSession().getAttribute("user");
			    request.setAttribute("user", user);

		    return "userPassword.jsp"; 
	 }
	 public String changePassword(HttpServletRequest request, HttpServletResponse response, Page page) {
		    int id = Integer.parseInt(request.getParameter("id"));
		    User user =  userDAO.get(id);

		    String name = user.getName();
		    String originalPassword = request.getParameter("originalPassword");
		    String newPassword = request.getParameter("newPassword");
		    if(userDAO.get(name, originalPassword)==null) {
		    	request.setAttribute("msg", "密码错误"); 
		    }
		    else if(newPassword!="") {
			    user.setPassword(newPassword);
			    userDAO.update(user);
		    	request.setAttribute("msg", "修改密码成功");
			    request.setAttribute("user", user);
		    }     
		    else
	    	request.setAttribute("msg", "请输入新密码"); 

		    return "userPassword.jsp"; 
	 }

	  public String doreview(HttpServletRequest request, HttpServletResponse response, Page page) {
		    int bid = Integer.parseInt(request.getParameter("bid"));
		    Booking b = bookingDAO.get(bid);
		    b.setState(BookingDAO.finish);
		    bookingDAO.update(b);
		    
		    Parking p = b.getParking();
		    String content = request.getParameter("content");
		    content = HtmlUtils.htmlEscape(content);
		 
		    User user =(User) request.getSession().getAttribute("user");
		    Message message = new Message();
		    message.setContent(content);
		    message.setParking(p);
		    message.setCreateDate(new Date());
		    message.setUser(user);
		    messageDAO.add(message);
		     
		    return "@forereview?bid="+bid+"&showonly=true";    
	 }
}
