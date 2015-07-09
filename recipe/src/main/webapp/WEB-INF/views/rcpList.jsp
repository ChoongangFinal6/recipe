<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="aa.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center" style="margin-top: 40px;">
		
		<div style="width: 940px; margin-bottom: 50px;">
			<div style="width: 940px; height: 45px;" align="right" class="listcolor">
				<h1 class="list">레시피</h1>
			 <div style="width: 940px;height:10px; margin-top: -15px;" class="listcolor"></div>
			</div>
		</div>
		
		<div align="right" style="width: 940px; margin-bottom: 10px; margin-top: -20px;">
			<input type="button" id="write" class="button listcolor" value="글 작성">	
		</div>
		
		<table style="font-size: 20px;">
			<tr class="listtd listcolor" height="40px;">
				<th width="100px;">번호</th>
				<th width="320px;">제목</th>
				<th width="250px;">작성자</th>
				<th width="100px;">평점</th>
				<th width="150px;">등록일자</th>
			</tr>
			
			<c:forEach var="list"  items="${recipeList}">
			<tr height="40px;">
				<td align="center">${list.no}</td>
				<td style="padding-left: 15px;"><a href="detail.html?no=${list.no}&pageNo=${pageNo}">${list.name}</a></td>
				<td align="center">${list.email}</td>
				<td align="center">${list.rate}</td>
				<td align="center"><fmt:formatDate value="${list.writeDate}" pattern="yy/MM/dd"/> </td>
			</tr>			
			</c:forEach>
			
		</table>
		<div style="width: 940px; height:10px; margin-top: 5px;" class="listcolor"></div>
		
			<ul style="list-style: none;">
				<li>
					<c:if test="${startPage > blockSize }">
						<a href='rcpList.html?pageNo=${startPage-blockSize }'>&laquo;</a>
					</c:if>
				</li>
				
			
				<c:forEach begin="${startPage }" end="${endPage }" var="i">
					<c:if test="${pageNo == i }">
						<li class="active list-li">
					</c:if>
					<c:if test="${pageNo != i }">
						<li class="list-li">
					</c:if>
							<a href="rcpList.html?pageNo=${i }">[${i }]</a>
						</li>
				</c:forEach>
					<li>
						<c:if test="${endPage < pageCnt }">
							<a href='rcpList.html?pageNo=${startPage+blockSize }'>&raquo;</a>
						</c:if>
					</li>
			</ul>		
		</div>
</body>
</html>