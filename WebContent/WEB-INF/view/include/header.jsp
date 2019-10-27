<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PROJECT HOTEL</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
</head>
<body>
	<div id="container">
		<div id="head">
			<div id="header">
				<div id="logo-wrap">
					<h1>PROJECT HOTEL</h1>
				</div>
				<ul id="top-menu">
					<c:if test="${Auth != null }">
					<li>
						<a href="${pageContext.request.contextPath }">${Auth }님</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/member/mypage.do">마이페이지</a>
					</li>
					</c:if>
					<c:if test="${Auth == null }">
					<li>
						<a href="${pageContext.request.contextPath }/member/login.do">로그인</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/member/agree.do">신라리워즈 가입</a>
					</li>
					</c:if>
					<li>
						<a href="#">예약확인</a>
					</li>
				</ul>	
			</div>
			
			<div id="gnb-nav">
				<div id="nav-wrap">
					<ul id="main-menu">
						<li>
							<a href="#">스페셜 오퍼</a>
							<ul class="sub-nav">
								<li>
									<a href="#">객실패키지</a>
								</li>
								<li>
									<a href="#">이벤트</a>
								</li>
							</ul>
						</li>
						
						<li>
							<a href="#">객실</a>
							<ul class="sub-nav">
								<li>
									<a href="#">스탠다드</a>
								</li>
								<li>
									<a href="#">프리미어</a>
								</li>
								<li>
									<a href="#">스위트</a>
								</li>
								<li>
									<a href="#">전체 객실 보기</a>
								</li>
							</ul>
						</li>
						
						<li>
							<a href="#">다이닝</a>
							<ul class="sub-nav">
								<li>
									<a href="#">레스토랑</a>
								</li>
								<li>
									<a href="#">라운지＆바</a>
								</li>
								<li>
									<a href="#">베이커리</a>
								</li>
							</ul>
						</li>
						
						<li>
							<a href="#">액티비티</a>
							<ul class="sub-nav">
								<li>
									<a href="#">클램핑＆캠핑</a>
								</li>
								<li>
									<a href="#">레저 전문가 서비스</a>
								</li>
								<li>
									<a href="#">키즈 시설</a>
								</li>
								<li>
									<a href="#">피트니스</a>
								</li>
								<li>
									<a href="#">와인 파티</a>
								</li>
								<li>
									<a href="#">갤러리 투어</a>
								</li>
								<li>
									<a href="#">숨비정원</a>
								</li>
								<li>
									<a href="#">플레이스테이션 게임 존</a>
								</li>
							</ul>
						</li>
						
						<li>
							<a href="#">부대시설</a>
							<ul class="sub-nav">
								<li>
									<a href="#">숨비 스파 존</a>
								</li>
								<li>
									<a href="#">카비나</a>
								</li>
								<li>
									<a href="#">스파</a>
								</li>
								<li>
									<a href="#">라운지 에스</a>
								</li>
								<li>
									<a href="#">연회장</a>
								</li>
								<li>
									<a href="#">비즈니스 센터</a>
								</li>
								<li>
									<a href="#">아케이드</a>
								</li>
								<li>
									<a href="#">렌터카</a>
								</li>
							</ul>
						</li>
						
						<li>
							<a href="#">갤러리</a>
							<ul class="sub-nav">
								<li>
									<a href="#">사진</a>
								</li>
								<li>
									<a href="#">동영상</a>
								</li>
							</ul>
						</li>
					</ul>
					
					<div id="rsv-menu">
						<a href="${pageContext.request.contextPath}/rsv/rsvStep1.do">예약</a>
					</div>
				</div>
			</div>
		</div>
		<!-- ↑ 공통영역 -->
		
		<div id="section">
			<div id="section-wrap">
</body>
</html>