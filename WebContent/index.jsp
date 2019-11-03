<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>

index.jsp<br><br>
<p>임시 - 관리자부분</p>
<a href="${pageContext.request.contextPath }/room/list.do">객실 리스트</a><br>
<a href="${pageContext.request.contextPath }/picture/list.do">사진 리스트</a>
<br><br>

<p>임시 - 인트라넷 대문</p>
<a href="${pageContext.request.contextPath }/intranet/login.do">인트라넷 들어가기</a>
<br><br>

<!-- 문의하기 -->
<c:choose>
	<c:when test="${Auth != null || Admin != null }">
		<p>임시 - 문의하기</p>
		<a href="${pageContext.request.contextPath}/qb/list.do">문의하기</a>
	</c:when>
	<c:otherwise>
		<p>문의하기 - 로그인 후 문의 가능합니다.</p>
	</c:otherwise>
</c:choose>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>