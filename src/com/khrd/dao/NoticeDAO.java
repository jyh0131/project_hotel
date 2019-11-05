package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.khrd.dto.Member;
import com.khrd.dto.Notice;
import com.khrd.jdbc.JDBCUtil;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class NoticeDAO {
	private static final NoticeDAO dao = new NoticeDAO();
	
	private NoticeDAO () {
		
	}
	
	public static NoticeDAO getInstance() {
		return dao;
	}
	
	/*----------------------------------------------------------------------------------*/
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
	
	//Notice 객체 생성 메소드
	private Notice noticeConstructor(ResultSet rs) throws SQLException {
		Notice nt = new Notice(rs.getInt("nt_no"), 
							   rs.getString("nt_title"), 
							   rs.getString("nt_content"), 
							   rs.getTimestamp("nt_regdate"), 
							   rs.getTimestamp("nt_moddate"), 
							   rs.getString("nt_file"), 
							   memConstructor(rs));
		
		return nt;
	}
	/*----------------------------------------------------------------------------------*/
	//insertNotice -> 공지 등록
	public int insertNotice(Connection conn, Notice nt) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into notice values(0, ?, ?, now(), null, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nt.getNtTitle());
			pstmt.setString(2, nt.getNtContent());
			pstmt.setString(3, nt.getNtFile());
			pstmt.setInt(4, nt.getMember().getmNo());
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
		
	}/*/insertNotice*/
	
	//deleteNotice -> 공지 삭제
	public int deleteNotice(Connection conn, int ntNo) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from notice where nt_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ntNo);
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
		
	}/*/deleteNotice*/
	
	//selectNoticeList
	public List<Notice> selectNoticeList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from notice nt join member m using(m_no) order by nt_no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<Notice> list = new ArrayList<>();
			
			while(rs.next()) {
				Notice nt = noticeConstructor(rs);
				
				list.add(nt);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		
		return null;
		
	}/*/selectNoticeList*/

	//selectNotice
	public Notice selectNotice(Connection conn, int ntNo){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from notice nt join member m using(m_no) where nt_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ntNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Notice ntc = noticeConstructor(rs);
				
				return ntc;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		
		return null;
		
	}/*/selectNotice*/

	//updateNotice -> 공지 글 수정
	public int updateNotice(Connection conn, Notice nt) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update notice "
						+"set nt_title=?, nt_content=?, nt_file=?, nt_moddate=now() "
						+"where nt_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nt.getNtTitle());
			pstmt.setString(2, nt.getNtContent());
			pstmt.setString(3, nt.getNtFile());
			pstmt.setInt(4, nt.getNtNo());
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
		
	}/*/updateNotice*/
	
	
	
	
	
}//NoticeDAO
