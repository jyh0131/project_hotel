<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/member/memberUpdateInfo.css" type="text/css" rel="stylesheet">


<div class="update-info-wrap">
	<form action="update.do" method="post">
		
		<div class="update-info-form">
			<h3>정보 수정</h3>
			<p>
				<label>아이디</label>
				<input type="text" name="id" readonly="readonly" value="${Auth}">
			</p>
			<p>
				<label>성명</label>
				<input type="text" name="name" readonly="readonly" value="${member.mName}">
			</p>
			<p>
				<label>생년월일</label>
				<fmt:formatDate value="${member.mBirth}" pattern="yyyy-MM-dd" var="birth"/>
				<input type="date" name="birth" readonly="readonly" value="${birth}">
			</p>
			<p>
				<label>이메일</label>
				<input type="email" name="mail" readonly="readonly" value="${member.mMail}">
			</p>
			<p>
				<label>휴대전화</label>
				<c:set var="p" value="${fn:split(member.mPhone, '-')}"></c:set>
				<select name="phone1">
					<option ${p[0] == "010"?'selected="selected"':''}>010</option>
					<option ${p[0] == "011"?'selected="selected"':''}>011</option>
					<option ${p[0] == "016"?'selected="selected"':''}>016</option>
					<option ${p[0] == "017"?'selected="selected"':''}>017</option>
					<option ${p[0] == "018"?'selected="selected"':''}>018</option>
					<option ${p[0] == "019"?'selected="selected"':''}>019</option>
				</select>
				<span>-</span>
				<input type="tel" name="phone2" value="${p[1]}" maxlength="4">
				<span>-</span>
				<input type="tel" name="phone3" value="${p[2]}" maxlength="4">		
			</p>
			<p>
				<label>자택전화</label>
				<c:set var="t" value="${fn:split(member.mTel, '-')}"></c:set>
				<select name="tel1">
					<option ${t[0] == "02"?'selected="selected"':''}>02</option>
					<option ${t[0] == "051"?'selected="selected"':''}>051</option>
					<option ${t[0] == "053"?'selected="selected"':''}>053</option>
					<option ${t[0] == "032"?'selected="selected"':''}>032</option>
					<option ${t[0] == "062"?'selected="selected"':''}>062</option>
					<option ${t[0] == "042"?'selected="selected"':''}>042</option>
					<option ${t[0] == "052"?'selected="selected"':''}>052</option>
					<option ${t[0] == "044"?'selected="selected"':''}>044</option>
					<option ${t[0] == "031"?'selected="selected"':''}>031</option>
					<option ${t[0] == "033"?'selected="selected"':''}>033</option>
					<option ${t[0] == "043"?'selected="selected"':''}>043</option>
					<option ${t[0] == "041"?'selected="selected"':''}>041</option>
					<option ${t[0] == "063"?'selected="selected"':''}>063</option>
					<option ${t[0] == "061"?'selected="selected"':''}>061</option>
					<option ${t[0] == "054"?'selected="selected"':''}>054</option>
					<option ${t[0] == "055"?'selected="selected"':''}>055</option>
					<option ${t[0] == "064"?'selected="selected"':''}>064</option>
					<option ${t[0] == "070"?'selected="selected"':''}>070</option>
				</select>
				<span>-</span>
				<input type="tel" name="tel2" value="${t[1]}" maxlength="4">
				<span>-</span>
				<input type="tel" name="tel3" value="${t[2]}" maxlength="4">
			</p>
			<p>
				<label>우편번호</label>
				<input type="text" name="zip" value="${member.mZipcode}">
			</p>
			<p>
				<label>자택주소(상세)</label>
				<input type="text" name="addr1" value="${member.mAddr1}">
				<input type="text" name="addr2" value="${member.mAddr2}">
			</p>
		</div>
		
		<div class="update-info-form" id="form-btn">
			<input type="submit" value="수정">
			<input type="reset" value="취소">
		</div>
	</form>
</div>	



<%@ include file="/WEB-INF/view/include/footer.jsp"%>