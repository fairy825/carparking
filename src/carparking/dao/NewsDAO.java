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
 
public class NewsDAO {
 
    public int getTotal() {
        int total = 0;
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "select count(*) from News";
 
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return total;
    }
 
    public void add(News bean) {
 
        String sql = "insert into News values(null,?,?,?)";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
 
            ps.setString(1, bean.getTitle());
            ps.setString(2, bean.getContent());
            ps.setTimestamp(3,  DateUtil.d2t(bean.getCreateDate()));
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
 
    public void update(News bean) {
 
        String sql = "update News set title= ?, content=?, createDate=? where id = ?";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
 
        	 ps.setString(1, bean.getTitle());
             ps.setString(2, bean.getContent());
             ps.setTimestamp(3,  DateUtil.d2t(bean.getCreateDate()));
             ps.setInt(4, bean.getId());

            ps.execute();
 
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
 
    }
 
    public void delete(int id) {
 
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "delete from News where id = " + id;
 
            s.execute(sql);
 
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
    }
 
    public News get(int id) {
    	News bean = null;
 
        try (Connection c = DBUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "select * from News where id = " + id;
 
            ResultSet rs = s.executeQuery(sql);
 
            if (rs.next()) {
                bean = new News();
                String title = rs.getString("title");
                String content = rs.getString("content");
                Date createDate = DateUtil.t2d( rs.getTimestamp("createDate"));

                bean.setTitle(title);
                bean.setContent(content);
                bean.setCreateDate(createDate);
     
                bean.setId(id);
            }
 
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return bean;
    }
 
    public List<News> list() {
        return list(0, Short.MAX_VALUE);
    }
 
    public List<News> list(int start, int count) {
        List<News> beans = new ArrayList<News>();
 
        String sql = "select * from News order by id desc limit ?,? ";
 
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
 
            ps.setInt(1, start);
            ps.setInt(2, count);
 
            ResultSet rs = ps.executeQuery();
 
            while (rs.next()) {
            	News bean = new News();
                int id = rs.getInt(1);
                String title = rs.getString("title");
                String content = rs.getString("content");
                Date createDate = DateUtil.t2d( rs.getTimestamp("createDate"));
                bean.setTitle(title);
                bean.setContent(content);
                bean.setCreateDate(createDate);
                bean.setId(id);
                beans.add(bean);
            }
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return beans;
    }
    public List<News> search(String keyword, int start, int count) {
        List<News> beans = new ArrayList<News>();
         System.out.println(keyword);
        if(null==keyword||0==keyword.trim().length())
            return beans;
           String sql = "select * from News where title like ? limit ?,? ";
     
           try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
               ps.setString(1, "%"+keyword.trim()+"%");
               ps.setInt(2, start);
               ps.setInt(3, count);
     
               ResultSet rs = ps.executeQuery();
               System.out.println("11");

               while (rs.next()) {
                   System.out.println("in circle");

            	   News bean = new News();
                   int id = rs.getInt(1);
                   String title = rs.getString("title");
                   String content = rs.getString("content");
                   Date createDate = DateUtil.t2d( rs.getTimestamp("createDate"));
                   bean.setTitle(title);
                   bean.setContent(content);
                   bean.setCreateDate(createDate);
                   bean.setId(id);
                   beans.add(bean);
                   System.out.println(title);

               }
           } catch (SQLException e) {
     
               e.printStackTrace();
           }
           return beans;
   }
 
}