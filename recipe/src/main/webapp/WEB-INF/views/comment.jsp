<%@ include file="aa.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="<c:url value="/resources/css/recipe.css" />" rel="stylesheet">
<!-- start of contents -->
<script type="text/javascript">
</script>
<div>
	<form name="frm" method="get" action="reWriteS.do">
	<input type="hidden" id="replyNo" name="replyNo" value="">
		<table id="replyTbl">
			<tr>
				<th class="idTh">아이디</th>
				<th class="contentTh">댓글</th>
				<th class="dateTh">시간</th>
				<th class="buttonTh"></th>
			</tr>
			<c:set var="firstId" value="" />
			<c:forEach var="replyS" items="${list }">
				<tr>
					<td class="idTd"><div class="rplId" align="center">${comment.id }</div></td>
					<td class="contentTd">
					<div class="rplContent">
						<c:if test="${comment.refId == NULL}">
						<c:set var="firstId" value="${comment.id }" />
						</c:if>
						<c:if test="${replyS.refId != NULL}">
						&nbsp;<img src='images/re.png' width="10px" height="10px">
						</c:if>
					<c:if test="${comment.refId != comment.id && comment.refId != NULL}">
						<span class="refId">${comment.refId} 님께</span>
					</c:if>
					${replyS.content }</div>
					<c:if test="${id==replyS.id || permS=='1'}">
					<span class="delSpan" onclick='delReply(${comment.replyNo})'>X</span>
					</c:if>
						
					</td>
					<td class="dateTd"><div class="rplDate"><fmt:formatDate type="both"
							pattern="yy/MM/dd hh:mm" value="${comment.writeDate }" /></div></td>
					<td class="buttonTd"><div class="rplBtnDiv"><button id="${comment.replyNo }"
						class="reRplBtn">덧글</button></div></td>
				</tr>
			</c:forEach>
			<c:if test="${id==null }">
			<tr><td colspan="4" style="text-align: center;padding: 15px 0px 15px 0px;font-size: 1.2em;">로그인 하시면 작성할 수 있습니다.</td></tr>
			</c:if>
			<c:if test="${id!=null }">
			<tr id='replyTr'>
				<td><div class="id">${id }</div></td>
				<td colspan="2"><div class="reCntntText"><textarea placeholder="댓글을 입력하세요" id='reContent' name='content' cols="50" rows="5"></textarea></div></td>
				<td><div class="submitBtnDiv"><input type="submit" value="입력" class="rplSubmitBtn"></div></td>
			</tr>
			</c:if>
		</table>
		<input type="hidden" value="${postNo}" name="postNo">
	</form>
	<!-- end of contents -->
</div>
