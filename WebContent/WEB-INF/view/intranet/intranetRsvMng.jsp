<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<%@ include file="/WEB-INF/view/include/intranet/intranetSideMenu.jsp"%>
<link href="${pageContext.request.contextPath}/css/util/datepicker.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/intranet/intranetRsvMng.css" rel="stylesheet" type="text/css">

<script src="${pageContext.request.contextPath}/js/util/datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/js/util/datepicker.en.js"></script>
<script src="${pageContext.request.contextPath}/js/intranet/intranetRsvMng.js"></script>


<h2>예약관리</h2>

<div class="rsv-list">
	<div class="rsv-date-wrap">
		<span>🎈기간별 리스트</span>
		<input type="text" name="rsvDate" class="datepicker-here" data-position="bottom center" data-date-format="yyyy-mm-dd"
				data-language="en" data-range="true" data-multiple-dates-separator="~" data-language="en" />
		<button id="btnSearch">보기</button>
	</div>	
	
	<div class="rsv-state-wrap">
		<select name="rsvState">
			<option>전체</option>
			<option>예약완료</option>
			<option>취소</option>
		</select>
	</div>
	
	<table>
		<tr>
			<th>예약번호</th>
			<th>예약자명</th>
			<th>객실</th>
			<th>체크인/체크아웃</th>
			<th>투숙인원</th>
			<th>금액</th>
			<th>결제날짜</th>
			<th>예약상태</th>
			<th>비고</th>
		</tr>
		<c:if test="${list == null}">
			<tr class='centerAlign'>
				<td colspan="9">등록된 예약이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${list != null}">
			<c:forEach var="rsv" items="${list}">
				<tr>
					<td>${rsv.rNo}</td>
					
					<td>
						${rsv.member.mName}<br>
						(${rsv.member.mId})
					</td>
					
					<td>
						${rsv.room.roomNo}호<br>
						${rsv.room.roomCategory.rcName} / ${rsv.room.viewType.vtName} / ${rsv.room.bedType.btName}
					</td>
					
					<fmt:formatDate value="${rsv.rIn}" pattern="yyy-MM-dd" var="ckIn"/>
					<fmt:formatDate value="${rsv.rOut}" pattern="yyy-MM-dd" var="ckOut"/>
					<td>
						${ckIn}~${ckOut}<br>
						(${rsv.rStay}박)
					</td>
					
					<td>성인: ${rsv.rPsnAdt}명 / 어린이: ${rsv.rPsnCdr}명</td>
				
					<fmt:formatNumber value="${rsv.rTotalPrice}" pattern="###,###" var="totalPrice" />	
					<td>${totalPrice} 원</td>
					
					<fmt:formatDate value="${rsv.rPayDate}" pattern="yyy-MM-dd" var="payDate"/>
					<td>${payDate}</td>
					
					<td>${rsv.rState}</td>
					
					<c:if test="${rsv.rState == '예약완료'}">
						<td rowspan="2" class="tr-bottom">
							<a href="${pageContext.request.contextPath}/rsvMng/mem/deleteRsv.do?no=${rsv.rNo}" id="aDel">취소</a>
						</td>
					</c:if>
					<c:if test="${rsv.rState == '취소'}">
						<td rowspan="2" class="canceled-rsv">취소됨</td>
					</c:if>
					
				
				</tr>
				<tr class="tr-bottom">
					<td colspan="8">
						요청사항: 
						<c:if test="${rsv.rRequest != null}">
							${rsv.rRequest}
						</c:if>
						<c:if test="${rsv.rRequest == null}">
							-
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>		
</div>	


<%@ include file="/WEB-INF/view/include/intranet/intranetBottom.jsp"%>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>