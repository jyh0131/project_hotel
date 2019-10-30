<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/rsv/rsvDetailForMember.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/js/rsv/rsvDetailForMember.js"></script>

<div class="rsv-detail-wrap">
	<div class="rsv-detail">
		<h3>예약정보</h3>
		<table>
			<tr>
				<th>예약번호</th>
				<td>${rsv.rNo}</td>
				<th>고객명</th>
				<td>${rsv.member.mName}</td>
			</tr>
			<tr>
				<th>체크인 날짜</th>
				<td><fmt:formatDate value="${rsv.rIn}" pattern="yyyy-MM-dd" /></td>
				<th>예약일자</th>
				<td><fmt:formatDate value="${rsv.rPayDate}" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<th>체크아웃 날짜</th>
				<td><fmt:formatDate value="${rsv.rOut}" pattern="yyyy-MM-dd" /></td>
				<th>투숙인원</th>
				<td>성인: ${rsv.rPsnAdt}명 / 어린이: ${rsv.rPsnCdr}명</td>
			</tr>
			<tr>
				<th>객실타입</th>
				<td>
					${rsv.room.roomCategory.rcName} / ${rsv.room.viewType.vtName} / ${rsv.room.bedType.btName}
				</td>
				<th>옵션선택</th>
				<td>
					<c:if test="${fn:contains(rsv.opNo, '1')}">
						침대 추가 / 
					</c:if>
					<c:if test="${fn:contains(rsv.opNo, '2')}">
						조식 추가(성인) 
					</c:if>
					<c:if test="${fn:contains(rsv.opNo, '3')}">
						/ 조식 추가(어린이)
					</c:if>
				</td>
			</tr>
			<tr>
				<th colspan="2">　</th>
				<th>객실 요금</th>
				<fmt:formatNumber var="rmPrice" value="${rsv.room.roomPrice}" pattern="###,###" />
				<td>${rmPrice} 원(${rsv.rStay}박)</td>
			</tr>
			<tr>
				<th colspan="2">　</th>
				<th>부가가치세 ＆ 봉사료</th>
				<td>123,456 원</td> 
			</tr>
			<tr>
				<th colspan="2">　</th>
				<th>요금합계</th>
				<fmt:formatNumber var="totalPrice" value="${rsv.rTotalPrice}" pattern="###,###" />
				<td>${totalPrice} 원</td>
			</tr>
			<caption>※부가가치세 10% 및 봉사료 10%(합계 21%)가 포함된 금액입니다.</caption>
		</table>
		
		<h3>카드 정보</h3>
		<table>
			<tr>
				<th>카드번호</th>
				<td colspan="3">************2314</td> <!-- 추후에 수정! -->
			</tr>
			<tr>
				<th>카드종류</th>
				<td>${pay.pCardType}</td>
				<th>유효기간</th>
				<td>${pay.pValidMonth} / ${pay.pValidYear}</td>
			</tr>
		</table>

		<h3>요청사항</h3>
		<table>
			<tr>
				<td colspan="3">${rsv.rRequest}</td>
			</tr>
		</table>
		
		<h3>예약취소 및 변경안내</h3>
		<table>
			<tr>
				<td>
					홈페이지를 통한 온라인 예약의 경우 체크인 날짜 기준 7일 전까지의 예약건만 온라인에서 취소 및 변경이 가능합니다.<br>
					자세한 사항은 호텔 예약실로 전화주시기 바랍니다.
				</td>
			</tr>
		</table>
		
		<div class="rsv-detail-btn-wrap">
			<a href="list.do">목록</a>
		</div>
	</div>
</div>	

<%@ include file="/WEB-INF/view/include/footer.jsp"%>