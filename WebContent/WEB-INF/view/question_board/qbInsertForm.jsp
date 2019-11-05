<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<style>
	#section-wrap{
		padding:50px;
	}
	table{
		margin:15px 0;
		width:900px;
		
	}
	table, th, td{
		border:1px solid black;
		border-collapse: collapse;
		padding:10px;
	}
	th{
		text-align: center;
		width:200px;
	}
	/* -------*부분 -------*/
	.needs{ 
		color:red;
		margin-left:10px;
	}
	select, option{
		padding:5px;
	}
	input{
		text-align: center;
	}
	input, textarea{
		padding:5px;
	}
	 /* ------- 목록 버튼 ------- */
	 #btnBox{
	 	width:900px;
	 	overflow: hidden;
	 }
	.btnList{
		margin-top:20px;
		width:100px;
		line-height: 40px;
		display: inline-block;
		text-align: center;
		color:black;
		background:rgba(250, 236, 197, 0.8);
		border:1px solid #FFE5CA;
		float: left;
	}
	.btnList:hover{
		color:rgba(71, 163, 218, 0.8);
	}
	/* ------ 등록하기, 처음부터 버튼 -----  */
	
	.btn{
		margin-top:20px;
		margin-left:20px;
		width:100px;
		line-height: 40px;
		display: inline-block;
		text-align: center;
		color:black;
		background:rgba(71, 163, 218, 0.8);
		border:1px solid rgba(71, 163, 218, 0.8);
		float: right;
		padding:0;
	}
	.btn:hover{
		color:rgba(250, 236, 197, 0.8);
	}
</style>
<script>
	$(function(){
		$("form").submit(function(){
			// 제목
			var title = $("input[name='qb_title']").val();
			if(title == ""){
				alert("제목을 입력해주세요");
				return false; // 전송을 막음
			}
			
			// 내용
			var content = $("textarea[name='qc_content']").val();
			if(content == ""){
				alert("내용을 입력해주세요");
				return false; // 전송을 막음
			}
			
			return true; // 전송

		})
	})
</script>
<div id="qbInsertWrap">
	<h1>문의글 등록하기</h1>
	<form action="insert.do" method="post" enctype="multipart/form-data">
		<input type="hidden" value="${member.mNo }" name="m_no">
		<table>
			<tr>
				<th>문의분류<span class="needs">*</span></th>
				<td>
					<select name="qb_category">
						<option value=1>결제 문의</option>
						<option value=2>예약 문의</option>
						<option value=3>객실 문의</option>
						<option value=4>시설 및 옵션 문의</option>
						<option value=5>기타 문의</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>제목<span class="needs">*</span></th>
				<td><input type="text" name="qb_title"></td>
			</tr>
			<tr>
				<th>성명<span class="needs">*</span></th>
				<td><input type="text" name="qb_name" value="${member.mName }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>이메일<span class="needs">*</span></th>
				<td><input type="email" name="qb_email" value="${member.mMail }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>휴대전화<span class="needs">*</span></th>
				<td><input type="tel" name="qb_phone" value="${member.mPhone }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>자택전화</th>
				<td><input type="tel" name="qb_tel" value="${member.mTel }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>내용<span class="needs">*</span></th>
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
		<div id="btnBox">
			<a href="${pageContext.request.contextPath }/qb/list.do" class="btnList">목록</a>
			<input type="submit" value="등록하기" class="btn">
			<input type="reset" value="처음부터" class="btn">
		</div>
	</form>
</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>