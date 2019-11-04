<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/member/memberMyPage.css" rel="stylesheet" type="text/css">


<div class="myPage-wrap">
	<ul>
		<li>
			<a href="${pageContext.request.contextPath }/member/update.do?id=${Auth }">
				<span class='page-title'>프로필 수정</span>
				<span class='page-info'>가입시 입력한<br>개인정보를 수정합니다</span>
			</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath }/member/changePwd.do" style="color: white;">
				<span class='page-title'>비밀번호 변경</span>
				<span class='page-info'>비밀번호를<br>변경합니다</span>
			</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath }/member/secession.do">
				<span class='page-title'>회원 탈퇴</span>
				<span class='page-info'>😥😥<br>BLUA LUNDO를<br>탈퇴합니다</span>
			</a>
		</li>
	</ul>
</div>
	
	
	
<%@ include file="/WEB-INF/view/include/footer.jsp"%>