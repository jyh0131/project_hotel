package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.khrd.dto.Reservation;
import com.khrd.jdbc.JDBCUtil;

public class RsvDAO {
	private static final RsvDAO dao = new RsvDAO();

	private RsvDAO() {
	}

	public static RsvDAO getInstance() {
		return dao;
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
//				Reservation r = new Reservation(0, 
//												member, 
//												room, 
//												rIn, 
//												rOut, 
//												rTotalPrice, 
//												rRequest, 
//												rPersonnel, 
//												rPayDate, 
//												opNo);
//				list.add(r);
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
