<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<%@ include file="/WEB-INF/view/include/intranet/intranetSideMenu.jsp"%>
<link href="${pageContext.request.contextPath}/css/intranet/intranetMemberMng.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/js/intranet/intranetMemberMng.js"></script>

<h2>회원관리(회원)</h2>

<div class="intra-mem-list">
	<div class="mem-sel-list">
		<ul>
			<li><a href="${pageContext.request.contextPath}/intranet/member/list.do"><b>회원</b></a></li>
			<li><a href="${pageContext.request.contextPath}/intranet/admin/list.do">관리자</a></li>
		</ul>
	</div>
	
	<div class="mem-list-state">
		<select name="memState">
			<option>전체</option>
			<option>일반회원만</option>
			<option>탈퇴회원만</option>
		</select>
	</div>

	<table>
		<tr>
			<th>회원번호</th>
			<th>성명</th>
			<th>아이디</th>
			<th>생년월일</th>
			<th>이메일</th>
			<th>연락처</th>
			<th>가입일</th>
			<th>비고</th>
		</tr>
		<!-- 회원이 존재하지 않을떄 -->
		<c:if test="${list == null}">
			<tr class="centerAlign">
				<td colspan="8">등록된 회원이 없습니다.</td>
			</tr>
		</c:if>
		
		<!-- 회원이 존재할떄 -->
		<c:if test="${list != null}">
			<c:forEach var="mem" items="${list}">
				<tr>
					<td>${mem.mNo}</td>
					
					<td>${mem.mName}</td>
					
					<td>${mem.mId}</td>
					
					<td>
						<fmt:formatDate value="${mem.mBirth}" pattern="yyyy-MM-dd"/>
					</td>
					
					<td>
						${mem.mMail}
					</td>
					
					<td>(HP) ${mem.mPhone} / (TEL) ${mem.mTel}</td>
					
					<td>
						<fmt:formatDate value="${mem.mRegdate}" pattern="yyyy-MM-dd"/>
					</td>

					<td>
						<c:if test="${mem.mQuitdate != null}">
							<span style='color:#DF4D4D;'>탈퇴한 회원</span>
						</c:if>
					</td>
				</tr>
				<tr class="tr-addr">
					<td colspan="8">
						주소: (${mem.mZipcode}) ${mem.mAddr1} ${mem.mAddr2}
					</td>
				</tr>
			</c:forEach>
		</c:if>	
	</table>
</div>


<%@ include file="/WEB-INF/view/include/intranet/intranetBottom.jsp"%>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>