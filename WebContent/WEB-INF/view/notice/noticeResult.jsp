<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/member/memberResult.css" rel="stylesheet" type="text/css">

<div class="result-wrap">
	<div class="result-title">
		<h1>BLUA LUNDO</h1>
	</div>
	<div class="result-content">
		<c:if test="${inputResult > 0}">
			<h2>공지가 작성되었습니다☺</h2>
		</c:if>
		<c:if test="${inputResult <= 0}">
			<h2>공지 작성에 실패하였습니다</h2>
		</c:if>
		
		<c:if test="${updateResult > 0}">
			<h2>공지가 수정되었습니다☺</h2>
		</c:if>
		<c:if test="${updateResult <= 0}">
			<h2>공지 수정에 실패하였습니다</h2>
		</c:if>

		<c:if test="${deleteResult > 0}">
			<h2>공지가 삭제되었습니다☺</h2>
		</c:if>
		<c:if test="${deleteResult <= 0}">
			<h2>공지 수정에 실패하였습니다</h2>
		</c:if>

		
		<p>잠시 후 공지 목록으로 돌아갑니다.</p>
		<a href="${pageContext.request.contextPath}/main.do">메인으로</a>
	</div>
</div>

<% session.removeAttribute("inputResult");%>
<% session.removeAttribute("updateResult");%>
<% session.removeAttribute("deleteResult");%>
<script>
	setTimeout(function() {
		window.location = "${pageContext.request.contextPath}/notice/list.do";
		}, 2000);
</script>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>