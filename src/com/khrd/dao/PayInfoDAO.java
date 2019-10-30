package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.khrd.dto.BedType;
import com.khrd.dto.Member;
import com.khrd.dto.PayInfo;
import com.khrd.dto.Reservation;
import com.khrd.dto.Room;
import com.khrd.dto.RoomCategory;
import com.khrd.dto.RoomSize;
import com.khrd.dto.ViewType;
import com.khrd.jdbc.JDBCUtil;

public class PayInfoDAO {
	
	private static final PayInfoDAO dao = new PayInfoDAO();

	private  PayInfoDAO() {
	
	}
	
	public static PayInfoDAO getInstance() {
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
										  rs.getInt("op_no"),
										  rs.getString("r_state"));
		return rsv;
	}
	
	//payInfo 객체 ㅅ행성
	private PayInfo PayInfoConstructor(ResultSet rs) throws SQLException {
		Reservation rsv = RsvConstructor(rs);
		Member mem = memConstructor(rs);
		
		PayInfo pay = new PayInfo(rs.getInt("p_no"), 
								  rs.getString("p_cardType"), 
								  rs.getString("p_cardNum"), 
								  rs.getString("p_validMonth"), 
								  rs.getString("p_validYear"), 
								  rs.getString("p_bank_name"), 
								  rs.getString("p_bank_no"), 
								  rs.getString("p_bank_sername"), 
								  rsv,
								  mem);
		return pay;
	}
	
/*----------------------------------------------------------------------------------------*/		
	
	//insertPayInfo -> 결제정보 저장
	public int insertPayInfo(Connection conn, PayInfo pi) throws SQLException {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into pay_info "
						+"values(null, ?, ?, ?, ?, null, null, null, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pi.getpCardType());
			pstmt.setString(2, pi.getpCardNum());
			pstmt.setString(3, pi.getpValidMonth());
			pstmt.setString(4, pi.getpValidYear());
			pstmt.setInt(5, pi.getRsv().getrNo());
			pstmt.setInt(6, pi.getMem().getmNo());
			
			return pstmt.executeUpdate();
			
		} finally {
			JDBCUtil.close(pstmt);
		}
	}/*/insertPayInfo*/
	
	//selectPayInfoByRNo -> 예약번호로 결제정보 찾기
	public PayInfo selectPayInfoByRNo(Connection conn, int rNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from room r "
						+"join bed_type b using(bt_no) "
						+"join view_type v using(vt_no) "
						+"join room_category rc using(rc_no) "
						+"join room_size rs using(rs_no) "
						+"join reservation rsv using(room_no) "
						+"join member m using(m_no) "
						+"join pay_info pay using(r_no) "
						+"where r_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				PayInfo pay = PayInfoConstructor(rs);
				
				return pay;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		
		return null;
		
	}/*/selectByRno*/
	
	//deletePayInfo
	public int deletePayInfoByRNo(Connection conn, int rNo) throws SQLException {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from pay_info where r_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rNo);
			
			return pstmt.executeUpdate();
			
		} finally {
			JDBCUtil.close(pstmt);
		}
		
	}/*/deletePayInfo*/


	
	
}//PayInfoDAO
