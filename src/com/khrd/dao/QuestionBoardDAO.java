package com.khrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.khrd.dto.BedType;
import com.khrd.dto.Member;
import com.khrd.dto.QuestionBoard;
import com.khrd.dto.Reservation;
import com.khrd.dto.Room;
import com.khrd.dto.RoomCategory;
import com.khrd.dto.RoomSize;
import com.khrd.dto.ViewType;
import com.khrd.jdbc.JDBCUtil;
import com.sun.xml.internal.messaging.saaj.packaging.mime.util.QEncoderStream;

public class QuestionBoardDAO {
	private static final QuestionBoardDAO dao = new QuestionBoardDAO();

	public static QuestionBoardDAO getInstance() {
		return dao;
	}

	private QuestionBoardDAO() {

	}

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

	// QuestionBoard 객체 생성 메소드
	private QuestionBoard qbConstructor(ResultSet rs) throws SQLException {
		QuestionBoard qb = new QuestionBoard(rs.getInt("qb_no"), // 문의번호
											 rs.getString("qb_title"), // 제목
											 rs.getString("qb_name"), // 성명
											 rs.getString("qb_email"), // 이메일
											 rs.getInt("qb_category"), // 문의분류
											 rs.getString("qb_phone"), // 휴대전화
											 rs.getString("qb_tel"), // 자택전화
											 rs.getTimestamp("qb_date"), // 문의날짜
											 rs.getString("qb_path"), // 첨부파일경로
											 memConstructor(rs), // 회원번호
											 null);// 문의내용
		return qb;
	}

