<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<div>
	<form action="room/add.do" method="post" enctype="mulitpart/form-data">
		<table><!-- name 임시로 지정 -->
			<tr>
				<td>객실 이름</td>
				<td>
					<select name="room_name">
						<option value=1>스탠다드</option>
						<option>디럭스</option>
						<option>테라스</option>
						<option>프리미어</option>
						<option>프리미어 테라스</option>
						<option>퍼시픽 디럭스</option>
						<option>로열 스위트</option>
						<option>프레지덴셜 스위트</option>
					</select>
				</td>
			</tr>
			<!-- <tr>
				<td>객실 설명</td>
				<td><textarea rows="6" cols="50" name="detail"></textarea></td>
			</tr> -->
			<tr>
				<td>전망 타입</td>
				<td>
					<label>산</label><input type="radio" name="view_type" value=1>
					<label>바다</label><input type="radio" name="view_type" value=2>
					<label>정원</label><input type="radio" name="view_type" value=3>
				</td>
			</tr>
			<tr>
				<td>침대 타입</td>
				<td>
					<label>더블</label><input type="radio" name="bed_type" value=1>
					<label>트윈</label><input type="radio" name="bed_type" value=2>
					<label>온돌</label><input type="radio" name="bed_type" value=3>
				</td>
			</tr>
			<tr>
				<td>객실 크기</td>
				<td>
					<label>40</label><input type="radio" name="room_size" value=1>
					<label>46</label><input type="radio" name="room_size" value=2>
					<label>72</label><input type="radio" name="room_size" value=3>
					<label>158</label><input type="radio" name="room_size" value=4>
					<label>277</label><input type="radio" name="room_size" value=5>
				</td>
			</tr>
			<tr>
				<td>호수</td>
				<td><input type="text" name="room_no"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="room_price"></td>
			</tr>
			<tr>
				<td>이미지</td>
				<td><input type="file" name="file"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록">
					<input type="reset" value="처음부터">
				</td>
			</tr>
		</table>
	</form>
</div>


<%@ include file="../include/footer.jsp" %>