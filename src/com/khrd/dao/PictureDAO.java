package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.khrd.dto.GType;
import com.khrd.dto.Picture;
import com.khrd.dto.Room;
import com.khrd.dto.RoomCategory;
import com.khrd.jdbc.JDBCUtil;

public class PictureDAO {
	private static final PictureDAO dao = new PictureDAO();
	
	public static PictureDAO getInstance() {
		return dao;
	}
	
	private PictureDAO() {
		
	}
	
	// RoomCategory 객체 생성 메소드
	private RoomCategory rcConstructor(ResultSet rs) throws SQLException {
		RoomCategory rc = new RoomCategory(rs.getInt("rc_no"), 
										   rs.getString("rc_name"));
		return rc;
	}

	// GType 객체 생성 메소드
	private GType gtConstructor(ResultSet rs) throws SQLException {
		GType gt = new GType(rs.getInt("g_no"), 
							 rs.getString("g_name"));
		return gt;
	} 

	
	// Picture 객체 생성 메소드
	private Picture picture(ResultSet rs) throws SQLException{
		GType gt = gtConstructor(rs);
		RoomCategory rc = rcConstructor(rs);
		
		Picture picture = new Picture(rs.getInt("pic_no"), 
				rs.getString("pic_file"), 
				gt, // 갤러리 타입
				rc); // 객실 분류 타입
		
		return picture;
	}
	
	/*-------------------------------------------------*/
	
	
	public int insert(Connection conn, Picture picture) {
		PreparedStatement pstmt = null;
		 
		try {
//			insert into picture values(null, "sample.jpg", 5, null);
			String sql = "insert into picture values(null, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, picture.getPicFile()); // 파일명
			pstmt.setInt(2, picture.getgType().getgNo()); // g_type no
			pstmt.setInt(3, picture.getRoomCategory().getRcNo()); // room_category no
			
			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
		
	}
//	public Picture selectedByNo(Connection conn, int roomNo) {
//		PreparedStatement pstmt = null;
//		
//		try {
//			String sql = ""
//			pstmt = conn.prepareStatement(sql);
//		}catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			JDBCUtil.close(pstmt);
//		}
//		
//		return null;
//	}
	
	public List<Picture> selectList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from picture p join room_category rc on p.rc_no = rc.rc_no join g_type g on p.g_no = g.g_no";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<Picture> list = new ArrayList<Picture>();
			
			while(rs.next()) {
				Picture picture = picture(rs);
				list.add(picture);
			}
			return list;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;  
	}
}
