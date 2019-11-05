<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/member/memberResult.css" rel="stylesheet" type="text/css">

<div class="result-wrap">
	<div class="result-title">
		<h1>BLUA LUNDO</h1>
	</div>
	<div class="result-content">
		<c:if test="${result > 0}">
			<h2>비밀번호가 변경되었습니다</h2>
		</c:if>
		<c:if test="${result <= 0}">
			<h2>비밀번호 변경에 실패하였습니다</h2>
		</c:if>
		<p>잠시 후 메인화면으로 돌아갑니다.</p>
		<a href="${pageContext.request.contextPath}/main.do">메인으로</a>
	</div>
</div>

<% session.removeAttribute("result");%>
<script>
	setTimeout(function() {
		window.location = "${pageContext.request.contextPath}/member/mypage.do";
		}, 2000);
</script>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>