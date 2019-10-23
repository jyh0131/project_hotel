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
	
	//selectList
	public List<Reservation> selectList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from reservation";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<Reservation> list = new ArrayList<>();
			
			while(rs.next()) {
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
	
	//selectByRNo
	public Reservation selectByRNo(Connection conn, int rNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "";
			pstmt = conn.prepareStatement(sql);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		
		return null;
		
	}/*/selectByRNo*/
	
	//insert
	public int insert(Connection conn, Reservation rsv) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into reservation values (0, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			//insert into reservation values (r_no, m_no, room_no, r_in, r_out, r_total_price, r_request, r_personnel, r_pay_date, op_no);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rsv.getMember().getmNo());
			pstmt.setInt(2, rsv.getRoom().getRoomNo());
			pstmt.setTimestamp(3, new Timestamp(rsv.getrIn().getTime()));
			pstmt.setTimestamp(4, new Timestamp(rsv.getrOut().getTime()));
			pstmt.setInt(5, rsv.getrTotalPrice());
			pstmt.setString(6, rsv.getrRequest());
			pstmt.setInt(7, rsv.getrPersonnel());
			pstmt.setTimestamp(8, new Timestamp(rsv.getrPayDate().getTime()));
			pstmt.setInt(10, rsv.getOpNo());
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
		
	}/*/insert*/
	
	//delete
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
