<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR OCCURED</title>
<style>
	html, body {
		width: 100%;
		height: 100%;
	}
	div.error-wrap {
		width: 100%;
		height: 100%;
	}
	div.error-img {
		width: 70%;
		height: 300px;
		background: url("${pageContext.request.contextPath}/images/bg-img/error-img.png") no-repeat center;
		background-size: contain;
		margin: 0 auto;
	}
	div.error-msg {
		width: 70%;
		margin: 0 auto;
		text-align: center;
		color: #47a3da;
	}
	div.error-msg > h1 {
		font-size: 1.5em;
	}
	div.error-msg > p {
		width: 27%;
		margin: 0 auto;
	}
	div.error-msg > p > a {
		text-decoration: none;
		color: #47a3da;
		font-weight: bold;
		font-size: 17px;
		letter-spacing: 0.15em;
	}
</style>
</head>
<body>
	<div class="error-wrap">
		<div class="error-img"></div>
		<div class="error-msg">
			<c:if test="${requestScope['javax.servlet.error.status_code'] == 400}">
				<h1>400 에러가 발생하였습니다.</h1>
			</c:if>
			<c:if test="${requestScope['javax.servlet.error.status_code'] == 403}">
				<h1>403 에러가 발생했습니다.</h1>
			</c:if>
			<c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
				<h1>404 에러가 발생했습니다.</h1>
			</c:if>
			<c:if test="${requestScope['javax.servlet.error.status_code'] == 405}">
				<h1>405 에러가 발생했습니다.</h1>
			</c:if>
			<c:if test="${requestScope['javax.servlet.error.status_code'] == 500}">
				<h1>500 에러가 발생했습니다.</h1>
			</c:if>
			<c:if test="${requestScope['javax.servlet.error.status_code'] == 503}">
				<h1>503 에러가 발생했습니다.</h1>
			</c:if>
				<p>
					이 에러는 영국에서 최초로 시작되어 일년에 한 바퀴 돌면서 받는 사람에게 행운을 주었고 
					지금은 당신에게로 옮겨진 이 에러는 4일 안에 당신 곁을 떠나야 합니다. 
					이 에러를 포함해서 7통을 행운이 필요한 사람에게 보내 주셔야 합니다. 
					웅앵웅앵웅앵웅앵 아무튼 고칠게요 <br><br><br>
					BLUA LUNDO 고객센터 : 000)000-0000<br><br><br>
					<a href="${pageContext.request.contextPath}/main.do">메인으로</a>
				</p>
		</div>
	</div>
</body>
</html>