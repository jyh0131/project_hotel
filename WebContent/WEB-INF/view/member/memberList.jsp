<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<section>
  회원리스트
	<table border ="1">
		<tr>
			<th>회원번호</th>
			<th>성명</th>
			<th>생년월일</th>
			<th>이메일</th>
			<th>휴대전화</th>
			<th>자택전화</th>
			<th>우편번호</th>
			<th>주소</th>
			<th>상세주소</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>가입일</th>
			<th>탈퇴일</th>
			<th>관리자여부</th>
		</tr>
		<c:forEach var="m" items="${list}">
			<tr>
				<td>${m.mNo }</td>
				<td>${m.mName }</td>
				<td>${m.mBirth }</td>
				<td>${m.mMail }</td>
				<td>${m.mPhone }</td>
				<td>${m.mTel }</td>
				<td>${m.mZipcode }</td>
				<td>${m.mAddr1 }</td>
				<td>${m.mAddr2 }</td>
				<td>${m.mId }</td>
				<td>${m.mPwd }</td>
				<td>${m.mRegdate }</td>
				<td>${m.mQuitdate }</td>
				<td>${m.mIsAdmin }</td>
			</tr>
		</c:forEach>
	</table>
</section>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>