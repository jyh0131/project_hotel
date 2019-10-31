<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/rsv/rsvListForMember.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/js/rsv/rsvListForMember.js"></script>

<div class="rsv-list-wrap">
	<div class="rsv-list">
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
				<th>객실</th>
				<th>체크인/체크아웃</th>
				<th>숙박인원</th>
				<th>결제날짜</th>
				<th></th>
			</tr>
			<c:forEach var="rsv" items="${list}">
				<tr>
					<td>${rsv.rNo}</td>
					<c:if test="${rsv.rState == '예약완료'}">
						<td>
							<a href="detail.do?no=${rsv.rNo}">
								${rsv.room.roomCategory.rcName} / ${rsv.room.viewType.vtName} / ${rsv.room.bedType.btName}
							</a>
						</td>
					</c:if>
					<c:if test="${rsv.rState == '취소'}">
						<td>
							<a>
								${rsv.room.roomCategory.rcName} / ${rsv.room.viewType.vtName} / ${rsv.room.bedType.btName}
							</a>
						</td>
					</c:if>
					<fmt:formatDate value="${rsv.rIn}" pattern="yyyy-MM-dd" var="ckIn" />
					<fmt:formatDate value="${rsv.rOut}" pattern="yyyy-MM-dd" var="ckOut" />
					<td>
						${ckIn} ~ ${ckOut}<br>
						(${rsv.rStay}박)
					</td>
					<td>성인: ${rsv.rPsnAdt}명 / 어린이: ${rsv.rPsnCdr}명</td>
					<td><fmt:formatDate value="${rsv.rPayDate}" pattern="yyyy-MM-dd" /></td>
			
					<c:if test="${rsv.rState == '예약완료'}">
						<td><a href="${pageContext.request.contextPath}/rsvMng/mem/deleteRsv.do?no=${rsv.rNo}" id="aDel">예약취소</a></td>
					</c:if>
					<c:if test="${rsv.rState == '취소'}">
						<td>취소된 예약</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>		
	</div>
</div>	
<%@ include file="/WEB-INF/view/include/footer.jsp"%>