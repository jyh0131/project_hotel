<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<style>
	table{
		margin-top:10px;
		width:100%;
	}
	table, th, td{
		border:1px solid black;
		border-collapse: collapse;
		padding:10px;
		text-align: center;
	}
	#detailTable img{
		width:200px;
	}
</style>
<div>
	<table id="detailTable">
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
		</tr>
		<tr>
			<th>제목</th>
			<td>${qb.qbTitle}</td>
		</tr>
		<tr>
			<th>성명</th>
			<td>${qb.qbName}</td>
		</tr>
		<tr>
			<th>문의날짜</th>
			<td>
				<fmt:formatDate value="${qb.qbDate}" pattern="yyyy-MM-dd"/>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${qb.qcContent}</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td><img src="${pageContext.request.contextPath }/upload/${qb.qbPath}"></td>
		</tr>
	</table>
	<a href="${pageContext.request.contextPath }/qb/list.do">[목록]</a>
	<c:if test="${Auth == qb.mNo.mId }"> <!-- 작성자만 삭제, 수정 가능하게 하기위해 로그인한 아이디와 작성자 아이디를 비교 -->
		<a href="${pageContext.request.contextPath }/qb/update.do?qbNo=${qb.qbNo}">[게시글 수정]</a>
		<a href="${pageContext.request.contextPath }/qb/delete.do?qbNo=${qb.qbNo}">[게시글 삭제]</a>
	</c:if> 

</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>