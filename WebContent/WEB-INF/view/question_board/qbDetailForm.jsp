<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<style>
   table{
      margin-top:10px;
      width:100%;
   }
   table, th, td{
      border-collapse: collapse;
      padding:20px;
      border-top:1px solid #6D7993;
      border-bottom:1px solid #6D7993;
   }
   th{
      background: rgba(250, 236, 197, 0.8);
      width:20%;
   }
   td{
      min-width:200px;
   }
   #detailTable img{
      width:200px;
   }
   /* ------- 답변 table ------- */
   .replyTable{
      margin-top: 40px;   
   }
   p{
      text-align: right;
      margin-top:30px;
      font-weight: bold;
   }
   /* ------- 목록, 수정하기 등 버튼 ------- */
   #detailDiv a{
      margin-top:20px;
      width:100px;
      line-height: 40px;
      display: inline-block;
      text-align: center;
      color:black;
      background:rgba(71, 163, 218, 0.8);
      /* border:1px solid #353535; */
   }
   #detailDiv a:hover{
      color:rgba(250, 236, 197, 0.8);
   }
   
</style>
<script>
   $(function(){
      // 답글 작성완료 버튼 숨기기
      $(".btnQRFinish").css("display", "none");
      
      // 답글달기 버튼 클릭 시
      $(document).on("click", ".btnReply", function(){
         // 답글 달 수 있는 table만들기
         var $table = $("<table>").addClass("replyTable");
         var $tr = $("<tr>");
         var $th = $("<th>").text("답변내용");
         var content = "<textarea rows='7' cols='80' name='qr_content'></textarea>";
         var $td = $("<td>").html(content);
         
         $tr.append($th).append($td);
         $table.append($tr);
         
         // 문의글 번호 받아오기
         var qbNo = $("input[name='qbNo']").val();
         
         if($(this).text() == "답글달기"){
            $("#replyBox").append($table); // 답글 쓰는 창
            //$(this).text("작성완료");
            $(this).css("display", "none");
            $(".btnQRFinish").css("display", "block");
            //$(".btnReply").attr("href", "${pageContext.request.contextPath }/qr/insert.do?qbNo=" + qbNo);
         }
         /* else{
            alert(qbNo);
            $(".btnReply").attr("href", "${pageContext.request.contextPath }/qr/insert.do?qbNo=" + qbNo);
         } */
      })
      
      
   })
</script>
<div id="detailDiv">
   
   <table id="detailTable">
      <tr>
         <th>제목</th>
         <td>${qb.qbTitle}</td>
         
         <th>문의날짜</th>
         <td>
            <fmt:formatDate value="${qb.qbDate}" pattern="yyyy-MM-dd"/>
         </td>
      </tr>
      <tr>
         <th>문의분류</th>
         <td>
            <c:if test="${qb.qbCategory == '0'}">
               결제 문의
            </c:if>
            <c:if test="${qb.qbCategory == '1'}">
               예약 문의
            </c:if>
            <c:if test="${qb.qbCategory == '2'}">
               객실 문의
            </c:if>
            <c:if test="${qb.qbCategory == '3'}">
               시설 및 옵션 문의
            </c:if>
            <c:if test="${qb.qbCategory == '4'}">
               기타 문의
            </c:if>   
         </td>
            
         <th>성명</th>
         <td>${qb.qbName}</td>
      </tr>
      <tr>
         <th>내용</th>
         <td colspan="3">${qb.qcContent}</td>
      </tr>
      <tr>
         <th>첨부파일</th>
         <td colspan="3"><img src="${pageContext.request.contextPath }/upload/${qb.qbPath}"></td>
      </tr>
   </table>
   
   <div id="replyBox">
		<!-- 답변이 있을 경우 -->
		<c:if test="${qr.qrContent != null }">
			<p>답변일자 <span name="qr_date"><fmt:formatDate value="${qr.qrDate}" pattern="yyyy-MM-dd"/></span></p>
			<table>
				<tr>
					<th>답변내용</th>
					<td>${qr.qrContent }</td>
				</tr>
			</table>
		</c:if>


   </div>
   
   <!-- <p>답변일자 <span name="qr_date">2019-10-10</span></p>
   <table id="replyTable">
      <tr>
         <th>답변내용</th>
         <td>
            <textarea rows="5" cols="70" name="qr_content"></textarea>
         </td>
      </tr>
   </table> -->
   
   
   <a href="${pageContext.request.contextPath }/qb/list.do">목록</a>
   
   <!-- 작성자만 삭제, 수정 가능하게 하기위해 로그인한 아이디와 작성자 아이디를 비교 -->
   <c:if test="${Auth == qb.member.mId }"> 
      <a href="${pageContext.request.contextPath }/qb/update.do?qbNo=${qb.qbNo}">게시글 수정</a>
      <a href="${pageContext.request.contextPath }/qb/delete.do?qbNo=${qb.qbNo}">게시글 삭제</a>
   </c:if> 

   <!-- 관리자일 경우 -->
   <c:if test="${Admin != null }">
      <form action="${pageContext.request.contextPath }/qr/insert.do" method="post">
         <input type="hidden" value="${qb.qbNo }" name="qbNo">
         <input type="submit" value="답글달기" class="btnQRFinish">
      </form>
      <a class="btnReply">답글달기</a>
      <%-- <a href="${pageContext.request.contextPath }/qb/reply.do?qbNo=${qb.qbNo}">답글달기</a> --%>
      
   </c:if>
</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>