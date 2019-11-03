<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>

index.jsp<br><br>
<p>임시 - 관리자부분</p>
<a href="${pageContext.request.contextPath }/room/list.do">객실 리스트</a><br>
<a href="${
pageContext.request.contextPath }/picture/list.do">사진 리스트</a>

<p>임시 - 인트라넷 대문</p>
<a href="${pageContext.request.contextPath}/intranet/main.do">인트라넷 들어가기</a>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>