<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<%@ include file="/WEB-INF/view/include/intranet/intranetSideMenu.jsp"%>
<link href="${pageContext.request.contextPath}/css/intanet/common.css" rel="stylesheet" type="text/css">
<script>
	$(function(){
		//alert($("#garden").val());
	})
</script>
<style>
	#section-wrap{
		padding:50px;
		margin:0 auto;
		width:70%;
	}
	#r_insertWrap{
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
		width:180px;
		font-size: 18px;
	}
	input{
		padding:10px 5px;
		font-size: 18px;
	}
	.inputText{
		margin-right:10px;
		width:165px;
		text-align: center;
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
	 #btnBox p{
	 	padding:20px;
	 	color:red;
	 	font-weight: bold;
	 	font-size: 18px;
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
		font-size: 16px;
		cursor: pointer;
	}
</style>
<script>
	$(function(){
		
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
<div id="r_insertWrap">
	<h1>객실 등록하기</h1>
	<form action="insert.do" method="post"><!-- enctype="mulitpart/form-data" -->
		<table><!-- name 임시로 지정 -->
			<tr>
				<th>객실 이름</th>
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
				<th>전망 타입</th>
				<td>
					<input type="radio" name="vt_no" value=1 id="mountain"><label for="mountain">산</label>
					<input type="radio" name="vt_no" value=2 id="ocean"><label for="ocean">바다</label>
					<input type="radio" name="vt_no" value=3 id="garden"><label for="garden">정원</label>
				</td>
			</tr>
			<tr>
				<th>침대 타입</th>
				<td>
					<input type="radio" name="bt_no" value=1 id="double"><label for="double">더블</label>
					<input type="radio" name="bt_no" value=2 id="twin"><label for="twin">트윈</label>
					<input type="radio" name="bt_no" value=3 id="ondol"><label for="ondol">온돌</label>
				</td>
			</tr>
			<tr>
				<th>객실 크기</th>
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
				<th>호수</th>
				<td><input type="text" name="room_no" class="inputText">호</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>
					<input type="text" name="room_price" placeholder="숫자만 입력" class="inputText">원
				</td>
			</tr>
			<!-- <tr>
				<td>이미지</td>
				<td><input type="file" name="pic_file"></td>
			</tr> -->
		</table>
		<div id="btnBox">
			<c:if test="${error != null}">
				<p>호수가 중복되어 등록할 수 없습니다.</p>
			</c:if>
			<input type="submit" value="등록" class="btn">
			<input type="reset" value="처음부터" class="btn">
		</div>
	</form>
</div>


<%@ include file="/WEB-INF/view/include/footer.jsp"%>
