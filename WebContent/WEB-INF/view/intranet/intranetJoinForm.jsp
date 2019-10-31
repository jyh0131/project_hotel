<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/intranet/intraJoinForm.css" type="text/css" rel="stylesheet">
<%-- <script src="${pageContext.request.contextPath}/js/intranet/memberCheck.js"></script>  --%>


<div class="join-info-wrap">
	<form action="join.do" method="post">
		<div class="join-info-form" id="form-required">
			<h3>필수사항</h3>
			<p>
				<label>회원번호</label>
			<input type="text" placeholder="자동으로 생성됩니다." readonly="readonly">
			</p>
			<p>
				<label>아이디</label>
				<input type="text" name="id" id="check" placeholder="영어, 숫자 (6~15자)">
				<span class="error">ID(영어,숫자 6~15)를 입력하세요.</span>
				<input type="button" id="btn" name="check" value="아이디 중복확인">
				<span class="error">중복됩니다.</span>
				<span class="error">사용가능</span>
			</p>
			<p>
				<label>비밀번호</label>
				<input type="password" name="password" placeholder="영어, 숫자 (6~20자)">
				<span class="error">비밀번호(영어,숫자 6~20)를 입력하세요</span>
			</p>
			<p>
				<label>비밀번호확인</label>
				<input type="password" name="confirmPassword" placeholder="영어, 숫자 (6~20자)">
				<span class="error">비밀번호를 입력하세요</span>
				<span class="error">비밀번호가 일치하지 않습니다.</span>
			</p>
			<p>
				<label>성명(국문)</label>
				<input type="text" name="name" placeholder="한글 (2~5자)">
				<span class="error">한글(2~5)를 입력하세요</span>
			</p>
			<p>
				<label>생년월일</label>
				<input type="date" name="date">
				<span class="error">생년월일을 입력하세요</span>
			</p>
			<p>
				<label>휴대전화</label>
				<input type="tel" name="phone" placeholder="ex)01012345678">
				<span class="error">휴대전화번호를 입력하세요</span>
			</p>
			<p>
				<label>이메일</label>
				<input type="text" name="email" id="echeck" placeholder="ex@example.com">
				<span class="error">email(영어, 숫자 조합)를 입력하세요.</span>
				<input type="button" id="ebtn" name="echeck" value="이메일중복확인">
				<span class="error">중복됩니다.</span>
				<span class="error">사용할수있습니다.</span>
			</p>
		</div>
		
		<div class="join-info-form" id="form-option">
			<h3>선택사항</h3>
			<p>
				<label>자택전화</label>
				<input type="tel" name="tel">
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