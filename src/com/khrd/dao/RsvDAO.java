package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.khrd.dto.Member;
import com.khrd.dto.Reservation;
import com.khrd.dto.Room;
import com.khrd.jdbc.JDBCUtil;

public class RsvDAO {
	private static final RsvDAO dao = new RsvDAO();
       
	private RsvDAO() {
	}

	public static RsvDAO getInstance() {
		return dao;
	}

	//Room 객체 생성 메소드
	private Room roomConstructor(ResultSet rs) throws SQLException {
		Room r = new Room(rs.getInt("room_no"), 
						  rs.getInt("room_price"), 
						  rs.getInt("rc_no"), 
						  rs.getInt("vt_no"), 
						  rs.getInt("bt_no"), 
						  rs.getInt("rs_no"));
		return r;
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
										rs.getInt("r_total_price"), 
										rs.getString("r_request"), 
										rs.getInt("r_personnel"), 
										rs.getTimestamp("r_pay_date"), 
										rs.getInt("op_no"),
										rs.getString("r_state"));
		return rsv;
	}
	
/*----------------------------------------------------------------------------------------*/	
	
	//selectListAll -> 전체 예약 보기 (취소예약 포함)
	public List<Reservation> selectListAll(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from reservation";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<Reservation> list = new ArrayList<>();
			
			while(rs.next()) {
<<<<<<< HEAD
				Reservation rsv = RsvConstructor(rs);
=======
				Member m = memConstructor(rs);
				
				Room r = roomConstructor(rs);
				
				Reservation rsv = new Reservation(rs.getInt("r_no"), 
												m, //회원번호
												r, //방호수
												rs.getTimestamp("r_in"), 
												rs.getTimestamp("r_out"), 
												rs.getInt("r_total_price"), 
												rs.getString("r_request"), 
												rs.getInt("r_personnel"), 
												rs.getTimestamp("r_pay_date"), 
												rs.getInt("op_no"));
>>>>>>> branch 'master' of https://github.com/jyh0131/project_hotel.git
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

	
	//selectListByState -> 예약 상태에 따른 리스트 검색
	public List<Reservation> selectListByState(Connection conn, String state){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from reservation where r_state=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, state);
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
		
	}/*/selectListByState*/
	
	
	//selectByRNo -> 예약번호로 예약정보 한건 조회하기
	public Reservation selectByRNo(Connection conn, int rNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from reservation where r_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,rNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Reservation rsv = RsvConstructor(rs);
				return rsv;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		
		return null;
		
	}/*/selectByRNo*/
	
	//selectEmptyRoomList -> 빈 방 찾기
	public List<Room> selectEmptyRoomList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select rm.room_no, rm.room_price, rm.rc_no, rm.vt_no, rm.bt_no, rm.rs_no "
						+"from reservation rsv right join room rm on rsv.room_no=rm.room_no "
						+"where rsv.r_in is null and rsv.r_out is null";
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
		
	}/*/selectEmptyRoomList*/
	
	
	
	
	
	
	
	
	//insert -> 예약 추가
	public int insert(Connection conn, Reservation rsv) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into reservation values (0, ?, ?, ?, ?, ?, ?, ?, now(), ?, ?)";
			//insert into reservation values (r_no, m_no, room_no, r_in, r_out, r_total_price, r_request, r_personnel, r_pay_date, op_no, r_state);
			//insert into reservation values (null, 1, 301, "2019-11-22", "2019-11-23", 1300000, null, 1, now(), 2, "결제완료");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rsv.getMember().getmNo());
			pstmt.setInt(2, rsv.getRoom().getRoomNo());
			pstmt.setTimestamp(3, new Timestamp(rsv.getrIn().getTime()));
			pstmt.setTimestamp(4, new Timestamp(rsv.getrOut().getTime()));
			pstmt.setInt(5, rsv.getrTotalPrice());
			pstmt.setString(6, rsv.getrRequest());
			pstmt.setInt(7, rsv.getrPersonnel());
			pstmt.setInt(8, rsv.getOpNo());
			pstmt.setString(9, rsv.getrState());
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
		
	}/*/insert*/
	
	//updateRState -> 예약 상태 변경(예약 논리 삭제)
	public int updateRState(Connection conn, String rState, int rNo) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update reservation set r_state=? where r_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rState);
			pstmt.setInt(2, rNo);
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
		
	}/*/updateRState*/
	
	
	
	
	
	
	
	
	//delete -> 예약 내역 완전 삭제(근데 안쓰는 방향으로)
	public int delete(Connection conn, int rNo) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from reservation where r_no=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, rNo);
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
		
	}/*/delete*/
	
	
	
	
}// RsvDAO
