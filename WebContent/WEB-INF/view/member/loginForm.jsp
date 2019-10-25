<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/member/memberCheck.css" type="text/css" rel="stylesheet">
<script>
	$(function(){
		$("form").submit(function(){
			if($("input[name='id']").val() == ""){
				$("input[name='id']").next().css("display","inline");
				return false;
			}
			if($("input[name='password']").val() == ""){
				$("input[name='password']").next().css("display","inline");
				return false;
			}
		})
	})
</script>
<section>
	<form action="login.do" method="post">
		<fieldset>
			<legend>로그인</legend>
			<p>
				<label>아이디</label>
				<input type="text" name="id">
				<span class="error">아이디를 입력하세요</span>
			</p>
			<p>
				<label>비밀번호</label>
				<input type="password" name="password">
				<span class="error">비밀번호를 입력하세요</span>
			</p>
			<p>
				<c:if test="${notMatch == false }">
							일치!	
				</c:if>
				<c:if test="${notMatch == true }">
				----------잘못입력하셨습니다----------
				</c:if>
			</p>
			<p>
				<input type="submit" value="로그인">
			</p>
		</fieldset>
	</form>
</section>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>