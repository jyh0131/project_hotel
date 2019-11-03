<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<%@ include file="/WEB-INF/view/include/intranet/intranetSideMenu.jsp"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="${pageContext.request.contextPath}/js/intranet/intranetSalesMng.js"></script>

<h2>매출관리</h2>

<div class="intra-sales-chart">
	<div class="sales-list-state">
		<select name="sales-state">
			<option value="2019">2019년 전체</option>
			<option value="2019-1">2019년 1분기</option>
			<option value="2019-2">2019년 2분기</option>
			<option value="2019-3">2019년 3분기</option>
			<option value="2019-4">2019년 4분기</option>
		</select>
	</div>
	
	<div id="sales-chart"></div>
	
	
</div>


<%@ include file="/WEB-INF/view/include/intranet/intranetBottom.jsp"%>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>