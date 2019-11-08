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
			$("#hrefFindId").click(function(){
				alert("준비중입니다.");
				return false;
			})
		});
	});
</script>
	
	
<div class="mem-login-wrap">
	<h2>로그인</h2>
	
	<form action="login.do" method="post">	
		<table class="mem-login">
			<tr>
				<td>
					<p>
						<label>아이디</label>
						<input type="text" name="id" maxlength="15">
					</p>
					<p>
						<label>비밀번호</label>
						<input type="password" name="password" maxlength="20">
					</p>
				</td>
				<td class="td-btn">
					<input type="submit" value="로그인">
				</td>
			</tr>
		
			<tr>
				<td colspan="2" class="centerAlign">
					<a href="join.do">회원 가입</a>
				</td>
			</tr>
			
			<tr>
				<c:if test="${idNotExist != null}">
					<td colspan="2"  class="centerAlign">
						<span class="error">존재하지 않는 아이디입니다.</span>
					</td>
				</c:if>
				<c:if test="${quitMem != null}">
					<td colspan="2"  class="centerAlign">
						<span class="error">탈퇴한 회원입니다.</span>
					</td>
				</c:if>
				<c:if test="${pwdNotMatch != null}">
					<td colspan="2"  class="centerAlign">
						<span class="error">비밀번호가 틀립니다.</span>
					</td>
				</c:if>
			</tr>
		</table>
	</form>
</div>		
	
	
	
	
	
	
	
	
	
<%@ include file="/WEB-INF/view/include/footer.jsp"%>