<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BLUA LUNDO - 어디에도 없지만 어디에선가 마주칠 것 같은, 우연의 휴식처</title>
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
					<li>
						<a href="${pageContext.request.contextPath}/intranet/mng/sales.do">인트라넷</a>
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
							<li><a href="#">ABOUT</a>
								<ul class="sub-nav">
									<li>
										<a href="${pageContext.request.contextPath}/etcPage/introHotel.jsp">소개</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/etcPage/introSCV.jsp">노예소개</a>
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
	
							<li><a href="#">액티비티</a>
								<ul class="sub-nav">
							 		<li><a href="${pageContext.request.contextPath}/etcPage/actSurf.jsp">서핑 체험</a></li>
									<li><a href="${pageContext.request.contextPath}/etcPage/actForest.jsp">숲으로</a></li>
									<li><a href="${pageContext.request.contextPath}/etcPage/actNoBirth.jsp">안생일축하</a></li>
									<li><a href="${pageContext.request.contextPath}/etcPage/actExhibit.jsp">전시 및 포토스팟</a></li>
								</ul>
							</li>
	
							<li><a href="${pageContext.request.contextPath}/etcPage/gallery/gallery1.jsp">갤러리</a>
								<ul class="sub-nav">
									<li><a href="${pageContext.request.contextPath}/etcPage/gallery/gallery1.jsp">사진</a></li>
									<li><a href="${pageContext.request.contextPath}/etcPage/gallery/video.jsp">동영상</a></li>
								</ul>
							</li>
	
							<li>
								<a>커뮤니티</a>
								<ul class="sub-nav">
									<li><a href="${pageContext.request.contextPath}/notice/list.do">공지사항</a></li>
									<c:choose>
										<c:when test="${Admin != null }"><!-- 관리자 로그인 시 -->
											<li><a href="${pageContext.request.contextPath}/qr/list.do">문의하기</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="${pageContext.request.contextPath}/qb/list.do">문의하기</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</li>
						</ul>
	
						<div id="rsv-menu">
							<a href="${pageContext.request.contextPath}/rsv/rsvStep1.do">예약</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ↑ 공통영역 -->
		
		<div id="section">
			<div id="section-wrap">
