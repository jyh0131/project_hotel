<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>

<section>
	비밀번호 변경 완료 !
</section>

<script>
	setTimeout(function() {
		window.location = "${pageContext.request.contextPath}/main.do";
		}, 3000);
</script>  

<%@ include file="/WEB-INF/view/include/footer.jsp"%>