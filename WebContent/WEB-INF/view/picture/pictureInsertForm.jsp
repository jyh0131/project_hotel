<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<%@ include file="/WEB-INF/view/include/intranet/intranetSideMenu.jsp"%>
<link href="${pageContext.request.contextPath}/css/intanet/common.css" rel="stylesheet" type="text/css">
<style>
	#section-wrap{
		padding:50px;
		margin:0 auto;
		width:100%;
	}
	#p_insertWrap {
		width: 80%;
		margin: 0 auto;
	}
	table{
		margin:15px 0;
		width:100%;
	}
	table, th, td{
		border:1px solid black;
		border-collapse: collapse;
		padding:15px;
		width:90%;
	}
	th{
		text-align: center;
		width:220px;
		min-width:200px;
	}
	select, option{
		padding:5px;
		width:180px;
	}
	label{
		margin:0 5px;
	}
	#p_table img{
		width:250px;
	}
	/* ------ 등록하기, 처음부터 버튼 -----  */
	 #btnBox{
	 	overflow: hidden;
	 	text-align: center;
	 	width:90%;
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
		$("form").submit(function(){
			// 첨부파일 없을 경우

			if($("input[name='pic_file']").val() == ""){
				alert("사진을 넣어주세요");
				return false;
			}
		})
	})
</script>
<div id="p_insertWrap">
	<h1>객실 사진 등록하기</h1>
	<form action="insert.do" method="post" enctype="multipart/form-data"><!--  -->
		<table>
			<tr>
				<th>이미지</th>
				<td><input type="file" name="pic_file"></td><!-- multiple="multiple"  -->
			</tr>
			<tr>
				<th>이미지 구분</th>
				<td>
					<input type="radio" name="pic_category" value="1" id="smallImg"><label for="smallImg">작은 이미지</label>
					<input type="radio" name="pic_category" value="2" checked="checked" id="basicImg"><label for="basic">원본 이미지</label>
					<input type="radio" name="pic_category" value="3" id="contentImg"><label for="contentImg">내용 이미지</label>
				</td>
			</tr>
			<tr>
				<th>갤러리 분류</th>
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
				<th>객실 분류</th>
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
		</table>
		<div id="btnBox">
			<input type="submit" value="등록" class="btn">
			<input type="reset" value="처음부터" class="btn">
		</div>
	</form>
</div>


<%@ include file="/WEB-INF/view/include/footer.jsp"%>
