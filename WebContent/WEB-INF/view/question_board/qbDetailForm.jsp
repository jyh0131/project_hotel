<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<style>
	#detailDiv{
		width:1000px;
		margin:0 auto;
	}
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
  .btnList{
		margin-top:20px;
		width:100px;
		line-height: 40px;
		display: inline-block;
		text-align: center;
		color:black;
		background:rgba(250, 236, 197, 0.8);
		border:1px solid #FFE5CA;
		
	}
	.btnList:hover{
		color:rgba(71, 163, 218, 0.8);
	}
   /* ------- 답글달기, 삭제하기, 수정하기 버튼 ------- */
	#btnBox{
		width:300px;
		float: right;
	}
	.btn{
		margin-top:20px;
		margin-left:20px;
		width:100px;
		line-height: 40px;
		display: inline-block;
		text-align: center;
		color:black;
		background:rgba(71, 163, 218, 0.8);
		border:none;
		float: right;
		font-size: 16px;
	}
	.btn:hover{
		color:rgba(250, 236, 197, 0.8);
	}
</style>
<script>
   $(function(){
		// 첨부파일 없을 경우
		var src = $(".imgFile").attr("src");
		if(src == "/project_hotel/upload/"){
			$(".imgFile").parent().text("첨부파일 없음");
		}
		
		// 삭제버튼 클릭 시 한번 더 확인하기
		$(".btnDelete").click(function(){
			var a = confirm("정말 삭제하시겠습니까?");
			if(a == true){
				return true;
			}else{
				return false;
			}
		})
   })//ready
</script>
<div id="detailDiv">
	<h1>문의하기</h1>
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
            <c:if test="${qb.qbCategory == 1}">
              	 결제 문의
            </c:if>
            <c:if test="${qb.qbCategory == 2}">
          	     예약 문의
            </c:if>
            <c:if test="${qb.qbCategory == 3}">
             	  객실 문의
            </c:if>
            <c:if test="${qb.qbCategory == 4}">
               	시설 및 옵션 문의
            </c:if>
            <c:if test="${qb.qbCategory == 5}">
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
         <td colspan="3">
         	<img src="${pageContext.request.contextPath }/upload/${qb.qbPath}" class="imgFile">
         </td>
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
   
   
   <a href="${pageContext.request.contextPath }/qb/list.do" class="btnList">목록</a>
   
   <!-- 작성자만 삭제, 수정 가능하게 하기위해 로그인한 아이디와 작성자 아이디를 비교 -->
   <div id="btnBox">
	   <c:if test="${Auth == qb.member.mId }"> 
	      <a href="${pageContext.request.contextPath }/qb/update.do?qbNo=${qb.qbNo}" class="btn">게시글 수정</a>
	      <a href="${pageContext.request.contextPath }/qb/delete.do?qbNo=${qb.qbNo}" class="btn btnDelete">게시글 삭제</a>
	   </c:if> 
   </div>

</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>