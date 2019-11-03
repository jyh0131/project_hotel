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
</style>
<div>
	<div>
		<h1>문의하기</h1>
		<table>
			<tr>
				<th>글번호</th>
				<th>구분</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			
			<c:forEach var="list" items="${list }">
			<input type="hidden" value="${list.mNo.mId }" name = "mId">
				<tr>
					<td>${list.qbNo }</td>
					<td>
						<c:if test="${list.qbCategory == '0'}">
							결제 문의
						</c:if>
						<c:if test="${list.qbCategory == '1'}">
							예약 문의
						</c:if>
						<c:if test="${list.qbCategory == '2'}">
							객실 문의
						</c:if>
						<c:if test="${list.qbCategory == '3'}">
							시설 및 옵션 문의
						</c:if>
						<c:if test="${list.qbCategory == '4'}">
							기타 문의
						</c:if>
					</td>
					<td>
						<a href="${pageContext.request.contextPath }/qb/detail.do?qbNo=${list.qbNo }">${list.qbTitle }</a>
					</td>
					<td>${list.qbName }</td>
					<td>
						<fmt:formatDate value="${list.qbDate}" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div>
		<a href="${pageContext.request.contextPath }/qb/insert.do?mId=${Auth}">글쓰기</a>
	</div>
	
</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>	
