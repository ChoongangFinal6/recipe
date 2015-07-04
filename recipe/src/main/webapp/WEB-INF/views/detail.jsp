<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="aa.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${recipe.name}</title>
</head>
<body>
<div align="center" style="margin-top: 40px;">
	<div style="width: 940px;">
		<div style="width: 940px;" align="left">
			<h1 style="margin-left: 10px;">${recipe.name}</h1>
		</div>		
		
		<div style="border: 2px solid black; margin-top: -15px; width: 940px;"></div>
		
		<div style="border: 1px solid black; margin-top: 15px; padding: 20px; height: 60px;">
			<span style="font-size: 17px; margin-right: 20px; float: left;">요리명 : </span>${recipe.name}
			
			
			<div style="float: right; width:350px; margin-bottom: 10px;" align="right">			
					<c:if test="${recipe.oven=='Y'}">오븐</c:if>
					<c:if test="${recipe.oven=='N'}">오븐x</c:if>
			</div>
			
			<div style="float: left; margin-top: 10px;">			
				${recipe.country}
				
				${recipe.amount }
				
				${recipe.difficulty }
				
			</div>
		
			<div style="float: right; margin-top: 10px;">걸리는 시간 
			${recipe.time }
			</div>
		</div>
	
	<div style="width: 940px;" align="left">
		<h3 style="margin-left: 10px;">재료</h3>
		<div style="border: 2px solid black; margin-top: -10px;"></div><p>
	</div>
	<div style="border: 1px solid black; padding: 10px;">
		<div>
			<ul id="ul-material">
				<c:forEach var="mt" items="${mList}">
					<li><div>${mt[0]} ${mt[2]}${mt[1]}</div></li>
				</c:forEach>
			</ul>
		</div>		
	</div>
	<div style="width: 940px;" align="left">
		<h3 style="margin-left: 10px;">내용</h3>
	</div>
	<div style="border: 2px solid black; margin-top: -10px;"></div><p>
	
	<div style="border: 2px solid black; overflow: auto; padding: 10px; vertical-align:middle;" align="center" id="div-content">
		
			<ul style="list-style:none;" id="wcontent">
				<li>
				
					<table class="content-table">
						<c:forEach items="${content}" var="cntnt">
						<tr>
							<td><div id="image" class="content-table-div-left"><img alt="${cntnt.image}" src="image/${cntnt.image }"></div></td>
							<td style="padding-left: 10px;"><div class="content-table-div-right" id="content">${cntnt.content }</div></td>
						</tr>
						</c:forEach>
						<c:if test="${fn:length(content)<1}"><tr><td>본문이 없습니다</td></tr></c:if>
					</table>							
				</li>
			</ul>
		</div>
	</div>
	<input type="button" value="목록으로" onclick="location.href='list.html'" style="margin-top: 30px;" >
	<input type="button" value="수정하기" onclick="location.href='rcpUpdate.html?no=${recipe.no}'" style="margin-top: 30px;" >
</body>
</html>