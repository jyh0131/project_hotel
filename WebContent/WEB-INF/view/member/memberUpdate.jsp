<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/member/memberCheck.css" type="text/css" rel="stylesheet">
<section>
	<form action="update.do" method="post">
		<fieldset>
			<legend>프로필 수정</legend>
			<input type="hidden" name="id" value="${Auth }">
			<p>
				<label>이메일</label>
				<input type="text" name="email" value="${member.mMail }">
			</p>
			<p>
				<label>휴대전화</label>
				<input type="text" name="phone" value="${member.mPhone }">
			</p>
			<p>
				<label>자택전화</label>
				<input type="text" name="tel" value="${member.mTel }">
			</p>
			<p>
				<label>우편번호</label>
				<input type="text" name="zipcode" value="${member.mZipcode }">
			</p>
			<p>
				<label>주소</label>
				<input type="text" name="addr1" value="${member.mAddr1 }">
			</p>
			<p>
				<label>상세주소</label>
				<input type="text" name="addr2" value="${member.mAddr2 }">
			</p>
			<p>
				<input type="submit" value="프로필 수정">
			</p>
		</fieldset>
	</form>
</section>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>