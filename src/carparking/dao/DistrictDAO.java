package carparking.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import carparking.bean.*;
import carparking.util.DBUtil;
 
public class DistrictDAO {
 
    public int getTotal() {
        int total = 0;
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "select count(*) from District";
 
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return total;
    }
 
    public void add(District bean) {
 
        String sql = "insert into District values(null,?)";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
 
            ps.setString(1, bean.getName());
 
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
 
    public void update(District bean) {
 
        String sql = "update District set name= ? where id = ?";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
 
            ps.setString(1, bean.getName());
            ps.setInt(2, bean.getId());
 
            ps.execute();
 
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
 
    }
 
    public void delete(int id) {
 
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "delete from District where id = " + id;
 
            s.execute(sql);
 
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
    }
 
    public District get(int id) {
    	District bean = null;
 
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "select * from District where id = " + id;
 
            ResultSet rs = s.executeQuery(sql);
 
            if (rs.next()) {
                bean = new District();
                String name = rs.getString(2);
                bean.setName(name);
                bean.setId(id);
            }
 
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return bean;
    }
 
    public List<District> list() {
        return list(0, Short.MAX_VALUE);
    }
 
    public List<District> list(int start, int count) {
        List<District> beans = new ArrayList<District>();
 
        String sql = "select * from District order by id desc limit ?,? ";
 
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
 
            ps.setInt(1, start);
            ps.setInt(2, count);
 
            ResultSet rs = ps.executeQuery();
 
            while (rs.next()) {
            	District bean = new District();
                int id = rs.getInt(1);
                String name = rs.getString(2);
                bean.setId(id);
                bean.setName(name);
                beans.add(bean);
            }
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return beans;
    }
    public List<District> search(String keyword, int start, int count) {
        List<District> beans = new ArrayList<District>();
         System.out.println(keyword);
        if(null==keyword||0==keyword.trim().length())
            return beans;
           String sql = "select * from District where name like ? limit ?,? ";
     
           try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
               ps.setString(1, "%"+keyword.trim()+"%");
               ps.setInt(2, start);
               ps.setInt(3, count);
     
               ResultSet rs = ps.executeQuery();
     
               while (rs.next()) {
                   System.out.println("0");

            	   District bean = new District();
                   int id = rs.getInt(1);
                   String name = rs.getString(2);
                   bean.setId(id);
                   bean.setName(name);
                   beans.add(bean);
                   System.out.println(name);

               }
           } catch (SQLException e) {
     
               e.printStackTrace();
           }
           return beans;
   }
}