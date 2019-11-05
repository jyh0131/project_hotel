<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/member/memberSecessionForm.css" type="text/css" rel="stylesheet">

<div class="mem-secession-wrap">
	<h2>회원 탈퇴</h2>
	<p>회원정보 확인을 위해 다시 한 번 로그인 해주시기 바랍니다.</p>
	
	<form action="secession.do" method="post">	
		<table class="mem-secession">
			<tr>
				<td>
					<p>
						<label>아이디</label>
						<input type="text" name="id">
					</p>
					<p>
						<label>비밀번호</label>
						<input type="password" name="password">
					</p>
				</td>
				<td class="td-btn">
					<input type="submit" value="탈퇴">
				</td>
			</tr>
		
			<tr>
				<c:if test="${notIdMatch == true}">
					<td colspan="2" class="centerAlign">
						<span class="error">존재하지 않는 아이디입니다.</span>
					</td>
				</c:if>
				<c:if test="${notPwdMatch == true}">
					<td colspan="2" class="centerAlign">
						<span class="error">비밀번호가 틀립니다.</span>
					</td>
				</c:if>
			</tr>
		</table>
	</form>
</div>





<%@ include file="/WEB-INF/view/include/footer.jsp"%>