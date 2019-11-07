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
			<h2>탈퇴가 완료되었습니다<br>😥 다음에 또 만나요</h2>
			<p>탈퇴가 완료되어도 확정된 예약은 자동 취소되지 않습니다.<br>취소를 원하시면 호텔로 문의 바랍니다.</p>
		</c:if>
		<c:if test="${result <= 0}">
			<h2>탈퇴에 실패하였습니다</h2>
		</c:if>
		<p>잠시 후 메인화면으로 돌아갑니다.</p>
		<a href="${pageContext.request.contextPath}/main.do">메인으로</a>
	</div>
</div>

<% session.removeAttribute("result");%>
<script>
	setTimeout(function() {
		window.location = "${pageContext.request.contextPath}/main.do";
		}, 2000);
</script>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>