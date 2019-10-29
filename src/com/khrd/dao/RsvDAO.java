package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.khrd.dto.BedType;
import com.khrd.dto.Member;
import com.khrd.dto.Reservation;
import com.khrd.dto.Room;
import com.khrd.dto.RoomCategory;
import com.khrd.dto.RoomSize;
import com.khrd.dto.ViewType;
import com.khrd.jdbc.JDBCUtil;

public class RsvDAO {
	private static final RsvDAO dao = new RsvDAO();
       
	private RsvDAO() {
	}

	public static RsvDAO getInstance() {
		return dao;
	}

/*----------------------------------------------------------------------------------------*/	
	// RoomCategory 객체 생성 메소드
	private RoomCategory rcConstructor(ResultSet rs) throws SQLException {
		RoomCategory rc = new RoomCategory(rs.getInt("rc_no"), 
										   rs.getString("rc_name"),
										   rs.getString("rc_eng_name"));
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
	private Room roomConstructor(ResultSet rs) throws SQLException {
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
	//Member 객체 생성 메소드
	private Member memConstructor(ResultSet rs) throws SQLException {
		Member m = new Member(rs.getInt("m_no"), 
							  rs.getString("m_name"), 
							  rs.getTimestamp("m_birth"), 
							  rs.getString("m_mail"), 
							  rs.getString("m_phone"), 
							  rs.getString("m_tel"), 
							  rs.getString("m_zipcode"), 
							  rs.getString("m_addr1"), 
							  rs.getString("m_addr2"), 
							  rs.getString("m_id"), 
							  rs.getString("m_pwd"), 
							  rs.getTimestamp("m_regdate"), 
							  rs.getTimestamp("m_quitdate"), 
							  rs.getInt("m_isAdmin"));
		return m;
	}
	
	//Reservation 객체생성 메소드
	private Reservation RsvConstructor(ResultSet rs) throws SQLException {
		Member m = memConstructor(rs);
		Room r = roomConstructor(rs);
		
		Reservation rsv = new Reservation(rs.getInt("r_no"), 
									 	  m, //회원번호
										  r, //방호수
										  rs.getTimestamp("r_in"), 
										  rs.getTimestamp("r_out"),
										  rs.getInt("r_stay"),
										  rs.getInt("r_total_price"), 
										  rs.getString("r_request"), 
										  rs.getInt("r_psnAdt"), 
										  rs.getInt("r_psnCdr"), 
										  rs.getTimestamp("r_pay_date"), 
										  rs.getInt("op_no"));
		return rsv;
	}
	
/*----------------------------------------------------------------------------------------*/	
	
	//selectListAll -> 전체 예약 보기
	public List<Reservation> selectRsvListAll(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from reservation";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<Reservation> list = new ArrayList<>();
			
			while(rs.next()) {
				Reservation rsv = RsvConstructor(rs);
				
				list.add(rsv);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		
		return null;
		
	}/*/selectList*/

	//selectRsvByRNo -> 예약번호로 예약정보 한건 조회하기
	public Reservation selectRsvByRNo(Connection conn, int rNo) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from room r "
						+"join bed_type b using(bt_no) "
						+"join view_type v using(vt_no) "
						+"join room_category rc using(rc_no) "
						+"join room_size rs using(rs_no) "
						+"join reservation rsv using(room_no) "
						+"join member m using(m_no)"
						+"where r_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,rNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Reservation rsv = RsvConstructor(rs);
				return rsv;
			}
			
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		
		return null;
		
	}/*/selectRsvByRNo*/
	
	//selectAvailableRoomList -> 날짜에 따른 예약 가능한 방 목록 (selectEmptyRoomByCondition로 진화시킴)
	public List<Room> selectAvailableRoomList(Connection conn, String inDate, String outDate){
		PreparedStatement pstmt = null;
		PreparedStatement pstmtDrop = null;
		PreparedStatement pstmtSel = null;
		ResultSet rs = null;
		
		
		try {
			//view 삭제 후 생성
			String dropView = "drop view if exists vw_available";
			String createView = "create or replace view vw_available "
								+"as select * from ("
								+"select * from room r join bed_type b using(bt_no) "
								+"join view_type v using(vt_no) "
								+"join room_category rc using(rc_no) "
								+"join room_size rs using(rs_no) "
								+"left join reservation rsv using(room_no) "
								+"where !((rsv.r_in >= ? and rsv.r_in <= ?) "
								+"or (rsv.r_out >= ? and rsv.r_out <= ?))) as subRsv "
								+"where !((subRsv.r_in <= ? and subRsv.r_out >= ?) "
								+"or (subRsv.r_in <= ? and subRsv.r_out >= ?)) "
								+"union "
								+"select * from room r join bed_type b using(bt_no) "
								+"join view_type v using(vt_no) "
								+"join room_category rc using(rc_no) "
								+"join room_size rs using(rs_no) "
								+"left join reservation rsv using(room_no) "
								+"where rsv.r_in is null and rsv.r_out is null";  
			 
			pstmtDrop = conn.prepareStatement(dropView); 
			pstmt = conn.prepareStatement(createView);
			pstmt.setString(1, inDate);
			pstmt.setString(2, outDate);
			pstmt.setString(3, inDate);
			pstmt.setString(4, outDate);
			pstmt.setString(5, inDate);
			pstmt.setString(6, inDate);
			pstmt.setString(7, outDate);
			pstmt.setString(8, outDate);
			
			pstmtDrop.execute();
			pstmt.execute();
			
			String sql = "select * from vw_available group by rc_name order by rc_no";
			pstmtSel = conn.prepareStatement(sql);
			
			rs = pstmtSel.executeQuery(); 
			
			List<Room> list = new ArrayList<>();
			while(rs.next()) {
				Room r = roomConstructor(rs);
				
				list.add(r);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmtSel);
			JDBCUtil.close(pstmt);
			JDBCUtil.close(pstmtDrop);
		}
		
		return null;
		
	}/*/selectAvailableRoomList*/
	
	
	//selectReservedRoomList -> 예약된 방 목록
	public List<Room> selectReservedRoomList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select rm.room_no, rm.room_price, rm.rc_no, rm.vt_no, rm.bt_no, rm.rs_no "
						+"from reservation rsv right join room rm on rsv.room_no=rm.room_no "
						+"where rsv.r_no is not null";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<Room> list = new ArrayList<>();
			
			while(rs.next()) {
				Room r = roomConstructor(rs);
				
				list.add(r);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		
		return null;
		
	}/*/selectReservedRoomList*/
	
	//selectEmptyRoomByCondition -> 조건에 맞는 빈 방 목록
	public List<Room> selectEmptyRoomByCondition(Connection conn, String inDate, String outDate, String rc, String bt, String vt){ //rc->카테고리, bt->침대타입, vt->뷰타입
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from "
						+"(select * from ("
						+"select * from room r join bed_type b using(bt_no) "
						+"join view_type v using(vt_no) "
						+"join room_category rc using(rc_no) "
						+"join room_size rs using(rs_no) "
						+"left join reservation rsv using(room_no) "
						+"where !((rsv.r_in >= ? and rsv.r_in <= ?) "
						+"or (rsv.r_out >= ? and rsv.r_out <= ?))) as subRsv "
						+"where !((subRsv.r_in <= ? and subRsv.r_out >= ?) "
						+"or (subRsv.r_in <= ? and subRsv.r_out >= ?)) "
						+"union "
						+"select * from room r join bed_type b using(bt_no) "
						+"join view_type v using(vt_no) "
						+"join room_category rc using(rc_no) "
						+"join room_size rs using(rs_no) "
						+"left join reservation rsv using(room_no) "
						+"where rsv.r_in is null and rsv.r_out is null) as emptyRoom "
						+"where rc_name=? and bt_name=? and vt_name=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inDate);
			pstmt.setString(2, outDate);
			pstmt.setString(3, inDate);
			pstmt.setString(4, outDate);
			pstmt.setString(5, inDate);
			pstmt.setString(6, inDate);
			pstmt.setString(7, outDate);
			pstmt.setString(8, outDate);
			pstmt.setString(9, rc);
			pstmt.setString(10, bt);
			pstmt.setString(11, vt);
			rs = pstmt.executeQuery();
			
			List<Room> list = new ArrayList<>();
			
			while(rs.next()) {
				Room r = roomConstructor(rs);
				
				list.add(r);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		
		return null;
		
	}/*/selectEmptyRoomByCondition*/
	
	//selectByMNo -> 멤버 별 예약 확인
	public List<Reservation> selectRsvByMNo(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from room r "
						+"join bed_type b using(bt_no) "
						+"join view_type v using(vt_no) "
						+"join room_category rc using(rc_no) "
						+"join room_size rs using(rs_no) "
						+"join reservation rsv using(room_no) "
						+"join member m using(m_no)"
						+"where m_no = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mNo);
			
			rs = pstmt.executeQuery();
			List<Reservation> list = new ArrayList<>();
			
			while(rs.next()) {
				Reservation r = RsvConstructor(rs);
				
				list.add(r);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		
		return null;
		
	}/*/selectByMId*/
	
	
	//insertRsv -> 예약 추가
	public int insertRsv(Connection conn, Reservation rsv) throws SQLException {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into reservation values (0, ?, ?, ?, ?, ?, ?, ?, ?, ?, now(), ?)";
			//insert into reservation values (r_no, m_no, room_no, r_in, r_out, r_stay, r_total_price, r_request, r_psnAdt, r_psnCdr, r_pay_date, op_no);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rsv.getMember().getmNo());
			pstmt.setInt(2, rsv.getRoom().getRoomNo());
			pstmt.setTimestamp(3, new Timestamp(rsv.getrIn().getTime()));
			pstmt.setTimestamp(4, new Timestamp(rsv.getrOut().getTime()));
			pstmt.setInt(5, rsv.getrStay());
			pstmt.setInt(6, rsv.getrTotalPrice());
			pstmt.setString(7, rsv.getrRequest());
			pstmt.setInt(8, rsv.getrPsnAdt());
			pstmt.setInt(9, rsv.getrPsnCdr());
			pstmt.setInt(10, rsv.getOpNo());
			
			return pstmt.executeUpdate();
			
		} finally {
			JDBCUtil.close(pstmt);
		}
		
	}/*/insertRsv*/
	
	//selectLastInsertId -> 가장 마지막에 추가된 아이디 가져오기 (Auto_increment값)
	public int selectRsvLastInsertId(Connection conn) throws SQLException{
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		
		try {
			String sql = "select last_insert_id() from room r "
						+"join bed_type b using(bt_no) "
						+"join view_type v using(vt_no) "
						+"join room_category rc using(rc_no) "
						+"join room_size rs using(rs_no) "
						+"join reservation rsv using(room_no) "
						+"join member m using(m_no)";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int rNo = rs.getInt(1);
				
				return rNo;
			}
			
		} finally {
			JDBCUtil.close(pstmt);
		}
	
		return -1;
	}/*/selectLastInsertId*/
	
	
	//deleteRsvByRNo -> 예약 내역 삭제
	public int deleteRsvByRNo(Connection conn, int rNo) throws SQLException {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from reservation where r_no=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, rNo);
			
			return pstmt.executeUpdate();
			
		} finally {
			JDBCUtil.close(pstmt);
		}
		
	}/*/deleteRsvByRNo*/
	
	
	
}// RsvDAO
