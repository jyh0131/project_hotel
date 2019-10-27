<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>

<div>
	<form action="update.do" method="post">
		<table>
			<tr>
				<td>이미지</td>
				<td><img src="${pageContext.request.contextPath }/upload/${picture.picFile }"></td>
			</tr>
			<tr>
				<td>파일명</td>
				<td><input type="text" name="pic_file" value="${picture.picFile }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>갤러리 분류</td>
				<td>
					<select name="g_no">
						<option value=1 ${(picture.gType.gName)=="객실"?'selected="selected"':'' }>객실</option>
						<option value=2 ${(picture.gType.gName)=="다이닝"?'selected="selected"':'' }>다이닝</option>
						<option value=3 ${(picture.gType.gName)=="액티비티"?'selected="selected"':'' }>액티비티</option>
						<option value=4 ${(picture.gType.gName)=="부대시설"?'selected="selected"':'' }>부대시설</option>
						<option value=5 ${(picture.gType.gName)=="기타"?'selected="selected"':'' }>기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>객실 분류</td>
				<td>
					<select name="rc_no">
						<option value=1 ${(picture.roomCategory.rcName)=="스탠다드"?'selected="selected"':''}>스탠다드</option>
						<option value=2 ${(picture.roomCategory.rcName)=="디럭스"?'selected="selected"':''}>디럭스</option>
						<option value=3 ${(picture.roomCategory.rcName)=="테라스"?'selected="selected"':''}>테라스</option>
						<option value=4 ${(picture.roomCategory.rcName)=="프리미어"?'selected="selected"':''}>프리미어</option>
						<option value=5 ${(picture.roomCategory.rcName)=="프리미어 테라스"?'selected="selected"':''}>프리미어 테라스</option>
						<option value=6 ${(picture.roomCategory.rcName)=="퍼시픽 디럭스"?'selected="selected"':''}>퍼시픽 디럭스</option>
						<option value=7 ${(picture.roomCategory.rcName)=="로열 스위트"?'selected="selected"':''}>로열 스위트</option>
						<option value=8 ${(picture.roomCategory.rcName)=="프레지덴셜 스위트"?'selected="selected"':''}>프레지덴셜 스위트</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
					<input type="reset" value="처음부터">
				</td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>