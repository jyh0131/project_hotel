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
	/* ------- 목록버튼 ------- */
	.btnList{
		margin-top:20px;
		width:100px;
		line-height: 40px;
		display: inline-block;
		text-align: center;
		color:black;
		background:rgba(250, 236, 197, 0.8);
		border:1px solid rgba(250, 236, 197, 0.8);
	}
	.btnList:hover{
		color:#6D7993;
	}
	/* ------- 답글달기, 삭제하기, 수정하기 버튼 ------- */
	#btnBox{
		width:300px;
		float: right;
	}
	.btnReply, .btnQRFinish, .qr_btn_delete, .qr_btn_update, .btnQRUpdateFinish{
		margin-top:20px;
		margin-left:20px;
		width:100px;
		line-height: 40px;
		display: inline-block;
		text-align: center;
		color:black;
		background:rgba(71, 163, 218, 0.8);
		border:1px solid rgba(71, 163, 218, 0.8);
		float: right;
	}
	.btnReply:hover, .btnQRFinish:hover, .qr_btn_delete:hover, .qr_btn_update:hover, .btnQRUpdateFinish:hover{
		color:rgba(250, 236, 197, 0.8);
	}
</style>
<script>
	$(function(){
		// 답글 작성완료 버튼 숨기기
	    $(".btnQRFinish").css("display", "none");
	    $("#insertBox").css("display", "none");
	    $("#updateBox").css("display", "none");
	    $(".btnQRUpdateFinish").css("display", "none");
	    
		// 답글의 내용이 있으면 답글수정, 삭제버튼 나오게 하기
	    /* if($(".content").val() == ""){
	    	$("#btnBox").css("display", "none");
	    }else{// 답글의 내용이 없으면
	    	$("#btnBox").css("display", "block");
	    	$(".btnReply").css("display", "none");
	    }	  
	     */
	    // 답글달기 버튼 클릭 시
	    $(document).on("click", ".btnReply", function(){
	    	if($(this).text() == "답글달기"){
	        	$(this).css("display", "none"); // 답글달기 버튼 숨기기
	            $("#insertBox").css("display", "block"); // 답글 쓰는 창 나오게 하기.
	            $(".btnQRFinish").css("display", "block"); // 작성완료 버튼 나오게 하기
			}
		})//btnReply
	      
		$("input[type='submit']").click(function(){
			
		})
	      
	      
	    	  
	    // 답글삭제 버튼 클릭 시
		$(".qr_btn_delete").click(function(){
	    	var qrNo = $(this).attr("data-qrNo");
			
	    	$.ajax({
	    		url:"${pageContext.request.contextPath }/qr/delete.do",
	    		type:"get",
	    		data:{"qrNo": qrNo},
	    		dataType:"json",
	    		success:function(res){
					console.log(res);
				},
				error:function(e){
					console.log(e);
				}
			})//ajax
			
			$(".replyBox").remove();
	    	
			$("#btnBox").css("display", "none");
		    $("#btnReplyBox").css("display", "block");
		    $(".btnReply").css("display", "block");
		})//qr_btn_delete 
	    
		
		/* // 답글수정 버튼 클릭 시
		$(".qr_btn_update").click(function(){
	    	var qrNo = $(this).attr("data-qrNo");
	    	var qbNo = $(this).attr("data-qbNo");
			var qrContent = $(this).attr("data-qrContent");
	    	
	    	$.ajax({
	    		url:"${pageContext.request.contextPath }/qr/update.do",
	    		type:"get",
	    		data:{"qrNo": qrNo, "qbNo": qbNo, "qrContent": qrContent },
	    		dataType:"json",
	    		success:function(res){
					console.log(res);
					$(".replyBox").css("display", "none"); // insert 테이블 숨기기
					$("#updateBox").css("display", "block"); // update 테이블 나오게 하기
					$(".qr_btn_update").css("display", "none"); // 답글수정 버튼 숨기기
					$(".qr_btn_delete").css("display", "none"); // 답글삭제 버튼 숨기기
					$(".btnQRUpdateFinish").css("display", "block"); // 수정완료 버튼 나오게 하기
					
					
				},
				error:function(e){
					console.log(e);
				}
			})//ajax
			
			
			/* $(".replyBox").remove();
	    	
			$("#btnBox").css("display", "none");
		    $("#btnReplyBox").css("display", "block");
		    $(".btnReply").css("display", "block"); *
		})//qr_btn_update
	      */ 
	})
