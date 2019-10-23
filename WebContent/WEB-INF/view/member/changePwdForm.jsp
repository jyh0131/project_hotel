<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<section>
	<form action="change.do" method="post">
		<fieldset>
			<input type="hidden" name="id" value="${Auth }">
			 현재 암호	: <input type="password" name="password">
			 
			<c:if test="${notMatch == true }">
    			현재 암호가 일치하지 않습니다.
    		</c:if>
    		
			<br> 새 암호 : <input type="password" name="confirmPassword"><br>
			<input type="submit" value="암호 변경">
		</fieldset>
	</form>

</section>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>