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
import carparking.util.DBUtil;
import carparking.util.DateUtil;
 
public class BookingDAO {
	public static final String waitPay = "waitPay";
	public static final String waitTime = "waitTime";
	public static final String waitArrive = "waitArrive";
	public static final String waitFinish = "waitFinish";
	public static final String waitReview = "waitReview";

	public static final String finish = "finish";
	public static final String delete = "delete";
	
	public int getTotal() {
        int total = 0;
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "select count(*) from Booking";
 
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return total;
    }
	public int getTotal(int uid) {
        int total = 0;
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "select count(*) from Booking where uid = "+uid;
 
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return total;
    }
 
    public void add(Booking bean) {

System.out.println("in bookingdao:add");
        String sql = "insert into Booking values(null,?,?,?,?,?,?,?)";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
 
            ps.setInt(1, bean.getUser().getId());
            ps.setInt(2, bean.getParking().getId());  
            ps.setTimestamp(3,  DateUtil.d2t(bean.getCreateDate()));
            ps.setString(4, bean.getState());
            ps.setTimestamp(5,  DateUtil.d2t(bean.getPayDate()));
            ps.setTimestamp(6,  DateUtil.d2t(bean.getArriveDate()));
            ps.setInt(7, bean.getTimeSlot().getId());

            ps.execute();
            System.out.println("fnish bookingdao:add");

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                int id = rs.getInt(1);
                bean.setId(id);
            }
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
    }
 
    public void update(Booking bean) {

    	
        String sql = "update Booking set uid=?, pid=?, createDate=?, state=?, payDate=?, arriveDate=?,tid=?  where id = ?";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
 
            ps.setInt(1, bean.getUser().getId());
            ps.setInt(2, bean.getParking().getId());
            ps.setTimestamp(3, DateUtil.d2t(bean.getCreateDate()));;
            ps.setString(4, bean.getState());
            ps.setTimestamp(5, DateUtil.d2t(bean.getPayDate()));;
            ps.setTimestamp(6, DateUtil.d2t(bean.getArriveDate()));;
            ps.setInt(7, bean.getTimeSlot().getId());
            ps.setInt(8, bean.getId());
            ps.execute();
 
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
 
    }
 
    public void delete(int id) {
 
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "delete from Booking where id = " + id;
 
            s.execute(sql);
 
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
    }
 
    public Booking get(int id) {
    	Booking bean = new Booking();
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "select * from Booking where id = " + id;
 
            ResultSet rs = s.executeQuery(sql);
 
            if (rs.next()) {

                String state = rs.getString("state");
                Date createDate = DateUtil.t2d( rs.getTimestamp("createDate"));
                Date payDate = DateUtil.t2d( rs.getTimestamp("payDate"));
                Date arriveDate = DateUtil.t2d( rs.getTimestamp("arriveDate"));    
                int uid =rs.getInt("uid");                
                User user = new UserDAO().get(uid);
                int pid =rs.getInt("pid");                
                Parking parking = new ParkingDAO().get(pid);
                int tid =rs.getInt("tid");                
                TimeSlot timeSlot = new TimeSlotDAO().get(tid);
                bean.setUser(user);
                bean.setParking(parking);
                bean.setState(state);
                bean.setCreateDate(createDate);
                bean.setPayDate(payDate);
                bean.setArriveDate(arriveDate);
                bean.setTimeSlot(timeSlot);
                bean.setId(id);
            	
                bean.setId(id);
            }
 
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return bean;
    }
 
    public List<Booking> list() {
        return list(0, Short.MAX_VALUE);
    }
    public List<Booking> list(int start, int count) {
        List<Booking> beans = new ArrayList<Booking>();
 
        String sql = "select * from Booking order by id desc limit ?,? ";
 
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
 
            ps.setInt(1, start);
            ps.setInt(2, count);
 
            ResultSet rs = ps.executeQuery();
 
            while (rs.next()) {
            	Booking bean = new Booking();
                int id = rs.getInt("id");

                String state = rs.getString("state");
                Date createDate = DateUtil.t2d( rs.getTimestamp("createDate"));
                Date payDate = DateUtil.t2d( rs.getTimestamp("payDate"));
                Date arriveDate = DateUtil.t2d( rs.getTimestamp("arriveDate"));    
                int uid =rs.getInt("uid");                
                User user = new UserDAO().get(uid);
                int pid =rs.getInt("pid");                
                Parking parking = new ParkingDAO().get(pid);
                int tid =rs.getInt("tid");                
                TimeSlot timeSlot = new TimeSlotDAO().get(tid);
                bean.setUser(user);
                bean.setParking(parking);
                bean.setState(state);
                bean.setCreateDate(createDate);
                bean.setPayDate(payDate);
                bean.setArriveDate(arriveDate);
                bean.setTimeSlot(timeSlot);
                bean.setId(id);
                beans.add(bean);

            }
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return beans;
    }
    
    public List<Booking> list(int uid,String excludedStatus) {
        return list(uid,excludedStatus,0, Short.MAX_VALUE);
    }
     
    public List<Booking> list(int uid, String excludedStatus, int start, int count) {
    	List<Booking> beans = new ArrayList<Booking>();
    	
    	String sql = "select * from Booking where uid = ? and state != ? order by id desc limit ?,? ";
    	
    	try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
    		
    		ps.setInt(1, uid);
    		ps.setString(2, excludedStatus);
    		ps.setInt(3, start);
    		ps.setInt(4, count);
    		
    		ResultSet rs = ps.executeQuery();
    		
    		while (rs.next()) {
    			Booking bean = new Booking();
                int id = rs.getInt("id");

                String state = rs.getString("state");
                Date createDate = DateUtil.t2d( rs.getTimestamp("createDate"));
                Date payDate = DateUtil.t2d( rs.getTimestamp("payDate"));
                Date arriveDate = DateUtil.t2d( rs.getTimestamp("arriveDate"));    
                User user = new UserDAO().get(uid);
                int pid =rs.getInt("pid");                
                Parking parking = new ParkingDAO().get(pid);
                int tid =rs.getInt("tid");                
                TimeSlot timeSlot = new TimeSlotDAO().get(tid);
                bean.setUser(user);
                bean.setParking(parking);
                bean.setState(state);
                bean.setCreateDate(createDate);
                bean.setPayDate(payDate);
                bean.setArriveDate(arriveDate);
                bean.setTimeSlot(timeSlot);
                bean.setId(id);
    			beans.add(bean);
    		}
    	} catch (SQLException e) {
    		
    		e.printStackTrace();
    	}
    	return beans;
    }
 
}