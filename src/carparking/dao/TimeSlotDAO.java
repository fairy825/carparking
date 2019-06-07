package carparking.dao;


import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import carparking.bean.*;
import carparking.dao.ParkingDAO;
import carparking.util.DBUtil;
import carparking.util.DateUtil;
 
public class TimeSlotDAO {
 
    public int getTotal() {
        int total = 0;
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "select count(*) from TimeSlot";
 
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return total;
    }
    public int getTotal(Date bookingDate, int pid) {

        int total = 0;
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "select count(*) from TimeSlot where bookingDate = '"+bookingDate+"' and pid = "+pid;
        	

            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return total;
    }
    public void add(TimeSlot bean) {
 
        String sql = "insert into TimeSlot values(null,?,?,?,?)";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
            ps.setInt(1,  bean.getBeginTime());
            ps.setTimestamp(2,  DateUtil.d2t(bean.getBookingDate()));
            ps.setInt(3,  bean.getSeat());
            ps.setInt(4,  bean.getParking().getId());

            ps.execute();
 
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                int id = rs.getInt(1);
                bean.setId(id);
            }
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
    }
 
    public void update(TimeSlot bean) {
    	  String sql = "update TimeSlot set beginTime= ?, bookingDate=?, seat=? where id = ?";
          try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
   
          	 ps.setInt(1, bean.getBeginTime());
             ps.setTimestamp(2,  DateUtil.d2t(bean.getBookingDate()));
          	 ps.setInt(3, bean.getSeat());
             ps.setInt(4, bean.getId());

              ps.execute();
   
          } catch (SQLException e) {
   
              e.printStackTrace();
          }
    }
 
    public void delete(int id) {
 
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "delete from TimeSlot where id = " + id;
 
            s.execute(sql);
 
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
    }
    
//    public List<TimeSlot> listByUser(int uid) {
//        return listByUser(uid, 0, Short.MAX_VALUE);
//    }
 
//    public List<TimeSlot> listByUser(int uid, int start, int count) {
//        List<TimeSlot> beans = new ArrayList<TimeSlot>();
// 
//        String sql = "select * from TimeSlot where uid = ? order by id desc limit ?,? ";
// 
//        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
// 
//            ps.setInt(1, uid);
//            ps.setInt(2, start);
//            ps.setInt(3, count);
// 
//            ResultSet rs = ps.executeQuery();
// 
//            while (rs.next()) {
//            	TimeSlot bean = new TimeSlot();
//                int id = rs.getInt(1);
//
//                float beginTime = rs.getFloat("beginTime");
//                bean.setStartTime(beginTime);
//                Date bookingDate = DateUtil.t2d( rs.getTimestamp("bookingDate"));
//                bean.setBookingDate(bookingDate);    
//                int bid = rs.getInt("bid");              
//                Booking booking = new BookingDAO().get(bid);
//                bean.setBooking(booking);      
//
//                User user = new UserDAO().get(uid);
//                bean.setUser(user);
//                bean.setId(id);                
//                beans.add(bean);
//            }
//        } catch (SQLException e) {
// 
//            e.printStackTrace();
//        }
//        return beans;
//    }
//    public List<TimeSlot> listByBooking(int bid) {
//    	return listByBooking(bid, 0, Short.MAX_VALUE);
//    }
//    
//    public List<TimeSlot> listByBooking(int bid, int start, int count) {
//    	List<TimeSlot> beans = new ArrayList<TimeSlot>();
//    	
//    	String sql = "select * from TimeSlot where bid = ? order by id desc limit ?,? ";
//    	
//    	try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
//    		
//    		ps.setInt(1, bid);
//    		ps.setInt(2, start);
//    		ps.setInt(3, count);
//    		
//    		ResultSet rs = ps.executeQuery();
//    		
//    		while (rs.next()) {
//    			TimeSlot bean = new TimeSlot();
//                int id = rs.getInt(1);
//
//                float beginTime = rs.getFloat("beginTime");
//                bean.setStartTime(beginTime);
//                Date bookingDate = DateUtil.t2d( rs.getTimestamp("bookingDate"));
//                bean.setBookingDate(bookingDate);    
//                Booking booking = new BookingDAO().get(bid);
//                bean.setBooking(booking);      
//                int uid = rs.getInt("uid");              
//                User user = new UserDAO().get(uid);
//                bean.setUser(user);
//                bean.setId(id);                
//                beans.add(bean);
//    		}
//    	} catch (SQLException e) {
//    		
//    		e.printStackTrace();
//    	}
//    	return beans;
//    }
    public List<TimeSlot> listByParking(int pid) {
    	return listByParking(pid, 0, Short.MAX_VALUE);
    }
    public List<TimeSlot> listByParking(int pid, int start, int count) {
    	List<TimeSlot> beans = new ArrayList<TimeSlot>();
    	
    	String sql = "select * from TimeSlot where pid = ? order by id limit ?,? ";
    	
    	try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
    		
    		ps.setInt(1, pid);
    		ps.setInt(2, start);
    		ps.setInt(3, count);
    		
    		ResultSet rs = ps.executeQuery();
    		
    		while (rs.next()) {
    			TimeSlot bean = new TimeSlot();
                int id = rs.getInt(1);

                int seat = rs.getInt("seat");
                int beginTime = rs.getInt("beginTime");
                bean.setBeginTime(beginTime);
                Date bookingDate = DateUtil.t2d( rs.getTimestamp("bookingDate"));
                bean.setBookingDate(bookingDate);    
                Parking parking = new ParkingDAO().get(pid);
                bean.setParking(parking);   
                bean.setSeat(seat);   
                bean.setId(id);                
                beans.add(bean);
    		}
    	} catch (SQLException e) {
    		
    		e.printStackTrace();
    	}
    	return beans;
    }
    
