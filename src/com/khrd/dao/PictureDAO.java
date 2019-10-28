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
										   rs.getString("rc_name"),
										   rs.getString("rc_eng_name"));
		return rc;
	}

	// GType 객체 생성 메소드
	private GType gtConstructor(ResultSet rs) throws SQLException {
		GType gt = new GType(rs.getInt("g_no"), 
							 rs.getString("g_name"),
							 rs.getString("g_path"));
		return gt;
	} 

	
	// Picture 객체 생성 메소드
	private Picture picConstruct(ResultSet rs) throws SQLException{
		GType gt = gtConstructor(rs);
		RoomCategory rc = rcConstructor(rs);
		
		Picture picture = new Picture(rs.getString("pic_file"), 
									  gt, // 갤러리 타입
									  rc); // 객실 분류 타입
		
		return picture;
	}
	
	/*-------------------------------------------------*/
	
	
	public int insert(Connection conn, Picture picture) {
		PreparedStatement pstmt = null;
		 
		try {
//			insert into picture values(null, "sample.jpg", 5, null);
			String sql = "insert into picture values(?, ?, ?)";
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
	
	public List<Picture> selectList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from picture p join room_category rc on p.rc_no = rc.rc_no\r\n"
											   + "join g_type g on p.g_no = g.g_no\r\n" 
								+ "order by pic_file;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<Picture> list = new ArrayList<Picture>();
			
			while(rs.next()) {
				Picture picture = picConstruct(rs);
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
	
	public int delete(Connection conn, String pic_file) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from picture where pic_file = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pic_file);
			
			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}
	
	public Picture selectedByNo(Connection conn, String picFile) {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String sql = "select * from picture p join room_category rc on p.rc_no = rc.rc_no\r\n" 
										   + "join g_type g on p.g_no = g.g_no\r\n" 
							+ "where pic_file=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, picFile);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			Picture picture = picConstruct(rs);
			return picture;
		}
	}catch (Exception e) {
		e.printStackTrace();
	}finally {
		JDBCUtil.close(rs);
		JDBCUtil.close(pstmt);
	}
	
	return null;
	}
	
	public int update(Connection conn, Picture picture) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update picture set g_no = ?, rc_no = ? where pic_file= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, picture.getgType().getgNo());
			pstmt.setInt(2, picture.getRoomCategory().getRcNo());
			pstmt.setString(3, picture.getPicFile());
			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}
	
	public Picture selectedByContent(Connection conn, int rcNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from picture p join g_type g using(g_no) join room_category rc using(rc_no) where rc_no=? and pic_file like '%content%'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rcNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Picture picture = picConstruct(rs);
				return picture;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}// selectedByContent
	
	public Picture selectedByRoom(Connection conn, int rcNo, String rcEngName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from picture p join g_type g using(g_no) join room_category rc using(rc_no) where rc_no=? and pic_file like %'?'%";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rcNo);
			pstmt.setString(2, rcEngName); /*이부분 안됨@@@@@@@@@@@@@@@@@@@@@@*/
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Picture picture = picConstruct(rs);
				return picture;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}// selectedByRoom
}