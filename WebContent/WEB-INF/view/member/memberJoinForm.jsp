<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/member/memberJoinForm.css" type="text/css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/member/memberJoin.js"></script> 


<div class="join-info-wrap">
	<form action="join.do" method="post">
		<div class="join-info-form" id="form-required">
			<h3>필수사항</h3>
			<p>
				<label>아이디</label>
				<input type="text" name="id" id="check">
				<input type="button" id="btnIdCk" value="중복확인" maxlength="15">
				<span class="avCon">사용 가능한 아이디입니다.</span>
				
				<br>
				
				<span class="formRule">영어 소문자, 숫자, 특수문자(-_) 6~15자</span>
				<span class="error">형식에 맞지않는 아이디입니다.</span>
			</p>
			<p>
				<label>비밀번호</label>
				<input type="password" name="password" maxlength="20"><br>
				<span class="formRule">영어 대소문자, 숫자, 특수문자(!@#$%^&*-_) 8~20자</span>
				<span class="error">형식에 맞지않는 비밀번호입니다.</span>
			</p>
			<p>
				<label>비밀번호확인</label>
				<input type="password" name="confirmPassword" maxlength="20">
				<span class="avCon">비밀번호가 일치합니다.</span>
				<span class="error">비밀번호가 일치하지 않습니다.</span>
			</p>
			<p>
				<label>성명(국문)</label>
				<input type="text" name="name" maxlength="5">
				<span class="error">한글 2~5자만 입력 가능합니다.</span>
			</p>
			<p>
				<label>생년월일</label>
				<input type="date" name="birth" value="1990-01-01">
			</p>
			<p>
				<label>휴대전화</label>
				<select name="phone1">
					<option>010</option>
					<option>011</option>
					<option>016</option>
					<option>017</option>
					<option>018</option>
					<option>019</option>
				</select>
				<span>-</span>
				<input type="tel" name="phone2" maxlength="4">
				<span>-</span>
				<input type="tel" name="phone3" maxlength="4">
			</p>
			<p>
				<label>이메일</label>
				<input type="email" name="mail" placeholder="ex) ex@example.com">
				<input type="button" id="btnMailCk" value="중복확인">
				<span class="avCon">사용가능한 이메일입니다.</span>
				
				<br>
				
				<span class="error">형식에 맞지않는 메일주소입니다.</span>
			</p>
		</div>
		
		<div class="join-info-form" id="form-option">
			<h3>선택사항</h3>
			<p>
				<label>자택전화</label>
				<select name="tel1">
					<option>02</option>
					<option>051</option>
					<option>053</option>
					<option>032</option>
					<option>062</option>
					<option>042</option>
					<option>052</option>
					<option>044</option>
					<option>031</option>
					<option>033</option>
					<option>043</option>
					<option>041</option>
					<option>063</option>
					<option>061</option>
					<option>054</option>
					<option>055</option>
					<option>064</option>
					<option>070</option>
				</select>
				<span>-</span>
				<input type="tel" name="tel2" maxlength="4">
				<span>-</span>
				<input type="tel" name="tel3" maxlength="4">
			</p>
			<p>
				<label>우편번호</label>
				<input type="text" name="zip">
			</p>
			<p>
				<label>자택주소(상세)</label>
				<input type="text" name="addr1">
				<input type="text" name="addr2">
			</p>
		</div>
		
		<div class="join-info-form" id="form-btn">
			<input type="submit" value="가입">
			<input type="reset" value="취소">
		</div>
	</form>
</div>	


<%@ include file="/WEB-INF/view/include/footer.jsp"%>