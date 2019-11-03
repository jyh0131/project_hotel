package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
	
	public List<int[]> SelectMonthlyRoomSales(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select "
						+"sum(if(month(r_in)=1, r_total_price, 0)) as '1월', "
						+"sum(if(month(r_in)=2, r_total_price, 0)) as '2월', "
						+"sum(if(month(r_in)=3, r_total_price, 0)) as '3월', "
						+"sum(if(month(r_in)=4, r_total_price, 0)) as '4월', "
						+"sum(if(month(r_in)=5, r_total_price, 0)) as '5월', "
						+"sum(if(month(r_in)=6, r_total_price, 0)) as '6월', "
						+"sum(if(month(r_in)=7, r_total_price, 0)) as '7월', "
						+"sum(if(month(r_in)=8, r_total_price, 0)) as '8월', "
						+"sum(if(month(r_in)=9, r_total_price, 0)) as '9월', "
						+"sum(if(month(r_in)=10, r_total_price, 0)) as '10월', "
						+"sum(if(month(r_in)=11, r_total_price, 0)) as '11월', "
						+"sum(if(month(r_in)=12, r_total_price, 0)) as '12월' "
						+"from vw_all_table "
						+"group by rc_name";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<int[]> list = new ArrayList<>();
			
			while(rs.next()) {
				list.add(new int[] {rs.getInt(1), 
									rs.getInt(2),
									rs.getInt(3),
									rs.getInt(4),
									rs.getInt(5),
									rs.getInt(6),
									rs.getInt(7),
									rs.getInt(8),
									rs.getInt(9),
									rs.getInt(10),
									rs.getInt(11),
									rs.getInt(12)});
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		
		return null;
	}
	
}//ChartDAO
