<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<section>
	<form action="login.do" method="post">
		<fieldset>
			<legend>로그인</legend>
			<p>
				<label>아이디</label>
				<input type="text" name="id">
				<span class="error">아이디를 입력하세요</span>
			</p>
			<p>
				<label>비밀번호</label>
				<input type="password" name="password">
				<span class="error">비밀번호를 입력하세요</span>
			</p>
			<p>
				<input type="submit" value="로그인">
			</p>
		</fieldset>
	</form>
</section>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>