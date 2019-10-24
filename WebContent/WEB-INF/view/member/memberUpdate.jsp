<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<section>
	<form action="update.do" method="post">
		<input type="hidden" name="id" value="${Auth }">
		이메일 : <input type="text" name="email" value="${member.mMail }"><br>
		휴대전화 : <input type="text" name="phone" value="${member.mPhone }"><br>
		자택전화 : <input type="text" name="tel" value="${member.mTel }"><br>
		우편번호 : <input type="text" name="zipcode" value="${member.mZipcode }"><br>
		주소 : <input type="text" name="addr1" value="${member.mAddr1 }"><br>
		상세주소 : <input type="text" name="addr2" value="${member.mAddr2 }"><br>
		
		<input type="submit" value="프로필 수정">
	</form>
</section>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>