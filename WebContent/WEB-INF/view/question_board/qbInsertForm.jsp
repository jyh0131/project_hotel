<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>

<div>
	<form action="insert.do" method="post" enctype="multipart/form-data">
		<input type="hidden" value="${member.mNo }" name="m_no">
		<table>
			<tr>
				<th>문의분류<span>*</span></th>
				<td>
					<select name="qb_category">
						<option value=0>결제 문의</option>
						<option value=1>예약 문의</option>
						<option value=2>객실 문의</option>
						<option value=3>시설 및 옵션 문의</option>
						<option value=4>기타 문의</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>제목<span>*</span></th>
				<td><input type="text" name="qb_title"></td>
			</tr>
			<tr>
				<th>성명<span>*</span></th>
				<td><input type="text" name="qb_name" value="${member.mName }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>이메일<span>*</span></th>
				<td><input type="email" name="qb_email" value="${member.mMail }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>휴대전화<span>*</span></th>
				<td><input type="tel" name="qb_phone" value="${member.mPhone }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>자택전화</th>
				<td><input type="tel" name="qb_tel" value="${member.mTel }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>내용<span>*</span></th>
				<td>
					<textarea rows="5" cols="70" name="qc_content"></textarea>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="qb_file"></td>
			</tr>
			<tr>
		</table>
		<div>
			<a href="${pageContext.request.contextPath }/qb/list.do">목록</a>
		</div>
		<div>
			<input type="submit" value="등록하기">
			<input type="reset" value="처음부터">
		</div>
	</form>
</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>