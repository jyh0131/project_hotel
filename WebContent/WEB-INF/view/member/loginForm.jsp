<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/member/memberLoginForm.css" type="text/css" rel="stylesheet">

<script>
	$(function(){
		$("form").submit(function(){
			if($("input[name='id']").val() == ""){
				alert("아이디를 입력하세요.");
				return false;
			}
			
			if($("input[name='password']").val() == ""){
				alert("비밀번호를 입력하세요.")
				return false;
			}
		});
	});
</script>
	
	
<div class="mem-login-wrap">
	<h2>로그인</h2>
	
	<form action="login.do" method="post">	
		<table class="mem-login">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
		
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
		
			<tr>
				<td colspan="2">
					<a href="#">아이디 / 비밀번호 찾기</a>
					<a href="join.do">회원가입</a>
				</td>
			</tr>
			
			<tr>
				<c:if test="${idNotExist != null}">
					<td colspan="2">
						<span class="error">존재하지 않는 아이디입니다.</span>
					</td>
				</c:if>
				<c:if test="${pwdNotMatch != null}">
					<td colspan="2">
						<span class="error">비밀번호가 틀립니다.</span>
					</td>
				</c:if>
			</tr>
		</table>
		
		<input type="submit" value="로그인">
		
	</form>
</div>		
	
	
	
	
	
	
	
	
	
<%@ include file="/WEB-INF/view/include/footer.jsp"%>