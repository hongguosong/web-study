package com.itqinxue.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.itqinxue.util.DBUtil;
import com.itqinxun.dao.WallDao;
import com.itqinxun.model.Wall;

public class WallDaoImpl implements WallDao{
	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	@Override
	public List<Wall> searchWall() {
		List<Wall> list = new ArrayList<Wall>();
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from wall_table order by wall_id");
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				Wall wall=new Wall();
				wall.setId(rs.getInt("wall_id"));
				wall.setTitle(rs.getString("wall_title"));				
				list.add(wall);
			}
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		return list;
	}
	@Override
	public boolean deleteWall(int wall_id) {
		boolean flag = false;
		int i=0;
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("delete from wall_table where wall_id=?");
			pstmt.setInt(1, wall_id);
			i = pstmt.executeUpdate();
			if(i>0) {
				flag=true;
			}
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		return flag;
	}
	@Override
	public boolean addWall(Wall wall) {
		boolean flag = false;
		int i=0;
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("insert into wall_table(wall_title) values(?)");
			pstmt.setString(1, wall.getTitle());
			i = pstmt.executeUpdate();
			if(i>0) {
				flag=true;
			}
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		return flag;
	}
	
	
}
