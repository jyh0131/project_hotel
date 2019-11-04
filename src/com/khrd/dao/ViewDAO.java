package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.khrd.jdbc.JDBCUtil;

public class ViewDAO {
	//뷰를 생성하는 DAO
	
	private static final ViewDAO dao = new ViewDAO();

	private ViewDAO() {
	}
	
	public static ViewDAO getInstance() {
		return dao;
	}
	
	//모든 정보를 담고 있는 뷰
	public void createViewAllTable(Connection conn) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "create or replace view vw_all_table "
						+"as select r_no, m.m_no, room_no, rs_no, rc_no, vt_no, bt_no, "
						+"room_price, bt_name, vt_name, rc_name, rc_eng_name, rs_name, "
						+"r_in, r_out, r_stay, r_total_price, r_request, "
						+"r_psnAdt, r_psnCdr, r_pay_date, op_no, r_state, "
						+"m_name, m_birth, m_mail, m_phone, m_tel, m_zipcode, m_addr1, m_addr2, "
						+"m_id, m_pwd, m_regdate, m_quitdate, m_isAdmin, "
						+"p_no, p_cardType, p_cardNum, p_validMonth, p_validYear, "
						+"p_bank_name, p_bank_no, p_bank_sername "
						+"from room r join bed_type b using(bt_no) "
						+"join view_type v using(vt_no) "
						+"join room_category rc using(rc_no) "
						+"join room_size rs using(rs_no) "
						+"left join reservation rsv using(room_no) "
						+"left join member m using(m_no) "
						+"left join pay_info pay using(r_no) "
						+"order by room_no";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(pstmt);
		}
		
	}//createViewAllTable
	
	//createViewAvailableRoom -> 예약가능한 빈방 정보 뷰
	public void createViewAvailableRoom (Connection conn, String inDate, String outDate) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "create or replace view vw_available "
						+"as select * from "
						+"(select * from vw_all_table "
						+"where !((r_in >= ? and r_in <= ?) "
						+"or (r_out >= ? and r_out <= ?))) as rsv "
						+"where !((r_in <= ? and r_out >= ?) "
						+"or (r_in <= ? and r_out >= ?)) "
						+"union "
						+"select * from vw_all_table "
						+"where r_in is null and r_out is null";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inDate);
			pstmt.setString(2, outDate);
			pstmt.setString(3, inDate);
			pstmt.setString(4, outDate);
			pstmt.setString(5, inDate);
			pstmt.setString(6, inDate);
			pstmt.setString(7, outDate);
			pstmt.setString(8, outDate);
			
			pstmt.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(pstmt);
		}
		
	}/*/createViewAvailableRoom*/
	
}//ViewDAO
