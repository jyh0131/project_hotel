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
	
	//selectMonthlyRoomSales - 객실 별 월매출 리스트
	public List<int[]> selectMonthlyRoomSales(Connection conn){
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
/*						+"where r_state = '예약완료' "*/
						+"group by rc_name "
						+"order by rc_no";
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
	}/*/selectMonthlyRoomSales*/
	
	//연도별 전체예약 (취소예약 금액 포함)
	public int selectSalesAll (Connection conn, int year) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select sum(r_total_price) as '총 매출액' "
						+"from vw_all_table "
						+"where year(r_in) = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			rs = pstmt.executeQuery();
			
			int total = rs.getInt(1);
			
			return total;
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		
		return -1; 
		
	}
	
	//연도별 예약 상태에 따른 총 매출액
	public int selectSalesState (Connection conn, int year, String state) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select sum(r_total_price) as '총 매출액' "
						+"from from vw_all_table "
						+"where year(r_in) = ? "
						+"and r_state = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			pstmt.setString(2, state);
			rs = pstmt.executeQuery();
			
			int total = rs.getInt(1);
			
			return total;
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		
		return -1; 
		
	}
	
	//selectCountRequestCategory -> 문의 유형별 문의 건수
	public int[] selectCountRequestCategory(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select "
						+"sum(if(qb_category = 1, 1, 0)) as '결제 문의', "
						+"sum(if(qb_category = 2, 1, 0)) as '예약 문의', "
						+"sum(if(qb_category = 3, 1, 0)) as '객실 문의', "
						+"sum(if(qb_category = 4, 1, 0)) as '시설 및 옵션 문의', "
						+"sum(if(qb_category = 5, 1, 0)) as '기타 문의'"
						+"from question_board order by qb_category";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int[] arr = new int[] {rs.getInt(1),
									   rs.getInt(2),
									   rs.getInt(3),
									   rs.getInt(4),
									   rs.getInt(5)};
				
				return arr;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		
		return null;
		
	}/*/selectCountRequestCategory*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//ChartDAO
