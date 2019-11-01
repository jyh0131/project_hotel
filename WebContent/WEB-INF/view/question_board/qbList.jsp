<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>

<div>
	<div>
		<h1>문의하기</h1>
		<table>
			<tr>
				<th>글번호</th>
				<th>구분</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
			<tr>
				<c:forEach var="list" items="${list }">
					<td>${qbNo }</td>
					<td>${qbCategory }</td>
					<td>${qbTitle }</td>
					<td>${qbDate }</td>
				</c:forEach>
			</tr>
		</table>
	</div>
	
	<div>
		<a href="${pageContext.request.contextPath }/qb/insert.do">글쓰기</a>
	</div>
	
</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>