</script>
<div id="detailDiv">
	<form action="insert.do" method="post">
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
					<c:if test="${qb.qbCategory == 0}">
						결제 문의
					</c:if>
					<c:if test="${qb.qbCategory == 1}">
						예약 문의
					</c:if>
					<c:if test="${qb.qbCategory == 2}">
						객실 문의
					</c:if>
					<c:if test="${qb.qbCategory == 3}">
						시설 및 옵션 문의
					</c:if>
					<c:if test="${qb.qbCategory == 4}">
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
		
		
		<!-- insert -->
		<!-- 답글달기 버튼 눌렀을 때 작성하는 테이블 -->
		<div id="insertBox">
			<p>답변일자 : </p>
			<table id="replyTable">
				<tr>
					<th>답변내용</th>
					<td>
						<textarea rows="5" cols="70" name="qr_content"></textarea>
					</td>
				</tr>
			</table>
		</div>
		
		<!-- 답변이 있을 경우 -->
		<%-- <c:if test="${qr.qrContent != null }"> --%>
		<div class="replyBox">
				<p>답변일자 <span name="qr_date"><fmt:formatDate value="${qr.qrDate}" pattern="yyyy-MM-dd"/></span></p>
				<table>
					<tr>
						<th>답변내용</th>
						<td>${qr.qrContent }</td>
					</tr>
				</table>
		</div>
			<%-- </c:if> --%>
		
		
		<input type="hidden" value="${qr.qrContent }" class="content" name="qr_content_hidden">
		
		<c:if test="${Admin != null }">
			<input type="hidden" value="${qb.qbNo }" name="qbNo">
			
		<%-- 	<c:if test="${qr.qrContent == null }">
				<a class="btnReply">답글달기</a>
			</c:if> --%>
		</c:if>		
		
		<input type="submit" value="작성완료" class="btnQRFinish">
	</form> 
		
	<!-- update -->
	<div id="updateBox">
		<form action="update.do" method="post">
		<!-- 답글달기 버튼 눌렀을 때 작성하는 테이블 -->
			<p>답변일자 : </p>
			<table id="replyTable">
				<tr>
					<th>답변내용</th>
					<td>
						<textarea rows="5" cols="70">${qr.qrContent }</textarea>
					</td>
				</tr>
			</table>
			<input type="submit" value="수정완료" class="btnQRUpdateFinish">
		</form>
	</div>
			
	<a href="${pageContext.request.contextPath }/qb/list.do" class="btnList">목록</a>
	<!-- 관리자일 경우 -->
		
	<!-- 답글삭제, 답글수정버튼  -->
<!-- 	<div id="btnReplyBox">
		<a class="btnReply">답글달기</a>
	</div> -->
	<a class="btnReply">답글달기</a>
	
	
	<div id="btnBox">
		<a class="qr_btn_delete" data-qrNo="${qr.qrNo }">답글삭제</a>
		<a class="qr_btn_update" data-qrNo="${qr.qrNo }" data-qbNo="${qb.qbNo }" data-qrContent="${qr.qrContent }">답글수정</a>
		<%-- <a href="${pageContext.request.contextPath }/qr/update.do?qrNo=${qr.qrNo }&qdNo=${qb.qbNo }" class="qr_btn_update">답글수정</a> --%>
	</div>
		
		
	
</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>