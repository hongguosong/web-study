package com.itqinxue.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.itqinxue.util.DBUtil;
import com.itqinxun.dao.ImageDao;
import com.itqinxun.model.Account;
import com.itqinxun.model.Image;

public class ImageDaoImpl implements ImageDao{

	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	@Override
	public int addImage(Image img) {
		int imgId=0;
		int i=0;
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("insert into image_table(image_src,image_desc) values(?,?)",Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1,img.getImage_src());
			pstmt.setString(2, img.getImage_desc());
			
			i = pstmt.executeUpdate();
			if(i>0) {
				rs = pstmt.getGeneratedKeys();
				if(rs.next()) {
					imgId=rs.getInt(1);
				}
			}
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		
		return imgId;
	}

	@Override
	public List<Image> searchImageAll() {
		List<Image> list = new ArrayList<Image>();
		try 
		{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement("select * from image_table order by image_id desc");
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				Image img=new Image();
				img.setImage_id(rs.getInt("image_id"));
				img.setImage_src(rs.getString("image_src"));
				img.setImage_desc(rs.getString("image_desc"));
				list.add(img);
			} 
			
		}catch(SQLException e) 
		{
			e.printStackTrace();
		}finally {
			DBUtil.release(conn, pstmt, rs);
		}
		return list;
	}

}
