package com.khrd.handler.questionBoard;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDAO;
import com.khrd.dao.QuestionBoardDAO;
import com.khrd.dao.RsvDAO;
import com.khrd.dto.Member;
import com.khrd.dto.QuestionBoard;
import com.khrd.dto.Reservation;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class QuestionInsertHandler implements CommandHandler {

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
      if(request.getMethod().equalsIgnoreCase("get")) { // 글쓰기 클릭 시 회원 정보 입력되어있게 하기위해
         String mId = request.getParameter("mId");
         
         Connection conn = null;
         
         try {
            conn = ConnectionProvider.getConnection();
            MemberDAO mDao = MemberDAO.getInstance();
            Member member = mDao.selectById(conn, mId);
            request.setAttribute("member", member);
            
            return "/WEB-INF/view/question_board/qbInsertForm.jsp";
         }catch (Exception e) {
            e.printStackTrace();
         }finally {
            JDBCUtil.close(conn);
         }
         
      }else if(request.getMethod().equalsIgnoreCase("post")) {
         
         //upload 폴더 만들기
         String uploadPath = request.getRealPath("upload");
         
         File dir = new File(uploadPath);
         if(dir.exists() == false) {
            dir.mkdir();
         }
         
         int size = 1024 * 1024 * 10;
         MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
         
         String qbCategory = multi.getParameter("qb_category"); // 문의분류
         String qbTitle = multi.getParameter("qb_title"); // 제목
         String qbName = multi.getParameter("qb_name"); // 성명
         String qbEmail = multi.getParameter("qb_email"); // 이메일
         String qbPhone = multi.getParameter("qb_phone"); // 휴대전화
         String qbTel = multi.getParameter("qb_tel"); // 자택전화
         int mNo = Integer.parseInt(multi.getParameter("m_no")); // 회원번호
         String qcContent = multi.getParameter("qc_content"); // 내용
         
         String qbPath = multi.getFilesystemName("qb_file"); // 첨부파일
         
         Connection conn = null;
         
         try {    
            conn = ConnectionProvider.getConnection();
            conn.setAutoCommit(false);
            
            QuestionBoardDAO dao = QuestionBoardDAO.getInstance();
            QuestionBoard qb = new QuestionBoard(0, // 문의 번호
                                        qbTitle, 
                                        qbName, 
                                        qbEmail, 
                                        qbCategory, 
                                        qbPhone, 
                                        qbTel, 
                                        null, // 문의 날짜
                                        qbPath, 
                                        new Member(mNo, null, null, null, null, null, null, null, null, null, null, null, null, 0), 
                                        qcContent);
            dao.insertArticle(conn, qb);
            dao.insertContent(conn, qcContent);
            
            conn.commit();
            
            response.sendRedirect(request.getContextPath() + "/qb/list.do");
            return null;
         }catch (Exception e) {
            e.printStackTrace();
            conn.rollback();
         }finally {
            JDBCUtil.close(conn);
         }
      }
      return null;
   }   

}