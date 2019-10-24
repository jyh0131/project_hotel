package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.khrd.dto.Picture;
import com.khrd.jdbc.JDBCUtil;

public class PictureDAO {
	private static final PictureDAO dao = new PictureDAO();
	
	public static PictureDAO getInstance() {
		return dao;
	}
	
	private PictureDAO() {
		
	}
	
	public int insert(Connection conn, Picture picture) {
		PreparedStatement pstmt = null;
		 
		try {
//			insert into picture values(null, "sample.jpg", 5, null);
			String sql = "insert into picture values(null, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, picture.getPicFile()); // 파일명
			pstmt.setInt(2, picture.getgType().getgNo()); // g_type no
			pstmt.setInt(3, picture.getRcNo()); // room_category no
			
			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
		
	}
}
