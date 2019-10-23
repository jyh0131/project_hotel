<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/rsv_form.css" rel="stylesheet" type="text/css">
<script>
	$(function(){
		//alert($("#garden").val());
	})
</script>
<div>
	<form action="add.do" method="post" ><!-- enctype="mulitpart/form-data" -->
		<table><!-- name 임시로 지정 -->
			<tr>
				<td>객실 이름</td>
				<td>
					<select name="rc_no">
						<option value=1>스탠다드</option>
						<option value=2>디럭스</option>
						<option value=3>테라스</option>
						<option value=4>프리미어</option>
						<option value=5>프리미어 테라스</option>
						<option value=6>퍼시픽 디럭스</option>
						<option value=7>로열 스위트</option>
						<option value=8>프레지덴셜 스위트</option>
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
					<input type="radio" name="vt_no" value=1 id="mountain"><label for="mountain">산</label>
					<input type="radio" name="vt_no" value=2 id="ocean"><label for="ocean">바다</label>
					<input type="radio" name="vt_no" value=3 id="garden"><label for="garden">정원</label>
				</td>
			</tr>
			<tr>
				<td>침대 타입</td>
				<td>
					<label>더블</label><input type="radio" name="bed_no" value=1>
					<label>트윈</label><input type="radio" name="bed_no" value=2>
					<label>온돌</label><input type="radio" name="bed_no" value=3>
				</td>
			</tr>
			<tr>
				<td>객실 크기</td>
				<td>
					<select name="rs_no">
						<option value=1>40</option>
						<option value=2>46</option>
						<option value=3>72</option>
						<option value=4>158</option>
						<option value=5>277</option>
					</select>
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
			<!-- <tr>
				<td>이미지</td>
				<td><input type="file" name="file"></td>
			</tr> -->
			<tr>
				<td colspan="2">
					<input type="submit" value="등록">
					<input type="reset" value="처음부터">
				</td>
			</tr>
		</table>
	</form>
</div>


<%@ include file="/WEB-INF/view/include/footer.jsp"%>
