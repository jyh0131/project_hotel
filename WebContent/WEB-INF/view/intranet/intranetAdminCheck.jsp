<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/intranet/intranetAdminCheck.css" rel="stylesheet" type="text/css">

<div class="admin-login-wrap">
	<h2>관리자 인증코드 확인</h2>
	
	<form action="adminCk.do" method="post">	
		<table class="admin-login">
			<tr>
				<td>
					<p>
						<input type="password" name="cord">
					</p>
				</td>
				<td class="td-btn">
					<input type="submit" value="확인">
				</td>
			</tr>
		
			<tr>
				<td colspan="2" class="centerAlign">
					<c:if test="${notAdmin != null}">
						<span class="error">${notAdmin}</span>
					</c:if>
				</td>
			</tr>
		</table>
	</form>
</div>	

<%@ include file="/WEB-INF/view/include/footer.jsp"%>