	/*-------------------------------------*/
	public int insertArticle(Connection conn, QuestionBoard qb) {
		PreparedStatement pstmt = null;

		try {
			String sql = "insert into question_board values(null, ?, ?, ?, ?, ?, ?, now(), ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qb.getQbTitle());
			pstmt.setString(2, qb.getQbName());
			pstmt.setString(3, qb.getQbEmail());
			pstmt.setInt(4, qb.getQbCategory());
			pstmt.setString(5, qb.getQbPhone());
			pstmt.setString(6, qb.getQbTel());
			pstmt.setString(7, qb.getQbPath());
			pstmt.setInt(8, qb.getMember().getmNo());

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}// insertArticle

	public int insertContent(Connection conn, String content) {
		PreparedStatement pstmt = null;

		try {
			String sql = "insert into question_content values(?, last_insert_id())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}// insertContent

	// 고객 게시글 목록에 출력되는 list
	public List<QuestionBoard> selectBoardList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select * from question_board qb join member m on qb.m_no = m.m_no order by qb.qb_no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<QuestionBoard> list = new ArrayList<>();
			while (rs.next()) {
				QuestionBoard qb = new QuestionBoard(rs.getInt("qb_no"), // 문의번호
												 	 rs.getString("qb_title"), // 제목
													 rs.getString("qb_name"), // 성명
													 rs.getString("qb_email"), // 이메일
													 rs.getInt("qb_category"), // 문의분류
													 rs.getString("qb_phone"), // 휴대전화
													 rs.getString("qb_tel"), // 자택전화
													 rs.getTimestamp("qb_date"), // 문의날짜
													 rs.getString("qb_path"), // 첨부파일경로
													 memConstructor(rs), // 회원번호
													 null);// 문의내용
				list.add(qb);
			} // while
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}// selectBoardList

	// id별 리스트 조회
	public List<QuestionBoard> selectByMIdList(Connection conn, String mId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select * from question_board qb \r\n" 
							+ "join member m on qb.m_no = m.m_no \r\n"
							+ "where m.m_id = ? \r\n" 
							+ "order by qb.qb_no desc";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			List<QuestionBoard> list = new ArrayList<>();

			while (rs.next()) {
				QuestionBoard qb = new QuestionBoard(rs.getInt("qb_no"), 
													 rs.getString("qb_title"),
													 rs.getString("qb_name"), 
													 rs.getString("qb_email"), 
													 rs.getInt("qb_category"),
<<<<<<< HEAD
													 rs.getString("qb_phone"), 
													 rs.getString("qb_tel"), 
													 rs.getTimestamp("qb_date"),
													 rs.getString("qb_path"), 
													 memConstructor(rs), 
													 null);
=======
													 rs.getString("qb_phone"),
													 rs.getString("qb_tel"), 
													 rs.getTimestamp("qb_date"),
													 rs.getString("qb_path"), 
													 memConstructor(rs), null);
>>>>>>> branch 'master' of https://github.com/jyh0131/project_hotel.git
				list.add(qb);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}// selectByMNo

	public QuestionBoard selectByQbNo(Connection conn, int qbNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select * from question_board qb \r\n"
							+ "join question_content qc on qb.qb_no = qc.qb_no \r\n"
							+ "join member m on qb.m_no = m.m_no \r\n" 
							+ "where qb.qb_no = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qbNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				QuestionBoard qb = new QuestionBoard(rs.getInt("qb_no"), 
													 rs.getString("qb_title"),
													 rs.getString("qb_name"), 
													 rs.getString("qb_email"), 
													 rs.getInt("qb_category"),
<<<<<<< HEAD
													 rs.getString("qb_phone"),
=======
													 rs.getString("qb_phone"), 
>>>>>>> branch 'master' of https://github.com/jyh0131/project_hotel.git
													 rs.getString("qb_tel"), 
													 rs.getTimestamp("qb_date"),
													 rs.getString("qb_path"), 
													 memConstructor(rs), 
													 rs.getString("qc_content"));
				return qb;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}// selectByQbNo

	public int deleteArticle(Connection conn, int qbNo) {
		PreparedStatement pstmt = null;

		try {
			String sql = "delete from question_board where qb_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qbNo);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}

		return -1;
	}// deleteArticle

	public int deleteContent(Connection conn, int qbNo) {
		PreparedStatement pstmt = null;

		try {
			String sql = "delete from question_content where qb_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qbNo);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}

		return -1;
	}// deleteContent

	public int updateArticle(Connection conn, QuestionBoard qb) {
		PreparedStatement pstmt = null;

		try {
			String sql = "update question_board " + "set qb_title=?, qb_category = ?, qb_path = ? " + "where qb_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qb.getQbTitle());
			pstmt.setInt(2, qb.getQbCategory());
			pstmt.setString(3, qb.getQbPath());
			pstmt.setInt(4, qb.getQbNo());

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}// updateArticle

	public int updateContent(Connection conn, QuestionBoard qb) {
		PreparedStatement pstmt = null;

		try {
			String sql = "update question_content set qc_content=? where qb_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qb.getQcContent());
			pstmt.setInt(2, qb.getQbNo());

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}// updateContent

	// 카테고리별로 게시글 목록에 출력되는 list
	public List<QuestionBoard> selectCategoryList(Connection conn, int category) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select * from question_board qb \r\n"
								+ "join member m on qb.m_no = m.m_no \r\n"
								+ "where qb.qb_category = ? \r\n"
								+ "order by qb.qb_no desc;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, category);
			rs = pstmt.executeQuery();
			List<QuestionBoard> list = new ArrayList<>();
			
			while (rs.next()) {
				QuestionBoard qb = new QuestionBoard(rs.getInt("qb_no"), // 문의번호
													 rs.getString("qb_title"), // 제목
												 	 rs.getString("qb_name"), // 성명
													 rs.getString("qb_email"), // 이메일
													 rs.getInt("qb_category"), // 문의분류
													 rs.getString("qb_phone"), // 휴대전화
													 rs.getString("qb_tel"), // 자택전화
													 rs.getTimestamp("qb_date"), // 문의날짜
													 rs.getString("qb_path"), // 첨부파일경로
													 memConstructor(rs), // 회원번호
													 null);// 문의내용
				list.add(qb);
			} // while
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}// selectCategoryList
<<<<<<< HEAD

	// 페이징 - 전체 row 검색(count)
	public int qbNoTotalCount(Connection conn) {
		int cnt = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select count(*) from question_board order by qb_no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return -1;
	} // qbNoTotalCount
	
	// 페이징 - 원하는 row에서 몇개의 row를 select할 것인지 정함
	public List<QuestionBoard> selectByQbNoList(Connection conn, int startRow, int size){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from question_board order by qb_no desc limit  ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			List<QuestionBoard> list = new ArrayList<QuestionBoard>();
			while(rs.next()) {
				QuestionBoard qb = new QuestionBoard(rs.getInt("qb_no"), 
													 rs.getString("qb_title"),
													 rs.getString("qb_name"), 
													 rs.getString("qb_email"), 
													 rs.getInt("qb_category"),
													 rs.getString("qb_phone"), 
													 rs.getString("qb_tel"), 
													 rs.getTimestamp("qb_date"),
													 rs.getString("qb_path"), 
													 null, 
													 null);
				
				list.add(qb);             
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	} // selectByQbNoList
=======
	
>>>>>>> branch 'master' of https://github.com/jyh0131/project_hotel.git
}
