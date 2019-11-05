package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.khrd.dto.QuestionBoard;
import com.khrd.dto.QuestionReply;
import com.khrd.jdbc.JDBCUtil;

public class QuestionReplyDAO {
	private static final QuestionReplyDAO dao = new QuestionReplyDAO();
	
	public static QuestionReplyDAO getInstance() {
		return dao;
	}
	
	private QuestionReplyDAO() {
		
	}
	
	public int insert(Connection conn, QuestionReply qr) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into question_reply values(null, ?, now(), ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qr.getQrContent());
			pstmt.setInt(2, qr.getQb().getQbNo());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}

	public QuestionReply selectByQbNo(Connection conn, int qbNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from question_reply qr \r\n" 
								+ "join question_board qb on qr.qb_no = qb.qb_no \r\n" 
								+ "where qr.qb_no = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qbNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				QuestionReply qr = new QuestionReply(rs.getInt("qr_no"), 
													 rs.getString("qr_content"), 
													 rs.getTimestamp("qr_date"),
													 new QuestionBoard(qbNo, null, null, null, 0, null, null, null, null, null, null));
				return qr;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}//selectByQbNo
	
	public int delete(Connection conn, int qrNo) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from question_reply where qr_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qrNo);
			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
	}//delete
	
	public QuestionReply selectByQrNo(Connection conn, int qrNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from question_board qb \r\n" 
							+ "join question_content qc on qb.qb_no = qc.qb_no\r\n" 
							+ "join question_reply qr on qb.qb_no = qr.qb_no\r\n" 
							+ "where qr.qr_no = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qrNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				QuestionReply qr = new QuestionReply(rs.getInt("qr_no"), 
													 rs.getString("qr_content"), 
													 rs.getTimestamp("qr_date"),
													 new QuestionBoard(qrNo, null, null, null, 0, null, null, null, null, null, null));
				return qr;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}//selectByQrNo
	
	
	public int update(Connection conn, QuestionReply qr) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update question_reply set qr_content = ? where qr_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qr.getQrContent());
			pstmt.setInt(2, qr.getQrNo());
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}
	
	
	
}
