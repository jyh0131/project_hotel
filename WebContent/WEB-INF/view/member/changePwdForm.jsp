<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/member/memberCheck.css" type="text/css" rel="stylesheet">
<script>
	$(function(){
		$("form").submit(function(){
			var passReg = /^[a-z0-9!@#$%^&]{6,20}$/;
			var pass = $("input[name='confirmPassword']").val();
			if(passReg.test(pass) == false){
				$("input[name='confirmPassword']").next().css("display","inline");
				return false;
			}
			if($("input[name='confirmPassword']").val()!=$("input[name='confirmPassword2']").val()){
				$("input[name='confirmPassword2']").next().next().css("display","inline");
				return false;
			}
		})
	})
</script>


	<form action="change.do" method="post">
		<div class="change-pwd">
				<p>
					<label>현재 암호</label>
					<input type="password" name="password">
			 		<span class="error">비밀번호(영어,숫자 6~20)를 입력하세요</span>
					<c:if test="${notMatch == true }">
		    			<span class="error" style="display: inline">현재 암호가 일치하지 않습니다.</span>
		    		</c:if>
		    	</p>
		    	<p>
		    		<label>새 암호</label>
		    		<input type="password" name="confirmPassword">
		    	</p>
				<p>
					<label>새 암호 확인</label>
					<input type="password" name="confirmPassword2">
					<span class="error">비밀번호확인을 입력하세요</span>
					<span class="error">비밀번호가 일치하지 않습니다.</span>
				</p>
				<p>
					<input type="submit" value="암호 변경">
				</p>
		</div>	
	</form>
	
	
<%@ include file="/WEB-INF/view/include/footer.jsp"%>