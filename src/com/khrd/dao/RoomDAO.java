package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.khrd.jdbc.JDBCUtil;

public class RoomDAO {
	private static final RoomDAO dao = new RoomDAO();
			
	public static RoomDAO getInstance() {
		return dao;
	}
	
	private RoomDAO() {
		
	}
	
	public int insert(Connection conn, int roomNo) {
		PreparedStatement pstmt = null;
		 
		try {
			String sql = "insert into room values(1024, 350000, 1, 1, 1, 1, 1)";
			
			
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		
		return -1;
	}
}
