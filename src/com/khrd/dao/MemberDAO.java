package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

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
			String sql = "insert into member values(null,?,?,?,?,?,?,?,?,?,?,?,?,?)"; 
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
			pstmt.setTimestamp(11, new Timestamp(member.getmRegdate().getTime()));
			pstmt.setTimestamp(12, new Timestamp(member.getmQuitdate().getTime()));
			pstmt.setInt(13, member.getmIsAdmin());			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}
	
}
