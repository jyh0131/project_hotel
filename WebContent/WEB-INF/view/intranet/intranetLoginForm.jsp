<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/intranet/intranetLogin.css" rel="stylesheet" type="text/css">

<div class="admin-login-wrap">
	<h2>관리자 로그인</h2>
	<form action="login.do" method="post">	
		<table class="admin-login">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td colspan="2" class="centerAlign">
					<a href="#">아이디 / 비밀번호 찾기</a>
					<a href="adminCk.do">관리자 가입</a>
				</td>
			</tr>
			<tr>
				<c:if test="${idNotExist != null}">
					<td colspan="2" class="centerAlign">
						<span class="error">존재하지 않는 아이디입니다.</span>
					</td>
				</c:if>
				<c:if test="${pwdNotMatch != null}">
					<td colspan="2" class="centerAlign">
						<span class="error">비밀번호가 틀립니다.</span>
					</td>
				</c:if>
			</tr>
		</table>
		
		<input type="submit" value="로그인">
		
	</form>
</div>	

<%@ include file="/WEB-INF/view/include/footer.jsp"%>