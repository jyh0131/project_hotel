<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<style>
	div.menu-notice-wrap {
		width: 100%;
		min-height: 500px;
		padding: 30px 0 50px;
	}
	div.menu-notice-wrap > h1 {
		width: 60%;
		margin: 0 auto;
		text-align: center;
		border-bottom: 5px solid #47a3da;
		font-size: 3em;
		color: #47a3da;
		font-weight: normal;
		letter-spacing: 0.15em;
	}
	div.menu-notice-wrap > div.notice-wrap {
		width: 90%;
		margin: 15px auto 0;
	}
	div.menu-notice-wrap > div.notice-wrap > a.hrefWrite {
		text-align: right;
		color: #535353;
	}
	div.menu-notice-wrap > div.notice-wrap > table {
		border-collapse: collapse;
		width: 100%;
		border: 3px solid #47a3da;
	}
	div.menu-notice-wrap > div.notice-wrap > table th {
		background: #f5dbbd;
		padding: 10px;
		font-weight: normal;
		border-bottom: 3px dashed #47a3da;
	}
	div.menu-notice-wrap > div.notice-wrap > table td {
		border: 1px solid #47a3da;
		text-align: center;
		padding: 15px 0;
		color: #535353;
	}
	div.menu-notice-wrap > div.notice-wrap > table td a{
		margin-left: 10px;
		color: #535353;
	}
	.c1 {width: 5%;}
	.c2 {width: 65%;}
	.c3 {width: 12%;}
	.c4 {width: 9%;}
	.c5 {width: 9%;}
</style>

<div class="menu-notice-wrap">
	<h1>공지사항</h1>
	
	<div class="notice-wrap">
		<a href="${pageContext.request.contextPath}/notice/insert.do" id="hrefWrite">글쓰기</a>
		<table>
			<tr>
				<th class="c1">No</th>
				<th class="c2">제목</th>
				<th class="c3">작성자</th>
				<th class="c4">등록일</th>
				<th class="c5">수정일</th>
			</tr>
			<c:forEach var="nt" items="${list}">
				<tr>
					<td>${nt.ntNo}</td>
					<td style="text-align:left;">
						<a href="${pageContext.request.contextPath}/notice/detail.do?no=${nt.ntNo}">${nt.ntTitle}</a>
					</td>
					<td>관리자</td>
					<td><fmt:formatDate value="${nt.ntRegdate}" pattern="yyyy-MM-dd" /></td>
					
					<td>
						<c:if test="${nt.ntModdate == null}">
							-
						</c:if>
						<c:if test="${nt.ntModdate != null}">
							<fmt:formatDate value="${nt.ntModdate}" pattern="yyyy-MM-dd" />
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>