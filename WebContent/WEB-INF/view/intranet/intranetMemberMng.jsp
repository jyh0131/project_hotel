<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<%@ include file="/WEB-INF/view/include/intranet/intranetSideMenu.jsp"%>
<link href="${pageContext.request.contextPath}/css/intranet/intranetMemberMng.css" rel="stylesheet" type="text/css">

<h2>회원관리</h2>

<div class="intra-mem-list">
	<div class="mem-list-state">
		<select name="memState">
			<option>전체</option>
			<option>회원만</option>
			<option>탈퇴회원만</option>
			<option>관리자만</option>
		</select>
	</div>

	<table>
		<tr>
			<th>회원번호</th>
			<th>성명</th>
			<th>아이디</th>
			<th>생년월일</th>
			<th>이메일</th>
			<th>연락처(휴대전화/자택전화)</th>
			<th>가입일</th>
		</tr>
		<tr>
			<td>1</td>
			<td>김믜믜</td>
			<td>mlmlml</td>
			<td>1993-02-23</td>
			<td>mlml@mlml.ml</td>
			<td>
				(HP) 01012341234<br>
				(TEL) 0534283399
			</td>
			<td>2019-10-31</td>
		</tr>
		<tr>
			<td colspan="7">주소: 대구광역시 동구 동부로 29, 신천역 까사밀라 101-203</td>
		</tr>
	</table>
</div>


<%@ include file="/WEB-INF/view/include/intranet/intranetBottom.jsp"%>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>