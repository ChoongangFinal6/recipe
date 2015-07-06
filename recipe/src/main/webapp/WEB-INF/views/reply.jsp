<%@ include file="aa.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- start of contents -->
<script type="text/javascript">
</script>
<div>
	<div id="comment_list">
		<ul id="commentUl">
			<c:forEach var="comment" items="${list }">
				<li id="commentLi_${comment.no }">
					<div id="commentDiv">
						<div id="info">
							<span id="writerId">${comment.email }</span> 
							<span id="writeDate"> 
								<fmt:formatDate type="both" pattern="yy/MM/dd hh:mm" value="${comment.writeDate }" />
							</span> 
							<span id="commentBtn" onclick="replyC(${comment.no})">답글</span>
							<c:if test="${email==comment.email || auth=='1'}">
								<span id="delSpan" onclick='delComment(${comment.no},${comment.postNo })'>X</span>
							</c:if>
						</div>
						<div id="main">
							<c:if test="${comment.refId != null}">&nbsp;<img alt="화살표" src='<c:url value="/resources/images/re.png"/>' width="10px" height="10px">
							</c:if>
							<c:if test="${comment.refId != comment.email && comment.refId != null}">
								<span class="refId">${comment.refId} 님께</span>
							</c:if>
							<span id="comment_content">${comment.content }</span>
						</div> 
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
	<c:if test="${email!=null }">
		<div id="commment_form">
			<form name="reply" method="post" action="reply.html">
				<div>
					<input type="hidden" value="${postNo}" name="postNo">
					<span><input type="hidden" value="${email}" name="email" id="email" readonly="readonly"></span>
					<input type="submit" value="입력" >
				</div>
				<div>
					<input type="text" placeholder="댓글을 입력하세요" name='content'>
				</div>
			</form>
		</div>
	</c:if>
	<!-- end of contents -->
</div>
