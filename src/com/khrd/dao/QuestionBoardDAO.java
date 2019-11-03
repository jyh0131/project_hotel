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
	// RoomCategory 객체 생성 메소드
	private RoomCategory rcConstructor(ResultSet rs) throws SQLException {
		RoomCategory rc = new RoomCategory(rs.getInt("rc_no"), 
										   rs.getString("rc_name"),
										   rs.getString("rc_eng_name"));
		return rc;  
	}
			
	// ViewType 객체 생성 메소드
	private ViewType vtConstructor(ResultSet rs) throws SQLException {
		ViewType vt = new ViewType(rs.getInt("vt_no"), 
								   rs.getString("vt_name"));
		return vt;
	}
			
	// BedType 객체 생성 메소드
	private BedType btConstructor(ResultSet rs) throws SQLException {
			BedType bt = new BedType(rs.getInt("bt_no"), 
								 	 rs.getString("bt_name"));
		return bt;
	}	
	
	// RoomSize 객체 생성 메소드
	private RoomSize rsConstructor(ResultSet rs) throws SQLException {
		RoomSize rSize = new RoomSize(rs.getInt("rs_no"), 
									  rs.getInt("rs_name"));
		return rSize;
	}	
		
	// Room 객체 생성 메소드
	private Room roomConstructor(ResultSet rs) throws SQLException {
		RoomCategory rc = rcConstructor(rs);
		ViewType vt = vtConstructor(rs);
		BedType bt = btConstructor(rs);
		RoomSize rSize = rsConstructor(rs);

		Room room = new Room(rs.getInt("room_no"), 
							 rs.getInt("room_price"), 
							 rc, // RoomCategory
							 vt, // ViewType
							 bt, // BedType
							 rSize); // RoomSize
		return room;
	}

	// Reservation 객체생성 메소드
	private Reservation RsvConstructor(ResultSet rs) throws SQLException {
		Member m = memConstructor(rs);
		Room r = roomConstructor(rs);

		Reservation rsv = new Reservation(rs.getInt("r_no"), 
										  m, // 회원번호
										  r, // 방호수
										  rs.getTimestamp("r_in"), 
										  rs.getTimestamp("r_out"), 
										  rs.getInt("r_stay"), 
										  rs.getInt("r_total_price"),
										  rs.getString("r_request"), 
										  rs.getInt("r_psnAdt"), 
										  rs.getInt("r_psnCdr"), 
										  rs.getTimestamp("r_pay_date"),
										  rs.getInt("op_no"), 
										  rs.getString("r_state"));
		return rsv;
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
			pstmt.setString(4, qb.getQbCategory());
			pstmt.setString(5, qb.getQbPhone());
			pstmt.setString(6, qb.getQbTel());
			pstmt.setString(7, qb.getQbPath());
			pstmt.setInt(8, qb.getmNo().getmNo());

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}//insertArticle

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
	}//insertContent

	// 고객 게시글 목록에 출력되는 list
	public List<QuestionBoard> selectBoardList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from question_board qb join member m on qb.m_no = m.m_no order by qb.qb_no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<QuestionBoard> list = new ArrayList<>();
			while(rs.next()) {
				QuestionBoard qb = new QuestionBoard(rs.getInt("qb_no"), // 문의번호
													 rs.getString("qb_title"), // 제목
													 rs.getString("qb_name"), // 성명
													 rs.getString("qb_email"), // 이메일
													 rs.getString("qb_category"), // 문의분류 
													 rs.getString("qb_phone"), // 휴대전화
													 rs.getString("qb_tel"), // 자택전화
													 rs.getTimestamp("qb_date"), // 문의날짜
													 rs.getString("qb_path"), // 첨부파일경로
													 memConstructor(rs), // 회원번호
													 null);// 문의내용
				list.add(qb);
			}//while
			return list;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}//selectBoardList
	
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
			if(rs.next()) {
				QuestionBoard qb = new QuestionBoard(rs.getInt("qb_no"), 
						                             rs.getString("qb_title"),
						                             rs.getString("qb_name"), 
						                             rs.getString("qb_email"), 
						                             rs.getString("qb_category"), 
						                             rs.getString("qb_phone"), 
						                             rs.getString("qb_tel"), 
						                             rs.getTimestamp("qb_date"), 
						                             rs.getString("qb_path"), 
						                             memConstructor(rs), 
						                             rs.getString("qc_content"));
				return qb;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
		}
		return null;
	}//selectByQbNo
	
	public int deleteArticle(Connection conn, int qbNo) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from question_board where qb_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qbNo);
			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
	}//deleteArticle
	
	public int deleteContent(Connection conn, int qbNo) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from question_content where qb_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qbNo);
			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		
		return -1;
	}//deleteContent
	
	public int updateArticle(Connection conn, QuestionBoard qb) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update question_board "
					+ "set qb_title=?, qb_category = ?, qb_path = ? "
					+ "where qb_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qb.getQbTitle());
			pstmt.setString(2, qb.getQbCategory());
			pstmt.setString(3, qb.getQbPath());
			pstmt.setInt(4, qb.getQbNo());
			
			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}//updateArticle
	
	public int updateContent(Connection conn, QuestionBoard qb) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update question_content set qc_content=? where qb_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qb.getQcContent());
			pstmt.setInt(2, qb.getQbNo());
			
			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt);
		}
		return -1;
	}//updateContent
}
