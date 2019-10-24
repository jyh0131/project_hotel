<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/member/memberCheck.css" type="text/css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/member/memberCheck.js"></script>
<script>
	$(function(){
		$("#btn").click(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/member/checkJson.do",
				type:"get",
				data:{"check":$("#check").val()},
				dateType:"json",
				success:function(res){
					console.log(res);
					if(res.result=="success"){
						var name = $("input[name='check']").val();
						$("input[name='check']").next().css("display","inline");
					}else{
						var name = $("input[name='check']").val();
						$("input[name='check']").next().next().css("display","inline");						
					}
					
				}
			})
		})
		$("form").submit(function(){
			$(".error").css("display","none");
			var result = checkInputEmpty($("input[name]"));
			if(result == false){ //빈 input태그가 존재하면
				return false;
			}
			//아이디 (영어,숫자 6~15)
			var idReg = /^[a-z][a-z0-9]{5,14}$/;
			var id = $("input[name='memberid']").val();
			if(idReg.test(id) == false ){
				$("input[name='memberid']").next().css("display","inline");
				//$(".error").css("display","inline");
				return false;//전송취고
			}
			//이름(한글 2~5)
			var nameReg = /^[가-힣]{2,5}$/;
			var name = $("input[name='name']").val();
			if(nameReg.test(name) == false){
				$("input[name='name']").next().css("display","inline");
				return false;
			}
			//비밀번호
			var passReg = /^[a-z0-9!@#$%^&]{8,20}$/;
			var pass = $("input[name='password']").val();
			if(passReg.test(pass) == false){
				$("input[name='password']").next().css("display","inline");
				return false;
			}
			//비밀번호 확인
			if($("input[name='password']").val()!=$("input[name='confirmPassword']").val()){
				$("input[name='confirmPassword']").next().next().css("display","inline");
				return false;
			}
		})
	})
</script>
<section>
	<form action="join.do" method="post">
		<fieldset>
			<legend>회원 가입</legend>
			<p>기본입력(*표시 필수입력사항)</p>
			<p>
				<label>*성명(국문)</label>
				<input type="text" name="name">
				<span class="error">한글(2~5)를 입력하세요</span>
			</p>
			<p>
				<label>*생년월일</label>
				<input type="date" name="date">
				<span class="error">생년월일을 입력하세요</span>
			</p>
			<p>
				<label>*이메일</label>
				<input type="text" name="email" id="check">
				<span class="error">email(영어,숫자 6~15)를 입력하세요.</span>
				<input type="button" id="btn" name="check" value="이메일중복확인">
				<span class="error">중복됩니다.</span>
				<span class="error">사용할수있습니다.</span>
			</p>
			<p>
				<label>*휴대전화</label>
				<input type="tel" name="phone">
				<span class="error">휴대전화번호를 입력하세요</span>
			</p>
			<p>
				<label>자택전화</label>
				<input type="tel" name="tel">
			</p>
			<p>
				<label>우편번호</label>
				<input type="text" name="zip">
			</p>
			<p>
				<label>자택주소</label>
				<input type="text" name="addr1">
				<input type="text" name="addr2">
			</p>
			<p>
				<label>*아이디</label>
				<input type="text" name="id" id="check">
				<span class="error">ID(영어,숫자 6~15)를 입력하세요.</span>
				<input type="button" id="btn" name="check" value="아이디 중복확인">
				<span class="error">중복됩니다.</span>
				<span class="error">사용가능</span>
			</p>
			<p>
				<label>*비밀번호</label>
				<input type="password" name="password">
				<span class="error">비밀번호(영어,숫자 8~20)를 입력하세요</span>
			</p>
			<p>
				<label>*비밀번호확인</label>
				<input type="password" name=" onfirmPassword">
				<span class="error">비밀번호확인을 입력하세요</span>
				<span class="error">비밀번호가 일치하지 않습니다.</span>
			</p>
			<p>			
				<input type="submit" value="가입"><input type="reset" value="취소">
			</p>
		</fieldset>
	</form>
</section>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>