package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.khrd.dto.BedType;
import com.khrd.dto.Room;
import com.khrd.dto.RoomCategory;
import com.khrd.dto.RoomSize;
import com.khrd.dto.ViewType;
import com.khrd.jdbc.JDBCUtil;

public class RoomDAO {
	private static final RoomDAO dao = new RoomDAO();
			
	public static RoomDAO getInstance() {
		return dao;
	}
	
	private RoomDAO() {
		
	}
		
	// RoomCategory 객체 생성 메소드
	private RoomCategory rcConstructor(ResultSet rs) throws SQLException {
		RoomCategory rc = new RoomCategory(rs.getInt("rc_no"), 
										   rs.getString("rc_name"));
		return rc;
	}
	
	// ViewType 객체 생성 메소드
	private ViewType vtConstructor(ResultSet rs) throws SQLException {
		ViewType vt = new ViewType(rs.getInt("vt_no"), 
								   rs.getString("vt_name"));
		return vt;
	}
		
	// BedType 객체 생성 메소드
	private BedType btConstructor(ResultSet rs) throws SQLException {
		BedType bt = new BedType(rs.getInt("bt_no"), 
								 rs.getString("bt_name"));
		return bt;
	}	
	
	// RoomSize 객체 생성 메소드
	private RoomSize rsConstructor(ResultSet rs) throws SQLException {
		RoomSize rSize = new RoomSize(rs.getInt("rs_no"), 
									  rs.getInt("rs_name"));
		return rSize;
	}	
	
	// Room 객체 생성 메소드
	private Room room(ResultSet rs) throws SQLException {
		RoomCategory rc = rcConstructor(rs);
		ViewType vt = vtConstructor(rs);
		BedType bt = btConstructor(rs);
		RoomSize rSize = rsConstructor(rs);
		
		Room room = new Room(rs.getInt("room_no"),
					 rs.getInt("room_price"),
					 rc, // RoomCategory
					 vt, // ViewType
					 bt, // BedType
					 rSize); // RoomSize
		return room;
	}
	
	/*-------------------------------------*/
	
	
	public List<Room> selectList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from room r, bed_type b, view_type v, room_category rc, room_size rs where r.bt_no = b.bt_no and r.vt_no = v.vt_no and r.rc_no = rc.rc_no and r.rs_no = rs.rs_no;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<Room> list = new ArrayList<Room>();
			while(rs.next()) {
				Room room = room(rs); // Room 객체 생성 메소드 호출
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
			pstmt.setInt(3, room.getRoomCategory().getRcNo());
			pstmt.setInt(4, room.getViewType().getVtNo());
			pstmt.setInt(5, room.getBedType().getBtNo());
			pstmt.setInt(6, room.getRoomSize().getRsNo());
			
			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}
	
	public int delete(Connection conn, int room_no) {
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from room where room_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, room_no);
			
			return pstmt.executeUpdate(); 
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}
	
	public Room selectListByRoomNo(Connection conn, int roomNo){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from room r join bed_type b on r.bt_no = b.bt_no join view_type v on r.vt_no = v.vt_no join room_category rc on r.rc_no = rc.rc_no join room_size rs on r.rs_no = rs.rs_no where room_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomNo);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				Room room = room(rs); // Room 객체 생성 메소드 호출
				return room;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		
		
		return null;
	}
	
	public int update(Connection conn, Room room) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update room set room_price=?, rc_no=?, vt_no=?, bt_no=?, rs_no=? where room_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, room.getRoomPrice());
			pstmt.setInt(2, room.getRoomCategory().getRcNo());
			pstmt.setInt(3, room.getViewType().getVtNo());
			pstmt.setInt(4, room.getBedType().getBtNo());
			pstmt.setInt(5, room.getRoomSize().getRsNo());
			pstmt.setInt(6, room.getRoomNo()); 
			   
			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}
}
