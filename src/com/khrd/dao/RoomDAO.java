package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.khrd.dto.Room;
import com.khrd.jdbc.JDBCUtil;

public class RoomDAO {
	private static final RoomDAO dao = new RoomDAO();
			
	public static RoomDAO getInstance() {
		return dao;
	}
	
	private RoomDAO() {
		
	}
	
	public List<Room> selectList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from room r, bed_type b, view_type v, room_category rc, room_size rs where r.bt_no = b.bt_no and r.vt_no = v.vt_no and r.rc_no = rc.rc_no and r.rs_no = rs.rs_no;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<Room> list = new ArrayList<Room>();
			while(rs.next()) {
				Room room = new Room(rs.getInt("room_no"),
									 rs.getInt("room_price"),
									 rs.getInt("rc_no"),
									 rs.getInt("vt_no"),
									 rs.getInt("bt_no"),
									 rs.getInt("rs_no"));
				list.add(room);
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
	
	public int insert(Connection conn, Room room) {
		PreparedStatement pstmt = null;
		 
		try {
//			insert into room values(1024, 350000, 1, 1, 1, 1, 1); 
//									1024호 350000원 스탠다드 산 더블 40m2 standard1.jpg
			String sql = "insert into room values(?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, room.getRoomNo());
			pstmt.setInt(2, room.getRoomPrice());
			pstmt.setInt(3, room.getRcNo());
			pstmt.setInt(4, room.getVtNo());
			pstmt.setInt(5, room.getBtNo());
			pstmt.setInt(6, room.getRsNo());
			
			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}
}
