<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<section>
	<form action="secession.do" method="post">
		<fieldset>
			<h3>정말 탈퇴하시겠습니까?</h3>
			<input type="hidden" name="id" value="${Auth }">
			아이디 : <input type="text" name="did"> 
			<c:if test="${notIdMatch == true }">
    			아이디가 일치하지 않습니다.
    		</c:if>
    		<br>
			 현재 암호	: <input type="password" name="password">
			<c:if test="${notPwdMatch == true }">
    			현재 암호가 일치하지 않습니다.
    		</c:if>
			<br>
			<input type="submit" value="탈퇴">
		</fieldset>
	</form>
</section>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>