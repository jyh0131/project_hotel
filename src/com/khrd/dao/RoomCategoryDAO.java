package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.khrd.dto.RoomCategory;
import com.khrd.jdbc.JDBCUtil;

public class RoomCategoryDAO {
	private static final RoomCategoryDAO dao = new RoomCategoryDAO();
	
	public static RoomCategoryDAO getInstance() {
		return dao;
	}
	
	private RoomCategoryDAO() {
		
	}
	
	public List<RoomCategory> selectList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from room_category";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<RoomCategory> list = new ArrayList<RoomCategory>();
			while(rs.next()) {
				RoomCategory rc = new RoomCategory(rs.getInt("rc_no"), rs.getString("rc_name"));
				list.add(rc);
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
	
	public RoomCategory selectedByNo(Connection conn, int rcNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from room_category where rc_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rcNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				RoomCategory rc = new RoomCategory(rs.getInt("rc_no"), rs.getString("rc_name"));
				return rc;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}
}
