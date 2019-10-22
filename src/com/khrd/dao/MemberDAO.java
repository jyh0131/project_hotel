package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.khrd.dto.Member;
import com.khrd.jdbc.JDBCUtil;

public class MemberDAO {
	private static final MemberDAO dao = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return dao;
	}
	
	private MemberDAO() {}
	
	public int insert(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into member values(null,?,?,?,?,?,?,?,?,?,?,now(),null,0)"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getmName());
			pstmt.setTimestamp(2, new Timestamp(member.getmBirth().getTime()));
			pstmt.setString(3, member.getmMail());
			pstmt.setString(4, member.getmPhone());
			pstmt.setString(5, member.getmTel());
			pstmt.setString(6, member.getmZipcode());
			pstmt.setString(7, member.getmAddr1());
			pstmt.setString(8, member.getmAddr2());
			pstmt.setString(9, member.getmId());
			pstmt.setString(10, member.getmPwd());	
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}
	public Member selectIdAndPw(Connection conn, String id, String pwd) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from member where m_id = ? and m_pwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Member member = new Member(rs.getInt("m_no"),
											rs.getString("m_name"),
											rs.getDate("m_birth"),
											rs.getString("m_mail"), 
											rs.getString("m_phone"),
											rs.getString("m_tel"),
											rs.getString("m_zipcode"),
											rs.getString("m_addr1"),
											rs.getString("m_addr2"),
											rs.getString("m_id"),
											rs.getString("m_pwd"),
											rs.getDate("m_regdate"),
											rs.getDate("m_quitdate"),
											rs.getInt("m_isAdmin"));
					return member;  
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}
		return null;
	}
	public Member selectById(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from member where m_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Member member = new Member(rs.getInt("m_no"),
						rs.getString("m_name"),
						rs.getDate("m_birth"),
						rs.getString("m_mail"), 
						rs.getString("m_phone"),
						rs.getString("m_tel"),
						rs.getString("m_zipcode"),
						rs.getString("m_addr1"),
						rs.getString("m_addr2"),
						rs.getString("m_id"),
						rs.getString("m_pwd"),
						rs.getDate("m_regdate"),
						rs.getDate("m_quitdate"),
						rs.getInt("m_isAdmin"));
					return member;  
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}
		return null;
	}
	public List<Member> selectList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> list = null;
		try {
			String sql = "select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<>();
			while(rs.next()) {
				Member member = new Member(rs.getInt("m_no"),
						rs.getString("m_name"),
						rs.getDate("m_birth"),
						rs.getString("m_mail"), 
						rs.getString("m_phone"),
						rs.getString("m_tel"),
						rs.getString("m_zipcode"),
						rs.getString("m_addr1"),
						rs.getString("m_addr2"),
						rs.getString("m_id"),
						rs.getString("m_pwd"),
						rs.getDate("m_regdate"),
						rs.getDate("m_quitdate"),
						rs.getInt("m_isAdmin")); 
				list.add(member);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs); 
		}
		
		return null;
		
	}
	public int update(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		System.out.println(member);
		try {
			String sql = "update member set m_pwd=? where m_id =?";
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, member.getmPwd());
			pstmt.setString(2, member.getmId());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}
	
}