//    public void fill(List<Booking> bs) {
//		for (Booking b : bs) {
//			List<TimeSlot> tss=listByBooking(b.getId());
//			
//		}	
//	}

//	public void fill(Booking b) {
//		List<TimeSlot> tss=listByBooking(b.getId());
//
//		b.setTimeSlots(tss);
//	}
    public void fill(List<Parking> ps) {
        for (Parking p : ps) 
            fill(p);
    }
    public void fill(Parking p) {
    	List<TimeSlot> tss=listByParking(p.getId());
        p.setTimeSlots(tss);
    }
    public TimeSlot get(int id) {
    	TimeSlot bean = null;
 
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "select * from TimeSlot where id = " + id;
 
            ResultSet rs = s.executeQuery(sql);
 
            if (rs.next()) {
            	bean = new TimeSlot();
            	 Date bookingDate = DateUtil.t2d( rs.getTimestamp("bookingDate"));
            	 int seat = rs.getInt("seat");
                 int pid = rs.getInt("pid");
                 Parking parking = new ParkingDAO().get(pid);
                 int beginTime = rs.getInt("beginTime");
                 bean.setBeginTime(beginTime);
                 bean.setBookingDate(bookingDate);    
                 bean.setParking(parking);
                 bean.setSeat(seat);
                 bean.setId(id);
                 
            }
 
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return bean;
    }
    public boolean isExist(Date bookingDate) {
    	int total = 0;
    	 try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
    		 
             String sql = "select count(*) from TimeSlot where bookingDate = '"+bookingDate;
  
             ResultSet rs = s.executeQuery(sql);
             while (rs.next()) {
                 total = rs.getInt(1);
             }
         } catch (SQLException e) {
  
             e.printStackTrace();
         }
		return total!=0;

	}

    public List<TimeSlot> list() {
        return list(0, Short.MAX_VALUE);
    }
 
    public List<TimeSlot> list(int start, int count) {
        List<TimeSlot> beans = new ArrayList<TimeSlot>();
 
        String sql = "select * from TimeSlot order by id desc limit ?,? ";
 
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
 
            ps.setInt(1, start);
            ps.setInt(2, count);
 
            ResultSet rs = ps.executeQuery();
 
            while (rs.next()) {
            	TimeSlot bean = new TimeSlot();
                int id = rs.getInt(1);
                int pid = rs.getInt("pid");
                Parking parking = new ParkingDAO().get(pid);
                int beginTime = rs.getInt("beginTime");
                int seat = rs.getInt("seat");
                Date bookingDate = DateUtil.t2d( rs.getTimestamp("bookingDate"));
                bean.setBeginTime(beginTime);
                bean.setBookingDate(bookingDate);
                bean.setSeat(seat);
                bean.setParking(parking);
                bean.setId(id);
                beans.add(bean);
            	
                bean.setId(id);
                beans.add(bean);
            }
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return beans;
    }
    public List<TimeSlot> list(Date bookingDate, int pid, int start, int count) {
        List<TimeSlot> beans = new ArrayList<TimeSlot>();
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
            Date today = new java.sql.Date(bookingDate.getTime());
            String sql = "select * from TimeSlot where bookingDate = '"+today+"' and pid = "+pid+" limit "+start+","+count;        	
    
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
         
            	TimeSlot bean = new TimeSlot();
                int id = rs.getInt(1);
                Parking parking = new ParkingDAO().get(pid);
                int beginTime = rs.getInt("beginTime");
                int seat = rs.getInt("seat");
                bean.setBeginTime(beginTime);
                bean.setBookingDate(bookingDate);
                bean.setSeat(seat);
                bean.setParking(parking);
                bean.setId(id);
                beans.add(bean);

            }
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return beans;
    }
 
}