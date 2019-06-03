package carparking.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import carparking.bean.Parking;
import carparking.bean.ParkingImage;
import carparking.util.DBUtil;

public class ParkingImageDAO {
 
	public static final String type_single = "type_single";
	public static final String type_detail = "type_detail";

	
    public int getTotal() {
        int total = 0;
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "select count(*) from ParkingImage";
 
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return total;
    }
 
    public void add(ParkingImage bean) {

        String sql = "insert into ParkingImage values(null,?,?)";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
            ps.setInt(1, bean.getParking().getId());
            ps.setString(2, bean.getType());
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
 
    public void update(ParkingImage bean) {
    	 
    }
 
    public void delete(int id) {
 
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "delete from ParkingImage where id = " + id;
 
            s.execute(sql);
 
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
    }
 
    public ParkingImage get(int id) {
    	ParkingImage bean = new ParkingImage();
        
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "select * from ParkingImage where id = " + id;
 
            ResultSet rs = s.executeQuery(sql);
 
            if (rs.next()) {
                int pid = rs.getInt("pid");
                String type = rs.getString("type");
                bean.setType(type);
                Parking Parking = new ParkingDAO().get(pid);
                bean.setParking(Parking);
                bean.setId(id);
            }
 
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return bean;
    }

    public List<ParkingImage> list(Parking p,String type) {
        return list(p ,type,0, Short.MAX_VALUE);
    }
 
    public List<ParkingImage> list(Parking p,String type, int start, int count) {
        List<ParkingImage> beans = new ArrayList<ParkingImage>();
 
        String sql = "select * from ParkingImage where pid =? and type =? order by id desc limit ?,? ";
 
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
 
        	 ps.setInt(1, p.getId());
             ps.setString(2, type);
             ps.setInt(3, start);
             ps.setInt(4, count);
            ResultSet rs = ps.executeQuery();
 
            while (rs.next()) {

            	ParkingImage bean = new ParkingImage();
                int id = rs.getInt(1);

                bean.setParking(p);
                bean.setType(type);
                bean.setId(id);
                  
                beans.add(bean);
            }
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return beans;
    }
 
}