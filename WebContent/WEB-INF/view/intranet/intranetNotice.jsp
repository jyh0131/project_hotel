<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<%@ include file="/WEB-INF/view/include/intranet/intranetSideMenu.jsp"%>
<link href="${pageContext.request.contextPath}/css/intranet/intranetCommon.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/intranet/intranetNotice.css" rel="stylesheet" type="text/css">

<h2>공지사항</h2>

<div class="intra-main-wrap">
	<div class="main-notice-wrap">
		<div class="main-notice1">
			<div class="notice-title">
				직원 공지사항
			</div>
			<div class="notice-list">
				<ul>
					<li><a href="#">품행을 단정히 마음을 소중히</a></li>
					<li><a href="#">진상에게는 고개숙이지 맙시다</a></li>
					<li><a href="#">여기서는 제가 짱이기 때문에 저한테 다 말하세요</a></li>
					<li><a href="#">이번 회식은 장어구이입니다😎🎇</a></li>
					<li><a href="#">관리자는 특별예약 가능하니 회원에서 예약하지 마세요</a></li>
				</ul>
			</div>
		</div>
		<div class="main-notice2">
			<div class="notice-title">
				버그 리포트
			</div>
			<div class="notice-list">
				<ul>
					<li><a href="#">비밀번호변경 에러 안뜨는 오류 수정했습니다</a></li>
					<li><a href="#">정보변경 자잘한 오류 수정했습니다</a></li>
					<li><a href="#">회원예약에서 관리자 아이디로 예약 못하게 처리했습니다</a></li>
					<li><a href="#">메뉴 비율 안맞는거 수정했습니다</a></li>
					<li><a href="#">메인 화면 수정했습니다</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="main-notice-wrap">
		<div class="main-notice1">
			<div class="notice-title">
				직원 요청
			</div>
			<div class="notice-list">
				<ul>
					<li><a href="#">직원 커뮤니티 게시판 언제 만들어주시나요?</a></li>
					<li><a href="#">밥이 맨날 똑같은 것 같아요</a></li>
					<li><a href="#">직원 특별예약도 회원에서 하게 해주세요</a></li>
					<li><a href="#">직원 좀 더 뽑아주세요... 심심해요..</a></li>
					<li><a href="#">이번 공휴일에 쉬나요?</a></li>
				</ul>
			</div>
		</div>
		<div class="main-notice2">
			<div class="notice-title">
				-
			</div>
			<div class="notice-list">
				<ul>
					<li><a href="#">2019-11-07</a></li>
					<li><a href="#">2019-11-06</a></li>
					<li><a href="#">2019-11-05</a></li>
					<li><a href="#">2019-11-04</a></li>
					<li><a href="#">2019-11-03</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/view/include/intranet/intranetBottom.jsp"%>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>