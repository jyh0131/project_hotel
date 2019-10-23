<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/rsv_form.css" rel="stylesheet" type="text/css">

<div>
	<c:forEach var="r" items="${list }">
		<h3>${list.rcNo }</h3>
	</c:forEach>
	
</div>




<%@ include file="/WEB-INF/view/include/footer.jsp"%>