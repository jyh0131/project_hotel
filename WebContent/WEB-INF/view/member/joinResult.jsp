<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<c:if test="${result >0 }">
	<h3>---가입성공!ㅡㅡ</h3>
</c:if>
<c:if test="${result <=0 }">
	<h3>---가입실패ㅡㅡ</h3>
</c:if>
<a href="${pageContext.request.contextPath }">홈</a>

<script>
	setTimeout(function() {
		window.location = "${pageContext.request.contextPath}/main.do";
		}, 3000);
</script>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>