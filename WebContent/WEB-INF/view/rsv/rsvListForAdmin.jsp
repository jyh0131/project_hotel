<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/rsv/rsvListForAdmin.css" rel="stylesheet" type="text/css">


<div class="rsv-list-wrap">
	<div class="rsv-list">
		<table>
			<tr>
				<th>예약번호</th>
				<th>예약자명</th>
				<th>객실</th>
				<th>체크인/체크아웃(숙박일수)</th>
				<th>투숙인원</th>
				<th>금액</th>
				<th>결제날짜</th>
				<th>예약상태</th>
				<th></th>
			</tr>
			<c:if test="${list == null}">
				<tr>
					<td>등록된 예약이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${list != null}">
				<c:forEach var="rsv" items="${list}">
					<tr>
						<td>${rsv.rNo}</td>
						
						<td>${rsv.member.mName}</td>
						
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
						
						<td rowspan="2">
							<a href="#">취소<br>(여기서요..?)</a>
						</td>
					
					</tr>
					<tr>
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
</div>	


<%@ include file="/WEB-INF/view/include/footer.jsp"%>