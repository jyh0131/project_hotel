<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<%@ include file="/WEB-INF/view/include/intranet/intranetSideMenu.jsp"%>
<style>
	div.req-mgn-wrap {
		width: 100%;
	}
	div#piechart {
		width: 80%;
		height: 500px;
		margin: 0 auto;
	}
</style>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="${pageContext.request.contextPath}/js/intranet/intranetRequestMng.js"></script>

<h2>문의관리</h2>

<div class="req-mgn-wrap">
	<div id="piechart"></div>
</div>

<%@ include file="/WEB-INF/view/include/intranet/intranetBottom.jsp"%>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>