<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BLUA LUNDO</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
</head>
<body>
	<div id="container">
		<div id="head">
			<div id="header">
				<div id="logo-wrap">
					<a href="${pageContext.request.contextPath }/index.jsp">
					</a>
				</div>
				<ul id="top-menu">
					<c:if test="${Admin != null }"> <!-- 관리자 로그인시 -->
					<li>
						<a href="${pageContext.request.contextPath }">
							<span style="color:#F2CB61; font-size: 14px;">${Admin }</span>님
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/member/mypage.do">마이페이지</a>
					</li>
					</c:if>
					<c:if test="${Auth != null }"> <!-- 회원 로그인시 -->
					<li>
						<a href="${pageContext.request.contextPath }">
							<span style="color:#F2CB61; font-size: 14px;">${Auth }</span>님
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/member/mypage.do">마이페이지</a>
					</li>
					</c:if>
					<c:if test="${Auth == null && Admin == null}"> <!-- 로그아웃 상태 -->
					<li>
						<a href="${pageContext.request.contextPath }/member/login.do">로그인</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/member/agree.do">회원가입</a>
					</li>
					</c:if>
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
							<a href="${pageContext.request.contextPath }/room/main.do?rcNo=1">객실</a>
							<ul class="sub-nav">
								<li>
									<a href="${pageContext.request.contextPath }/room/main.do?rcNo=1">스탠다드</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath }/room/main.do?rcNo=2">디럭스</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath }/room/main.do?rcNo=3">테라스</a>
								</li>
									<li>
									<a href="${pageContext.request.contextPath }/room/main.do?rcNo=4">프리미어</a>
								</li>
									<li>
									<a href="${pageContext.request.contextPath }/room/main.do?rcNo=5">프리미어 테라스</a>
								</li>
									<li>
									<a href="${pageContext.request.contextPath }/room/main.do?rcNo=6">퍼시픽 디럭스</a>
								</li>
									<li>
									<a href="${pageContext.request.contextPath }/room/main.do?rcNo=7">로열 스위트</a>
								</li>
									<li>
									<a href="${pageContext.request.contextPath }/room/main.do?rcNo=8">프레지덴셜 스위트</a>
								</li>
							</ul>
						</li>
						
						<li>
							<a href="#">액티비티</a>
							<ul class="sub-nav">
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
									<a href="#">플레이스테이션</a>
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
						
						<li>
							<a>커뮤니티</a>
							<ul class="sub-nav">
								<li><a href="#">공지사항</a></li>
								<li><a href="${pageContext.request.contextPath}/qb/list.do">문의하기</a></li>
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
