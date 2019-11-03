package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.List;

import com.khrd.jdbc.JDBCUtil;

public class ChartDAO {

	private static final ChartDAO dao = new ChartDAO();

	private ChartDAO() {
	}
	
	public static ChartDAO getInstance() {
		return dao;
	}
	
	public List<String> SelectSalesListByMonth (Connection conn, Date date){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select ";
			pstmt = conn.prepareStatement(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		
		
		
		return null;
	}
	
	
}//ChartDAO
