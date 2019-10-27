package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.khrd.dto.PayInfo;
import com.khrd.jdbc.JDBCUtil;

public class PayInfoDAO {
	
	private static final PayInfoDAO dao = new PayInfoDAO();

	private  PayInfoDAO() {
	
	}
	
	public static PayInfoDAO getInstance() {
		return dao;
	}
	
	//insert -> 결제정보 저장
	public int insert(Connection conn, PayInfo pi) {
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
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
	}/*/insert*/
	
	
	
}//PayInfoDAO
