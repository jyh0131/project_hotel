<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<%@ include file="/WEB-INF/view/include/intranet/intranetSideMenu.jsp"%>
<link href="${pageContext.request.contextPath}/css/rsv_form.css" rel="stylesheet" type="text/css">

<style>
	#section-wrap{
		padding:50px;
		margin:0 auto;
		width:70%;
	}
	#r_updateWrap{
		margin:0 auto;
		width:70%;
	}
	table{
		margin:15px 0;
		width:100%;
	}
	table, th, td{
		border:1px solid black;
		border-collapse: collapse;
		padding:10px;
		font-size: 18px;
		width:60%;
	}
	th{
		text-align: center;
		width:140px;
	}
	select, option{
		padding:5px;
		width:160px;
		font-size: 18px;
	}
	input{
		padding:10px 5px;
		font-size: 18px;
	}
	.inputText{
		margin-right:10px;
		width:160px;
	}
	label{
		margin:0 5px;
		font-size: 18px;
	}
	/* ------ 등록하기, 처음부터 버튼 -----  */
	 #btnBox{
	 	overflow: hidden;
	 	text-align: center;
	 	width:60%;
	 }
	.btn{
		width:100px;
		line-height: 40px;
		display: inline-block;
		text-align: center;
		color:black;
		background:rgba(71, 163, 218, 0.8);
		border:none;
		padding:0;
	}
	.btn:hover{
		color:rgba(250, 236, 197, 0.8);
	}
</style>
<script>
	$(function(){
		//콤마찍는 메소드
		function addComma(num) {
			  var regexp = /\B(?=(\d{3})+(?!\d))/g;
			  return num.toString().replace(regexp, ',');
		}
		
		$("form").submit(function(){
			// 전망 타입
			var vt_no = $("input[name='vt_no']:checked").length;
			if(vt_no == 0){
				alert("전망타입을 선택해주세요");
				return false; // 전송을 막음
			}
			
			// 침대 타입
			var bt_no = $("input[name='bt_no']:checked").length;
			if(bt_no == 0){
				alert("침대타입을 선택해주세요");
				return false; // 전송을 막음
			}
			
			// 호수
			var room_no = $("input[name='room_no']").val();
			if(room_no == ""){
				alert("호수를 입력해주세요");
				return false; // 전송을 막음
			}
			
			// 가격
			var room_price = $("input[name='room_price']").val();
			if(room_price == ""){
				alert("가격를 입력해주세요");
				return false; // 전송을 막음
			}
			
			// 숫자 아닐 시에 전송 막기
			var reg = /^[0-9]+$/; // 숫자만 입력되도록
			
			if(reg.test(room_no) == false || reg.test(room_price) == false){
				alert("숫자만 입력해주세요");
				return false; // 전송을 막음
			}
		})
		
	})
</script>
<div id="r_updateWrap">
	<h1>객실 수정</h1>
	<form action="update.do" method="post" ><!-- enctype="multipart/form-data" -->
		<table>
			<tr>
				<th>객실 이름</th>
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
				<th>전망 타입</th>
				<td>
					<input type="radio" name="vt_no" value=1 id="mountain" ${(room.viewType.vtName)=="산"?'checked="checked"':''}><label for="mountain">산</label>
					<input type="radio" name="vt_no" value=2 id="ocean" ${(room.viewType.vtName)=="바다"?'checked="checked"':''}><label for="ocean">바다</label>
					<input type="radio" name="vt_no" value=3 id="garden" ${(room.viewType.vtName)=="정원"?'checked="checked"':''}><label for="garden">정원</label>
				</td>
			</tr>
			<tr>
				<th>침대 타입</th>
				<td>
					<input type="radio" name="bt_no" value=1 id="double" ${(room.bedType.btName)=="더블"?'checked="checked"':''}><label for="double">더블</label>
					<input type="radio" name="bt_no" value=2 id="twin" ${(room.bedType.btName)=="트윈"?'checked="checked"':''}><label for="twin">트윈</label>
					<input type="radio" name="bt_no" value=3 id="ondol" ${(room.bedType.btName)=="온돌"?'checked="checked"':''}><label for="ondol">온돌</label>
				</td>
			</tr>
			<tr>
				<th>객실 크기</th>
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
				<th>호수</th>
				<td><input type="text" name="room_no" value="${room.roomNo }" readonly="readonly" class="inputText">호</td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="room_price" value="${room.roomPrice }" class="inputText">원</td>
			</tr>
			<!-- <tr>
				<td>이미지</td>
				<td><input type="file" name="file"></td>
			</tr> -->
		</table>
		<div id="btnBox">
			<input type="submit" value="수정완료" class="btn">
			<input type="reset" value="처음부터" class="btn">
		</div>
	</form>
</div>


<%@ include file="/WEB-INF/view/include/footer.jsp"%>
