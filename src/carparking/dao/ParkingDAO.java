package carparking.dao;
 
import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
 
import carparking.bean.*;

import carparking.util.DBUtil;
import carparking.util.DateUtil;
  
public class ParkingDAO {
  
    public int getTotal(int did) {
        int total = 0;
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
  
            String sql = "select count(*) from Parking where did = " + did;
  
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
  
            e.printStackTrace();
        }
        return total;
    }
  
    public void add(Parking bean) {
 
        String sql = "insert into Parking values(null,?,?,?,?,?,?,?,?,?)";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
  
            ps.setString(1, bean.getName());
            ps.setString(2, bean.getIntroduction());
            ps.setFloat(3, bean.getPrice());
            ps.setString(4, bean.getPhoneNumber());
            ps.setInt(5, bean.getTotalSeat());
            ps.setInt(6, bean.getDistrict().getId());
            ps.setString(7, bean.getLocation());
            ps.setInt(8, bean.getStartTime());
            ps.setInt(9, bean.getEndTime());
            ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                int id = rs.getInt(1);
                bean.setId(id);
                setTimeSlots(bean);
            }
        } catch (SQLException e) {
  
            e.printStackTrace();
        }
    }
  
    public void update(Parking bean) {
        String sql = "update Parking set name= ?, introduction=?, price=?, phoneNumber=?, totalSeat=?, did = ?, location=?,startTime=?,endTime=? where id = ?";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
        	  
            ps.setString(1, bean.getName());
            ps.setString(2, bean.getIntroduction());
            ps.setFloat(3, bean.getPrice());
            ps.setString(4, bean.getPhoneNumber());
            ps.setInt(5, bean.getTotalSeat());
            ps.setInt(6, bean.getDistrict().getId());
            ps.setString(7, bean.getLocation());
            ps.setInt(8, bean.getStartTime());
            ps.setInt(9, bean.getEndTime());
            ps.setInt(10, bean.getId());

            ps.execute();
  
        } catch (SQLException e) {
  
            e.printStackTrace();
        }
  
    }
  
    public void delete(int id) {
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
  
            String sql = "delete from Parking where id = " + id;
            s.execute(sql);

        } catch (SQLException e) {
  
            e.printStackTrace();
        }
    }
  
    public Parking get(int id) {
    	Parking bean = new Parking();
  
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
  
            String sql = "select * from Parking where id = " + id;
  
            ResultSet rs = s.executeQuery(sql);
  
            if (rs.next()) {
 
                String name = rs.getString("name");
                String introduction = rs.getString("introduction");
                float price = rs.getFloat("price");
                String phoneNumber = rs.getString("phoneNumber");
                int totalSeat = rs.getInt("totalSeat");
                int did = rs.getInt("did");
                String location = rs.getString("location");
               int startTime= rs.getInt("startTime");
               int endTime= rs.getInt("endTime");
                bean.setName(name);
                bean.setIntroduction(introduction);
                bean.setPrice(price);
                bean.setPhoneNumber(phoneNumber);
                bean.setTotalSeat(totalSeat);
                District district = new DistrictDAO().get(did);
                bean.setDistrict(district);
                bean.setLocation(location);
                bean.setStartTime(startTime);
                bean.setEndTime(endTime);
                bean.setId(id);
                setFirstParkingImage(bean);
            }
  
        } catch (SQLException e) {
  
            e.printStackTrace();
        }
        return bean;
    }
  
    public List<Parking> list(int did) {
        return list(did,0, Short.MAX_VALUE);
    }
  
    public List<Parking> list(int did, int start, int count) {
    	List<Parking> beans = new ArrayList<Parking>();
        District district = new DistrictDAO().get(did);
        String sql = "select * from Parking where did = ? order by id desc limit ?,? ";
  
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
            ps.setInt(1, did);
            ps.setInt(2, start);
            ps.setInt(3, count);
  
            ResultSet rs = ps.executeQuery();
  
            while (rs.next()) {
            	Parking bean = new Parking();
                int id = rs.getInt(1);
                String name = rs.getString("name");
                String introduction = rs.getString("introduction");
                float price = rs.getFloat("price");
                String phoneNumber = rs.getString("phoneNumber");
                int totalSeat = rs.getInt("totalSeat");
                String location = rs.getString("location");
                int startTime= rs.getInt("startTime");
                int endTime= rs.getInt("endTime");
                bean.setName(name);
                bean.setIntroduction(introduction);
                bean.setPrice(price);
                bean.setPhoneNumber(phoneNumber);
                bean.setTotalSeat(totalSeat);
                bean.setDistrict(district);
                bean.setLocation(location);
                bean.setStartTime(startTime);
                bean.setEndTime(endTime);
                bean.setId(id);
                setFirstParkingImage(bean);
                beans.add(bean);
            }
        } catch (SQLException e) {
  
            e.printStackTrace();
        }
        return beans;
    }
    public List<Parking> list() {
        return list(0,Short.MAX_VALUE);
    }
    public List<Parking> list(int start, int count) {
        List<Parking> beans = new ArrayList<Parking>();
 
        String sql = "select * from Parking limit ?,? ";
  
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
 
            ps.setInt(1, start);
            ps.setInt(2, count);
  
            ResultSet rs = ps.executeQuery();
  
            while (rs.next()) {
            	Parking bean = new Parking();
                int id = rs.getInt(1);
                
                String name = rs.getString("name");
                String introduction = rs.getString("introduction");
                float price = rs.getFloat("price");
                String phoneNumber = rs.getString("phoneNumber");
                int totalSeat = rs.getInt("totalSeat");
                int did = rs.getInt("did");
                String location = rs.getString("location");
                int startTime= rs.getInt("startTime");
                int endTime= rs.getInt("endTime");
                bean.setName(name);
                bean.setIntroduction(introduction);
                bean.setPrice(price);
                bean.setPhoneNumber(phoneNumber);
                bean.setTotalSeat(totalSeat);
                District district = new DistrictDAO().get(did);
                bean.setDistrict(district);
                bean.setLocation(location);
                bean.setStartTime(startTime);
                bean.setEndTime(endTime);
                bean.setId(id);
                setFirstParkingImage(bean);

                beans.add(bean);
            }
        } catch (SQLException e) {
  
            e.printStackTrace();
        }
        return beans;
    }    
 
    public void fill(List<District> ds) {
        for (District d : ds) 
            fill(d);
    }
    public void fill(District d) {
            List<Parking> ps = this.list(d.getId());
            d.setParkings(ps);
    }
    public void setTimeSlots(Parking p) {
    	System.out.println("in parkingdao:settimeslot");
    	TimeSlotDAO tsdao = new TimeSlotDAO();

        Date bookingDate = new Date();

    	int startTime = p.getStartTime();
    	int endTime = p.getEndTime();
    	int seat = p.getTotalSeat();

    	for(int beginTime=startTime;beginTime<endTime;beginTime++) {
    		TimeSlot bean = new TimeSlot();
            bean.setBookingDate(bookingDate);
            bean.setSeat(seat);
            bean.setBeginTime(beginTime);
            bean.setParking(p);
            tsdao.add(bean);
    	}
    }
    public void setFirstParkingImage(Parking p) {
        List<ParkingImage> pis= new ParkingImageDAO().list(p, ParkingImageDAO.type_single);
        if(!pis.isEmpty())
            p.setFirstParkingImage(pis.get(0));     
    }
     
    public void setSaleAndReviewNumber(Parking p) {
        int reviewCount = new MessageDAO().getTotal(p.getId());
        System.out.println("reviewCount");
        System.out.println(reviewCount);
        p.setReviewCount(reviewCount);
        
    }
 
    public void setSaleAndReviewNumber(List<Parking> parkings) {
        for (Parking p : parkings) {
            setSaleAndReviewNumber(p);
        }
    }
 
    public List<Parking> searchByName(String keyword, int start, int count) {
         List<Parking> beans = new ArrayList<Parking>();
          
         if(null==keyword||0==keyword.trim().length())
             return beans;
            String sql = "select * from Parking where name like ? limit ?,? ";
      
            try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
                ps.setString(1, "%"+keyword.trim()+"%");
                ps.setInt(2, start);
                ps.setInt(3, count);
      
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {

                	Parking bean = new Parking();
                    int id = rs.getInt(1);
                    String name = rs.getString("name");
                    String introduction = rs.getString("introduction");
                    float price = rs.getFloat("price");
                    String phoneNumber = rs.getString("phoneNumber");
                    int totalSeat = rs.getInt("totalSeat");
                    int did = rs.getInt("did");
                    String location = rs.getString("location");
                    int startTime= rs.getInt("startTime");
                    int endTime= rs.getInt("endTime");
                    bean.setName(name);
                    bean.setIntroduction(introduction);
                    bean.setPrice(price);
                    bean.setPhoneNumber(phoneNumber);
                    bean.setTotalSeat(totalSeat);
                    District district = new DistrictDAO().get(did);
                    bean.setDistrict(district);
                    bean.setLocation(location);
                    bean.setStartTime(startTime);
                    bean.setEndTime(endTime);
                    bean.setId(id);

                    setFirstParkingImage(bean);

                    beans.add(bean);
                }
            } catch (SQLException e) {
      
                e.printStackTrace();
            }
            return beans;
    }
    public List<Parking> select(String target,int fromCount, int toCount, int start, int count) {
        List<Parking> beans = new ArrayList<Parking>();
         
           String sql = "select * from Parking where "+target+" between "+fromCount+" and "+toCount+" limit ?,? ";
           System.out.println("in select");

           try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
               ps.setInt(1, start);
               ps.setInt(2, count);
     
               ResultSet rs = ps.executeQuery();
               while (rs.next()) {

               	Parking bean = new Parking();
                   int id = rs.getInt(1);
                   String name = rs.getString("name");
                   String introduction = rs.getString("introduction");
                   float price = rs.getFloat("price");
                   String phoneNumber = rs.getString("phoneNumber");
                   int totalSeat = rs.getInt("totalSeat");
                   int did = rs.getInt("did");
                   String location = rs.getString("location");
                   int startTime= rs.getInt("startTime");
                   int endTime= rs.getInt("endTime");
                   bean.setName(name);
                   bean.setIntroduction(introduction);
                   bean.setPrice(price);
                   bean.setPhoneNumber(phoneNumber);
                   bean.setTotalSeat(totalSeat);
                   District district = new DistrictDAO().get(did);
                   bean.setDistrict(district);
                   bean.setLocation(location);
                   bean.setStartTime(startTime);
                   bean.setEndTime(endTime);
                   bean.setId(id);

                   setFirstParkingImage(bean);

                   beans.add(bean);
               }
           } catch (SQLException e) {
     
               e.printStackTrace();
           }
           return beans;
   }
}