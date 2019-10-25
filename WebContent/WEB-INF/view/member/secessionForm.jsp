<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/member/memberCheck.css" type="text/css" rel="stylesheet">
<section>
	<form action="secession.do" method="post">
		<fieldset>
			<legend>정말 탈퇴하시겠습니까?</legend>
			<input type="hidden" name="id" value="${Auth }">
				<p>
					<label>아이디</label>
					<input type="text" name="did"> 
					<c:if test="${notIdMatch == true }">
		    			아이디가 일치하지 않습니다.
		    		</c:if>
		    	</p>
		    	<p>
		    		<label>암호</label>
		    		<input type="password" name="password">
					<c:if test="${notPwdMatch == true }">
		    			현재 암호가 일치하지 않습니다.
		    		</c:if>
		    	</p>
				<p>
					<input type="submit" value="탈퇴">
				</p>
			
		</fieldset>
	</form>
</section>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>