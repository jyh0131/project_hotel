package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

	private MemberDAO() {
	}

	/*----------------------------------------------------------------------------------------*/
	// Member 객체 생성 메소드
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
	/*----------------------------------------------------------------------------------------*/

	// 회원 등록
	public int insert(Connection conn, Member member) {
		PreparedStatement pstmt = null;

		try {
			String sql = "insert into member values(null,?,?,?,?,?,?,?,?,?,?,now(),null,?)";
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
			pstmt.setInt(11, member.getmIsAdmin());

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}

	// 아이디와 비밀번호가 일치하는 회원 찾기
	public Member selectIdAndPw(Connection conn, String id, String pwd) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select * from member where m_id = ? and m_pwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				Member member = memConstructor(rs);

				return member;
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}

		return null;
	}

	// 이메일로 회원 찾기
	public Member selectByEmail(Connection conn, String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select * from member where m_mail = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				Member member = memConstructor(rs);

				return member;
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}

		return null;
	}

	// 아이디로 회원찾기
	public Member selectById(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select * from member where m_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				Member member = memConstructor(rs);

				return member;
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}

		return null;
	}

	// 회원 전체 리스트
	public List<Member> selectList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> list = null;

		try {
			String sql = "select * from member order by m_no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<>();

			while (rs.next()) {
				Member member = memConstructor(rs);

				list.add(member);
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

	//일반회원 or 관리자회원 리스트
	public List<Member> selectIsAdminList(Connection conn, int isAdmin) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> list = null;

		try {
			String sql = "select * from member where m_isAdmin = ? order by m_no desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, isAdmin);
			rs = pstmt.executeQuery();
			list = new ArrayList<>();

			while (rs.next()) {
				Member member = memConstructor(rs);

				list.add(member);
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

	// 일반회원 중 탈퇴회원 리스트
	public List<Member> selectQuitMember(Connection conn, int isAdmin) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select * from member where m_isAdmin = ? and m_quitdate is not null order by m_no desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, isAdmin);
			rs = pstmt.executeQuery();

			List<Member> list = new ArrayList<>();

			while (rs.next()) {
				Member member = memConstructor(rs);

				list.add(member);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			JDBCUtil.close(pstmt);
		}

		return null;
	}

	// 아직 존재하는 일반회원 리스트
	public List<Member> selectNotQuitMember(Connection conn, int isAdmin) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select * from member where m_isAdmin = ? and m_quitdate is null order by m_no desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, isAdmin);
			rs = pstmt.executeQuery();

			List<Member> list = new ArrayList<>();

			while (rs.next()) {
				Member member = memConstructor(rs);

				list.add(member);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			JDBCUtil.close(pstmt);
		}

		return null;
	}

	// 비밀번호 바꾸기
	public int PwdUpdate(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		try {
			String sql = "update member set m_pwd=? where m_id =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getmPwd());
			pstmt.setString(2, member.getmId());

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			JDBCUtil.close(pstmt);
		}

		return -1;

	}

	// 회원 정보 바꾸기
	public int MemberUpdate(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		try {
			String sql = "update member set m_mail=?, m_phone=?, m_tel=?, m_zipcode=?, m_addr1=?, m_addr2=? where m_id =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getmMail());
			pstmt.setString(2, member.getmPhone());
			pstmt.setString(3, member.getmTel());
			pstmt.setString(4, member.getmZipcode());
			pstmt.setString(5, member.getmAddr1());
			pstmt.setString(6, member.getmAddr2());
			pstmt.setString(7, member.getmId());

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			JDBCUtil.close(pstmt);
		}

		return -1;

	}

	// 회원 탈퇴 (회원 목록은 유지하되 탈퇴일의 null여부로 탈퇴회원여부 판단. 논리삭제.)
	public int updateMemberToSecession(Connection conn, String mId) {
		PreparedStatement pstmt = null;

		try {
			String sql = "update member set m_quitdate=now() where m_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			JDBCUtil.close(pstmt);
		}

		return -1;

	}

	// 회원 삭제 (근데 우리는 논리 삭제를 사용할거니까 당장은 사용 안함.)
	public int delete(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		try {
			String sql = "delete from member where m_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mNo);

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			JDBCUtil.close(pstmt);
		}

		return -1;
	}

	public int selectedByMNo(Connection conn, int mNo) {
		PreparedStatement pstmt = null;

		try {
			String sql = "select * from member where m_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mNo);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}

}// MemberDAO
