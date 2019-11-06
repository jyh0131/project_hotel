<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<style>
	#section-wrap{
		padding:50px;
		margin:0 auto;
		width:70%;
	}
	#qbUpdateWrap{
		margin:0 auto;
		width:70%;
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
		width:170px;
	}
	/* -------*부분 -------*/
	.needs{ 
		color:red;
		margin-left:10px;
	}
	select, option{
		padding:5px;
		width:150px;
	}
	input{
		text-align: center;
		width:94%;
	}
	input, textarea{
		padding:10px 5px;
	}
	#titleInput{
		width:98%;
		text-align: left;
	}
	#fileInput{
		width:200px;
		cursor: pointer;
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
		background:#FBF0D1;
		border:1px solid #FBF0D1;
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
		border:none;
		float: right;
		padding:0;
		font-size: 16px;
	}
	.btn:hover{
		color:rgba(250, 236, 197, 0.8);
	}
	#updateTable img{
		width:200px;
	}
</style>
<script>
   $(function(){
		// 첨부파일 없을 경우
		var src = $(".imgFile").attr("src");
		if(src == "/project_hotel/upload/"){
			$(".imgFile").parent().text("첨부파일 없음");
		}
		
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
   })//ready
</script>
<div id="qbUpdateWrap">
	<h1>문의하기</h1>
	<form action="update.do" method="post" enctype="multipart/form-data">
		<input type="hidden" value="${qb.qbNo }" name="qbNo">
		<table id="updateTable">
			<tr>
				<th>문의분류<span class="needs">*</span></th>
				<td>
					<select name="qb_category">
						<option value=1 ${qb.qbCategory==1?'selected="selected"':'' }>결제 문의</option>
						<option value=2 ${qb.qbCategory==2?'selected="selected"':'' }>예약 문의</option>
						<option value=3 ${qb.qbCategory==3?'selected="selected"':'' }>객실 문의</option>
						<option value=4 ${qb.qbCategory==4?'selected="selected"':'' }>시설 및 옵션 문의</option>
						<option value=5 ${qb.qbCategory==5?'selected="selected"':'' }>기타 문의</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>제목<span class="needs">*</span></th>
				<td><input type="text" name="qb_title" value="${qb.qbTitle }" id="titleInput"></td>
			</tr>
			<tr>
				<th>내용<span class="needs">*</span></th>
				<td>
					<textarea rows="5" cols="98.7" name="qc_content">${qb.qcContent }</textarea>
				</td>
			</tr>
			<tr>
				<th rowspan="2">첨부파일</th>
				<td><img src="${pageContext.request.contextPath }/upload/${qb.qbPath}" class="imgFile"></td>
			</tr>
			<tr>
				<td><input type="file" name="qb_newFile" id="fileInput"></td>
			</tr>
		</table>
		
		<!-- 게시글에 이미 업로드 되어있는 파일 가져오기 위해 -->
		<input type="hidden" value="${qb.qbPath }" name="qb_oldFile">
		
		<div id="btnBox">
			<a href="${pageContext.request.contextPath }/qb/list.do" class="btnList">목록</a>
			<input type="submit" value="수정하기" class="btn">
			<input type="reset" value="처음부터" class="btn">
		</div>
	</form>
</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>