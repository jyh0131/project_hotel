<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/member/memberChangePwdForm.css" type="text/css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/member/memberChangePwd.js"></script>

<div class="change-pwd-wrap">
	<h2>비밀번호 변경</h2>
	<form action="change.do" method="post">	
		<div class="change-pwd">
			<p>
				<label>현재 비밀번호</label>
				<input type="password" name="password"><br>
				<c:if test="${pwdNotMatch == true}">
					<span class="error">현재 비밀번호가 일치하지 않습니다.</span>
				</c:if>
			</p>
			<p>
				<span class="formRule">영어 대소문자, 숫자, 특수문자(!@#$%^&*-_) 8~20자</span><br>
				<label>새 비밀번호</label>
				<input type="password" name="confirmPassword"><br>
				<span class="error">형식에 맞지않는 비밀번호입니다.</span>
			</p>  
			<p>
				<label>새 비밀번호 확인</label>
				<input type="password" name="confirmPassword2"><br>
				<span class="error">비밀번호가 일치하지 않습니다.</span>
			</p>
			<p class="p-btn">
				<input type="submit" value="암호 변경">
			</p>
		</div>
	</form>
</div>



<%@ include file="/WEB-INF/view/include/footer.jsp"%>