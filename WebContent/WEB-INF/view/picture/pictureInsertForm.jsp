<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<link href="${pageContext.request.contextPath}/css/intanet/common.css" rel="stylesheet" type="text/css">
<style>
	table, td{
		border:1px solid black;
		border-collapse: collapse;
	}
	#p_table img{
		width:250px;
	}
</style>
<script>
	$(function(){
		$("#submitBtn").click(function(){
			alert($("input[name='pic_file']").val());
		})
	})
</script>
<div>
	<div id="p_menu">
		<ul>
			<li><a href="${pageContext.request.contextPath }/picture/list.do">사진 리스트 보기</a></li>
			<li><a href="${pageContext.request.contextPath }/picture/insert.do">사진 등록하기</a></li>
		</ul> 	
	</div>
	<form action="insert.do" method="post" enctype="multipart/form-data"><!--  -->
		<table>
			<tr>
				<td>이미지</td>
				<td><input type="file" name="pic_file"></td><!-- multiple="multiple"  -->
			</tr>
			<tr>
				<td>이미지 구분</td>
				<td>
					<input type="radio" name="pic_category" value="1" id="smallImg"><label for="smallImg">작은 이미지</label>
					<input type="radio" name="pic_category" value="2" checked="checked" id="basicImg"><label for="basic">원본 이미지</label>
					<input type="radio" name="pic_category" value="3" id="contentImg"><label for="contentImg">내용 이미지</label>
				</td>
			</tr>
			<tr>
				<td>갤러리 분류</td>
				<td>객실</td>
					
					<!--<select name="g_no">
						<option value=1>객실</option>
						<option value=2>다이닝</option>
						<option value=3>액티비티</option>
						<option value=4>부대시설</option>
						<option value=5>기타</option> 
					</select>
				</td>-->
			</tr>
			<tr>
				<td>객실 분류</td>
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
			<tr>
				<td colspan="2">
					<input type="submit" value="등록" id="submitBtn">
					<input type="reset" value="처음부터">
				</td>
			</tr>
		</table>
	</form>
</div>


<%@ include file="/WEB-INF/view/include/footer.jsp"%>
