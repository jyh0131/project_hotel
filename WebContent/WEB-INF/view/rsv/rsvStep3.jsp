<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="${pageContext.request.contextPath}/css/rsv/rsvStep4.css" rel="stylesheet" type="text/css">

<!-- 예약마지막 -->
<div class="rsv-step-wrap">
	<!-- background로 step 넣기 -->
</div>

<div class="rsv-cpl-wrap">
	<div class="rsv-cpl-top">
		<p>
			${rsv.member.mName} 고객님 감사합니다.
			<a href="#">
				인쇄
			</a>
		</p>
		
		<h1>
			예약이 완료되었습니다.
			<span class="rsv-cpl-num">
				<small>예약번호</small>
				${rsv.rNo}
			</span>
			
		</h1>
		
		<p>
			예약하신 내용이 예약 시 입력하신 이메일로 발송되었습니다.<br>
			예약 번호를 메모해두시면 빠르고 편리하게 예약을 확인하실 수 있습니다.<br>
			문의사항은 예약실로 전화주시기 바랍니다.
		</p>
		
		<ul>
			<li>
				<label>고객명</label>
				<span>${rsv.member.mName}</span>
			</li>
			<li>
				<label>연락처</label>
				<span>${rsv.member.mPhone}</span>
			</li>
			<li>
				<label>이메일</label>
				<span>${rsv.member.mMail}</span>
			</li>
		</ul>
	</div>
	
	<div class="rsv-cpl-bottom">
		<div class="cpl-bottom-content-wrap">
			<div class="cpl-bottom-content">
				<h3>PROJECT HOTEL</h3>
				<p>날짜/투숙인원</p>
				<ul>
					<li>
						· 체크인
						
						<span><fmt:formatDate value="${rsv.rIn}" pattern="yyyy-MM-dd" /></span>
					</li>
					<li>
						· 체크아웃
						<span><fmt:formatDate value="${rsv.rOut}" pattern="yyyy-MM-dd" /></span>
					</li>
					<li>
						· 숙박일수
						<span>${rsv.rStay}박</span>
					</li>
					<li>
						· 투숙인원
						<span>성인: ${rsv.rPsnAdt}명 / 어린이: ${rsv.rPsnCdr}명</span>
					</li>
				</ul>
			</div>
		
			<div class="cpl-bottom-content">
				<p>객실/패키지</p>
				<ul>

					<li>
						· 객실
						<span>${rsv.room.roomCategory.rcName} / ${rsv.room.viewType.vtName}</span>
					</li>
					<li>
						· 침대타입
						<span>${rsv.room.bedType.btName}</span>
					</li>
					<li>
						· 객실요금
						<c:set var="stayPrice" value="${rsv.room.roomPrice * rsv.rStay}" />
						<span><fmt:formatNumber value="${stayPrice}" pattern="###,###" /> 원</span>
					</li>
					<li>
						　<!-- 그냥 디스플레이가 맘에 안들어서 넣어보았어요 -->
						　
					</li>
					<li>
						　<!-- 그냥 디스플레이가 맘에 안들어서 넣어보았어요 -->
						　
					</li>
				</ul>
			</div>
		
			<div class="cpl-bottom-content">
				<p>옵션</p>
				<c:set var="opPrice" value="0" />
				<ul>
					<c:if test="${fn:contains(rsv.opNo, '1')}">
						<c:set var="opPrice" value="${opPrice + 40000}" />
						<li>
							· 옵션
							<span>Extra bed</span>
						</li>
					</c:if>
					
					<c:if test="${fn:contains(rsv.opNo, '2')}">
						<c:set var="opPrice" value="${opPrice + (32000 * rsv.rPsnAdt)}" />
						<li>
						　
							<span>Daily Breakfast(Audult)</span>
						</li>
					</c:if>
					
					<c:if test="${fn:contains(rsv.opNo, '3')}">
						<c:set var="opPrice" value="${opPrice + (23000 * rsv.rPsnCdr)}" />
						<li>
						　
							<span>Daily Breakfast(Children)</span>
						</li>
					</c:if>
					
					<li>
						· 옵션요금
						<span><fmt:formatNumber value="${opPrice}" pattern="###,###" /> 원</span>
					</li>
					
					<li style="border-top:1px dotted #ccc;">
						· 봉사료
						<c:set var="svcPrice" value="${(stayPrice + opPrice) / 10}" />
						<span><fmt:formatNumber value="${svcPrice}" pattern="###,###" /> 원</span>
					</li>
					<li>
						· 부가가치세
						<c:set var="vatPrice" value="${(stayPrice + opPrice + svcPrice) / 10}" />
						<span><fmt:formatNumber value="${vatPrice}" pattern="###,###" /> 원</span>
					</li>
				</ul>
				<h3><fmt:formatNumber value="${rsv.rTotalPrice}" pattern="###,###" /> 원</h3>
			</div>
		</div>
	</div>
	
	<div class="btn-area">
		<a href="${pageContext.request.contextPath}/index.jsp">
			<span class="btnHome">[메인으로]</span>
		</a>
		<a href="#">
			<span class="btnMod">[예약리스트]</span>
		</a>
	</div>
</div>

<% session.removeAttribute("rsv");%>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>


