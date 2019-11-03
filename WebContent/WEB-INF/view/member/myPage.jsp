<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>


<div class="myPage-wrap">
	<ul>
		<li>
			<a href="${pageContext.request.contextPath }/member/update.do?id=${Auth }">프로필 수정</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath }/member/change.do">비밀번호 변경</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath }/member/secession.do">탈퇴</a>
		</li>
	</ul>
</div>
	
	
	
<%@ include file="/WEB-INF/view/include/footer.jsp"%>