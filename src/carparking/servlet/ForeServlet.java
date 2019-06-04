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
		List<District> ds= new DistrictDAO().list();
		List<News> ns= new NewsDAO().list(0,6);

		new ParkingDAO().fill(ds);
		request.setAttribute("ds", ds);
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
	    int pid = Integer.parseInt(request.getParameter("pid"));
	    Parking p = parkingDAO.get(pid);
	     
	    List<ParkingImage> parkingSingleImages = parkingImageDAO.list(p, ParkingImageDAO.type_single);
	    List<ParkingImage> parkingDetailImages = parkingImageDAO.list(p, ParkingImageDAO.type_detail);
	    p.setParkingSingleImages(parkingSingleImages);
	    p.setParkingDetailImages(parkingDetailImages);
	     	 
	    List<Message> messages = messageDAO.list(p.getId(),page.getStart(),page.getCount());
	    messageDAO.fill(p);
	    timeSlotDAO.fill(p);
	    System.out.println("beforeset");
	    parkingDAO.setSaleAndReviewNumber(p);
	    System.out.println("afterset");

		  int total = messageDAO.getTotal(pid);
			page.setTotal(total);
			page.setParam("&pid="+pid);
			request.setAttribute("page", page);
	    request.setAttribute("ms", messages);
	    request.setAttribute("p", p);
	    return "parking.jsp";   
	 
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
		    	System.out.println("in bought");
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
		     int total = bookingDAO.getTotal(user.getId());
				page.setTotal(total);
				request.setAttribute("page", page);
		    request.setAttribute("bs", bs);

		    return "bought.jsp";       
	 }
	
	/*
	public String cart(HttpServletRequest request, HttpServletResponse response, Page page) {
	    User user =(User) request.getSession().getAttribute("user");
	    List <OrderItem> ois = orderItemDAO.listByUser(user.getId());
	    request.setAttribute("ois", ois);
	    return "cart.jsp";
	}
	public String addCart(HttpServletRequest request, HttpServletResponse response, Page page) {
	    int pid = Integer.parseInt(request.getParameter("pid"));
	    int num = Integer.parseInt(request.getParameter("num"));
	    Product p = productDAO.get(pid);
	     
	    User user =(User) request.getSession().getAttribute("user");
	    boolean found = false;
	    List <OrderItem> ois = orderItemDAO.listByUser(user.getId()); 
	    for(OrderItem oi : ois) {
	    	if(pid == oi.getProduct().getId()) {
	    	  oi.setNumber(oi.getNumber()+num);
	    	  orderItemDAO.update(oi);
   	    	  found = true;
	    	  break;
	    	}
	    }
	    
	    if(!found) {
	        OrderItem oi = new OrderItem();
	        oi.setUser(user);
	        oi.setNumber(num);
	        oi.setProduct(p);
	        orderItemDAO.add(oi);
	    }
	    return "%success";
	}
	public String changeOrderItem(HttpServletRequest request, HttpServletResponse response, Page page) {
	    User user =(User) request.getSession().getAttribute("user");
	    if(user == null) return "%fail";
	    int pid = Integer.parseInt(request.getParameter("pid"));
	    int num = Integer.parseInt(request.getParameter("num"));
	    List <OrderItem> ois = orderItemDAO.listByUser(user.getId()); 
	    for(OrderItem oi : ois) {
	    	if(pid == oi.getProduct().getId()) {
	    	  oi.setNumber(num);
	    	  orderItemDAO.update(oi);
	    	  break;
	    	}
	    }
	    return "%success";
	}
	
	public String deleteOrderItem(HttpServletRequest request, HttpServletResponse response, Page page) {
	    User user =(User) request.getSession().getAttribute("user");
	    if(user == null) return "%fail";
	    int oiid = Integer.parseInt(request.getParameter("oiid"));
	    orderItemDAO.delete(oiid);
	    return "%success";
	}
	public String category(HttpServletRequest request, HttpServletResponse response, Page page) {
	    int cid = Integer.parseInt(request.getParameter("cid"));
	     
	    Category c = new CategoryDAO().get(cid);
	    new ProductDAO().fill(c);
	    new ProductDAO().setSaleAndReviewNumber(c.getProducts());      
	     
	    String sort = request.getParameter("sort");
	    if(null!=sort){
	    switch(sort){
	        case "review":
	            Collections.sort(c.getProducts(),new ProductReviewComparator());
	            break;
	        case "date" :
	            Collections.sort(c.getProducts(),new ProductDateComparator());
	            break;
	             
	        case "saleCount" :
	            Collections.sort(c.getProducts(),new ProductSaleCountComparator());
	            break;
	             
	        case "price":
	            Collections.sort(c.getProducts(),new ProductPriceComparator());
	            break;
	             
	        case "all":
	            Collections.sort(c.getProducts(),new ProductAllComparator());
	            break;
	        }
	    }
	     
	    request.setAttribute("c", c);
	    return "category.jsp";     
	}
	public String buy(HttpServletRequest request, HttpServletResponse response, Page page){
	    String[] oiids=request.getParameterValues("oiid");
	    List<OrderItem> ois = new ArrayList<>();
	    float total = 0;
	    User user =(User) request.getSession().getAttribute("user");

	    for (String strid : oiids) {
	        int oiid = Integer.parseInt(strid);
		    if(user.getId()!=oiid) {
		    	return "@forehome";
		    }
	        OrderItem oi= orderItemDAO.get(oiid);
	        total +=oi.getProduct().getPromotePrice()*oi.getNumber();
	        ois.add(oi);
	    }
	     
	    request.getSession().setAttribute("ois", ois);
	    request.setAttribute("total", total);
	    return "buy.jsp";
	}  
	public String createOrder(HttpServletRequest request, HttpServletResponse response, Page page) {
	    User user =(User) request.getSession().getAttribute("user");
	    if(user == null) return "login.jsp";
	    String address = request.getParameter("address");
	    String post = request.getParameter("post");
	    String receiver = request.getParameter("receiver");
	    String mobile = request.getParameter("mobile");
	    String userMessage = request.getParameter("userMessage");
	    Order order = new Order();
	    String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) +RandomUtils.nextInt(10000);
	    order.setOrderCode(orderCode);
	    order.setAddress(address);
	    order.setPost(post);
	    order.setReceiver(receiver);
	    order.setMobile(mobile);
	    order.setUserMessage(userMessage);
	    order.setCreateDate(new Date());
	    order.setStatus(OrderDAO.waitPay);
	    order.setUser(user);
	    orderDAO.add(order);
	    List <OrderItem> ois =(List <OrderItem>) request.getSession().getAttribute("ois");
	    float total = 0;
	    for(OrderItem oi : ois) {
	    	oi.setOrder(order);
	    	orderItemDAO.update(oi);
	    	total += oi.getNumber()*oi.getProduct().getPromotePrice();
	    }
	    return "@forealipay?oid="+order.getId() +"&total="+total;
	 }
	 public String payed(HttpServletRequest request, HttpServletResponse response, Page page){

		 int oid = Integer.parseInt(request.getParameter("oid"));		
		 Order o= orderDAO.get(oid);
		    o.setStatus(OrderDAO.waitDelivery);
		    o.setPayDate(new Date());
		    new OrderDAO().update(o);
		    request.setAttribute("o", o);
		    return "payed.jsp";    
     }
	 public String bought(HttpServletRequest request, HttpServletResponse response, Page page) {
		    User user =(User) request.getSession().getAttribute("user");
		    if(user == null) return "login.jsp";
		    List<Order> os= orderDAO.list(user.getId(),OrderDAO.delete);
		     
		    orderItemDAO.fill(os);
		     
		    request.setAttribute("os", os);
		     
		    return "bought.jsp";       
	 }
	 public String confirmPay(HttpServletRequest request, HttpServletResponse response, Page page) {
		    int oid = Integer.parseInt(request.getParameter("oid"));
		    Order o = orderDAO.get(oid);
		    orderItemDAO.fill(o);
		    request.setAttribute("o", o);
		    return "confirmPay.jsp";       
	 }
	 */
	 public String bookingArrive(HttpServletRequest request, HttpServletResponse response, Page page) {
		 int bid = Integer.parseInt(request.getParameter("bid"));
		    Booking b = bookingDAO.get(bid);
		    b.setState(BookingDAO.waitFinish);
		    b.setArriveDate(new Date());
		    bookingDAO.update(b);
		    System.out.println("arrive");
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
		    int id = Integer.parseInt(request.getParameter("id"));
		    User user =  userDAO.get(id);
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
