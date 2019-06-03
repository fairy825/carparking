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
 
public class MessageDAO {
	 public int getTotal() {
	        int total = 0;
	        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
	 
	            String sql = "select count(*) from Message";
	 
	            ResultSet rs = s.executeQuery(sql);
	            while (rs.next()) {
	                total = rs.getInt(1);
	            }
	        } catch (SQLException e) {
	 
	            e.printStackTrace();
	        }
	        return total;
	    }
    public int getTotal(int pid) {
        int total = 0;
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "select count(*) from Message where pid = " + pid;
 
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return total;
    }
 
    public void add(Message bean) {
 
        String sql = "insert into Message values(null,?,?,?,?)";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
 
            ps.setString(1, bean.getContent());
            ps.setInt(2, bean.getUser().getId());
            ps.setInt(3, bean.getParking().getId());
            ps.setTimestamp(4,  DateUtil.d2t(bean.getCreateDate()));
 
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
 
    public void update(Message bean) {
 
        String sql = "update Message set content=?, uid=?,pid=?, createDate=? where id = ?";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
        	 ps.setString(1, bean.getContent());
             ps.setInt(2, bean.getUser().getId());
             ps.setInt(3, bean.getParking().getId());
             ps.setTimestamp(4,  DateUtil.d2t(bean.getCreateDate()));
             ps.setInt(5, bean.getId());

            ps.execute();
 
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
 
    }
 
    public void delete(int id) {
 
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "delete from Message where id = " + id;
 
            s.execute(sql);
 
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
    }
 
    public Message get(int id) {
    	Message bean = null;
 
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "select * from Message where id = " + id;
 
            ResultSet rs = s.executeQuery(sql);
 
            if (rs.next()) {
                bean = new Message();
                String content = rs.getString("content");
                int uid = rs.getInt("uid");
                User user = new UserDAO().get(uid);
                int pid = rs.getInt("pid");
                Parking parking = new ParkingDAO().get(pid);
                Date createDate = DateUtil.t2d( rs.getTimestamp("createDate"));

                bean.setContent(content);
                bean.setUser(user);
                bean.setParking(parking);

                bean.setCreateDate(createDate);
     
                bean.setId(id);
            }
 
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return bean;
    }
 
    public List<Message> list() {
        return list(0, Short.MAX_VALUE);
    }
 
    public List<Message> list(int start, int count) {
        List<Message> beans = new ArrayList<Message>();
 
        String sql = "select * from Message order by id desc limit ?,? ";
 
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
 
            ps.setInt(1, start);
            ps.setInt(2, count);
 
            ResultSet rs = ps.executeQuery();
 
            while (rs.next()) {
            	Message bean = new Message();
                int id = rs.getInt(1);
                String content = rs.getString("content");
                int uid = rs.getInt("uid");
                User user = new UserDAO().get(uid);
                int pid = rs.getInt("pid");
                Parking parking = new ParkingDAO().get(pid);
                Date createDate = DateUtil.t2d( rs.getTimestamp("createDate"));

                bean.setContent(content);
                bean.setUser(user);
                bean.setParking(parking);
                bean.setCreateDate(createDate);
                bean.setId(id);

                beans.add(bean);
            }
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return beans;
    }
 
    public List<Message> list(int pid) {
        return list(pid,0, Short.MAX_VALUE);
    }
  
    public List<Message> list(int pid, int start, int count) {
        List<Message> beans = new ArrayList<Message>();
        Parking parking = new ParkingDAO().get(pid);
        String sql = "select * from Message where pid = ? order by id desc limit ?,? ";
  
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
            ps.setInt(1, pid);
            ps.setInt(2, start);
            ps.setInt(3, count);
  
            ResultSet rs = ps.executeQuery();
  
            while (rs.next()) {
            	Message bean = new Message();
                int id = rs.getInt(1);
                String content = rs.getString("content");
                int uid = rs.getInt("uid");
                User user = new UserDAO().get(uid);
                Date createDate = DateUtil.t2d( rs.getTimestamp("createDate"));

                bean.setContent(content);
                bean.setUser(user);
                bean.setParking(parking);
                bean.setCreateDate(createDate);
                bean.setId(id);

                beans.add(bean);
            }
        } catch (SQLException e) {
  
            e.printStackTrace();
        }
        return beans;
    }
    public void fill(List<Parking> ps) {
        for (Parking p : ps) 
            fill(p);
    }
    public void fill(Parking p) {
            List<Message> ms = this.list(p.getId());
            p.setMessages(ms);
    }
 
}