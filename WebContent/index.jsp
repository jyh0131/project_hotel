<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/util/backgroundTransition.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/util/backgroundTransition.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script>
  $(document).ready(function(){
	  $('.backgroundTransition').backgroundTransition({
		  backgrounds:[
			  { src: 'images/bg-img/bg1.jpg' },
			  { src: 'images/bg-img/bg2.jpg' },
			  { src: 'images/bg-img/bg3.jpg' },
			  { src: 'images/bg-img/bg4.jpg' },
			  { src: 'images/bg-img/bg5.jpg' },
			  { src: 'images/bg-img/bg6.jpg' },
			  { src: 'images/bg-img/bg7.jpg' }
		  ],
		  transitionDelay: 3,
		  animationSpeed: 800
	  });
  });
</script>
</head>
<body>
	<div id="container">
		<div id="head">
			<div id="header">
				<div id="logo-wrap">
					<a href="${pageContext.request.contextPath}/main.do"></a>
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
		</div>

		
		<div id="section">
			<h1 id="title-text">BLUA<br>LUNDO</h1>
 			<div class="backgroundTransition">
					
			</div>
			
			<div id="section-intro">
				<div id="intro-wrap">
					<div class="intro">
						<img src="images/bg-img/map-ico.png">
						<h2>LOCATION</h2>
						<p>
							Can you imagine what would happen if we could have any dream 
							I wish this moment was ours to own it and that it would never leave.
						</p>
					</div>
					
					<div class="intro">
						<img src="images/bg-img/ticket-ico.png">
						<h2>BUY TICKET</h2>
						<p>
							I am beautiful no matter what they say Words can't bring me down 
							I am beautiful in every single way yes words can't bring me down 
							So don't you bring me down today
						</p>
					</div>
					<div class="intro">
						<img src="images/bg-img/message-ico.png">
						<h2>CONTACT US</h2>
						<p>
							You are the only one who saw my yesterday The one who knows I'm here alive today 
							Comfort me, say what I mean to you You should know what you have to say
						</p>
					</div>
				</div>
			</div>
			
			<div id="section-etc">
				<div id="etc-bg"></div>
				<div class="etc-etc">
					<h2>NO MORE EMPTY SPACE</h2>
					<p>
						I've been on the low I been taking my time 
						I fell like I'm out of my mind 
						It feel like my life ain't mine
						I've been on the low I been taking my time 
						I fell like I'm out of my mind 
						It feel like my life ain't mine
					</p>
					<input type="text" placeholder="maybe you can use this thing"><button>SEND</button> 
				</div>
			</div>
			
			
			
		</div>
		
		
		<div id="footer">
			<div id="footer-wrap">
 				<div class="footer-info1">
					<p>
						BLUA LUNDO corp.<br>
					</p>
					<p>
						made by. <br>
						KIM SOOHEE ＆ LEE YEJI
					</p>
				</div>
				
				<div class="footer-logo">
					<a href="${pageContext.request.contextPath}/intranet/mng/sales.do"></a>
					<span>design by.7631</span>
				</div>
 				
 				<div class="footer-info2">
					<ul>
						<li><a href="${pageContext.request.contextPath}/qb/list.do">문의하기</a></li>
						<li><a>고객센터</a></li>
						<li><a>채용정보</a></li>
						<li><a>개인정보<br>처리방침</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>