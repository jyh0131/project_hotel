<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<style>
	table{
		margin-top:10px;
		width:100%;
	}
	table, th, td{
		border:1px solid black;
		border-collapse: collapse;
		padding:10px;
		text-align: center;
	}
	#updateTable img{
		width:200px;
	}
</style>
<div>
	<form action="update.do" method="post" enctype="multipart/form-data">
		<input type="hidden" value="${qb.qbNo }" name="qbNo">
		<table id="updateTable">
			<tr>
				<th>문의분류<span>*</span></th>
				<td>
					<select name="qb_category">
						<option value=0 ${qb.qbCategory=='0'?'selected="selected"':'' }>결제 문의</option>
						<option value=1 ${qb.qbCategory=='1'?'selected="selected"':'' }>예약 문의</option>
						<option value=2 ${qb.qbCategory=='2'?'selected="selected"':'' }>객실 문의</option>
						<option value=3 ${qb.qbCategory=='3'?'selected="selected"':'' }>시설 및 옵션 문의</option>
						<option value=4 ${qb.qbCategory=='4'?'selected="selected"':'' }>기타 문의</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>제목<span>*</span></th>
				<td><input type="text" name="qb_title" value="${qb.qbTitle }"></td>
			</tr>
			<tr>
				<th>내용<span>*</span></th>
				<td>
					<textarea rows="5" cols="70" name="qc_content">${qb.qcContent }</textarea>
				</td>
			</tr>
			<tr>
				<th rowspan="2">첨부파일</th>
				<td><img src="${pageContext.request.contextPath }/upload/${qb.qbPath}"></td>
			</tr>
			<tr>
				<td><input type="file" name="qb_newFile"></td>
			</tr>
			<tr>
		</table>
		
		<!-- 게시글에 이미 업로드 되어있는 파일 가져오기 위해 -->
		<input type="hidden" value="${qb.qbPath }" name="qb_oldFile">
		
		<div>
			<a href="${pageContext.request.contextPath }/qb/list.do">목록</a>
		</div>
		<div>
			<input type="submit" value="수정하기">
			<input type="reset" value="처음부터">
		</div>
	</form>
</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>