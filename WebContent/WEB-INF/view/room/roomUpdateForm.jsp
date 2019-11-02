<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/rsv_form.css" rel="stylesheet" type="text/css">
<div>
	<form action="update.do" method="post" ><!-- enctype="multipart/form-data" -->
		<table>
			<tr>
				<td>객실 이름</td>
				<td>
					<select name="rc_no">
						<option value=1 ${(room.roomCategory.rcName)=="스탠다드"?'selected="selected"':''}>스탠다드</option>
						<option value=2 ${(room.roomCategory.rcName)=="디럭스"?'selected="selected"':''}>디럭스</option>
						<option value=3 ${(room.roomCategory.rcName)=="테라스"?'selected="selected"':''}>테라스</option>
						<option value=4 ${(room.roomCategory.rcName)=="프리미어"?'selected="selected"':''}>프리미어</option>
						<option value=5 ${(room.roomCategory.rcName)=="프리미어 테라스"?'selected="selected"':''}>프리미어 테라스</option>
						<option value=6 ${(room.roomCategory.rcName)=="퍼시픽 디럭스"?'selected="selected"':''}>퍼시픽 디럭스</option>
						<option value=7 ${(room.roomCategory.rcName)=="로열 스위트"?'selected="selected"':''}>로열 스위트</option>
						<option value=8 ${(room.roomCategory.rcName)=="프레지덴셜 스위트"?'selected="selected"':''}>프레지덴셜 스위트</option>
					</select>
				</td>
			</tr>
		<!-- 	<tr>
				<td>객실 설명</td>
				<td><textarea rows="6" cols="50" name="detail"></textarea></td>
			</tr> -->
			<tr>
				<td>전망 타입</td>
				<td>
					<input type="radio" name="vt_no" value=1 id="mountain" ${(room.viewType.vtName)=="산"?'checked="checked"':''}><label for="mountain">산</label>
					<input type="radio" name="vt_no" value=2 id="ocean" ${(room.viewType.vtName)=="바다"?'checked="checked"':''}><label for="ocean">바다</label>
					<input type="radio" name="vt_no" value=3 id="garden" ${(room.viewType.vtName)=="정원"?'checked="checked"':''}><label for="garden">정원</label>
				</td>
			</tr>
			<tr>
				<td>침대 타입</td>
				<td>
					<input type="radio" name="bt_no" value=1 id="double" ${(room.bedType.btName)=="더블"?'checked="checked"':''}><label for="double">더블</label>
					<input type="radio" name="bt_no" value=2 id="twin" ${(room.bedType.btName)=="트윈"?'checked="checked"':''}><label for="twin">트윈</label>
					<input type="radio" name="bt_no" value=3 id="ondol" ${(room.bedType.btName)=="온돌"?'checked="checked"':''}><label for="ondol">온돌</label>
				</td>
			</tr>
			<tr>
				<td>객실 크기</td>
				<td>
					<select name="rs_no">
						<option value=1 ${(room.roomSize.rsName)=="40"?'selected="selected"':''}>40</option>
						<option value=2 ${(room.roomSize.rsName)=="46"?'selected="selected"':''}>46</option>
						<option value=3 ${(room.roomSize.rsName)=="72"?'selected="selected"':''}>72</option>
						<option value=4 ${(room.roomSize.rsName)=="158"?'selected="selected"':''}>158</option>
						<option value=5 ${(room.roomSize.rsName)=="277"?'selected="selected"':''}>277</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>호수</td>
				<td><input type="text" name="room_no" value="${room.roomNo }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="room_price" value="${room.roomPrice }"></td>
			</tr>
			<!-- <tr>
				<td>이미지</td>
				<td><input type="file" name="file"></td>
			</tr> -->
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
