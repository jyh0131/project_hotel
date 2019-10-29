<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/rsv/rsvListForMember.css" rel="stylesheet" type="text/css">

<div class="rsv-list-wrap">
	<div class="rsv-list">
		<table>
			<tr>
				<th>예약번호</th>
				<th>객실</th>
				<th>체크인/체크아웃</th>
				<th>숙박일수</th>
				<th>결제날짜</th>
			</tr>
			<c:forEach var="rsv" items="${list}">
				<tr>
					<td>${rsv.rNo}</td>
					<td>
						<a href="detail.do?no=${rsv.rNo}">
							${rsv.room.roomCategory.rcName} / ${rsv.room.viewType.vtName} / ${rsv.room.bedType.btName}
						</a>
					</td>
					<fmt:formatDate value="${rsv.rIn}" pattern="yyyy-MM-dd" var="ckIn" />
					<fmt:formatDate value="${rsv.rOut}" pattern="yyyy-MM-dd" var="ckOut" />
					<td>${ckIn} ~ ${ckOut}</td>
					<td>${rsv.rStay}</td>
					<td><fmt:formatDate value="${rsv.rPayDate}" pattern="yyyy-MM-dd" /></td>
					<td><a href="${pageContext.request.contextPath}/rsvMng/mem/deleteRsv.do?no=${rsv.rNo}" id="aDel">삭제</a></td>
				</tr>
			</c:forEach>
		</table>		
	</div>
</div>	
<%@ include file="/WEB-INF/view/include/footer.jsp"%>