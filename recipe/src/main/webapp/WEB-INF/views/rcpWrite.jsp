<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="aa.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>레시피 작성</title>
<script src="http://www.alohaeditor.org/download/aloha.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/aloha.js"/>"></script>
</head>
<body>
	<form action="rcpWrite.html" id="frm" method="post">
		<div align="center" style="margin-top: 40px;">
			<div style="width: 940px;">
				<div style="width: 940px;" align="left">
					<h1 style="margin-left: 10px;">레시피 작성</h1>
				</div>

				<div style="border: 2px solid black; margin-top: -15px; width: 940px;"></div>

				<div style="border: 1px solid black; margin-top: 15px; padding: 20px; height: 60px;">
					<span style="font-size: 17px; margin-right: 20px; float: left;">요리명</span> <input type="text" id="title"
						style="width: 50%; height: 25px; float: left;" name="name" value="${recipe.name}">

					<div style="float: right; width: 350px; margin-bottom: 10px;" align="right">
						<input type="checkbox" name="oven" value="Y"> 오븐
					</div>

					<div style="float: left; margin-top: 10px;">
						<select name="country" id="country">
							<option value="korea">한식</option>
							<option value="china">중식</option>
							<option value="japan">일식</option>
							<option value="europe">양식</option>
						</select> <select name="amount" id="amount">
							<option value="1">1인</option>
							<option value="2">2인</option>
							<option value="3">3인</option>
							<option value="4">4인</option>
						</select> <select name="difficulty" id="difficulty">
							<option value="3">상</option>
							<option value="2">중</option>
							<option value="1">하</option>
						</select>
					</div>

					<div style="float: right; margin-top: 10px;">
						걸리는 시간 <select name="time-d" id="time-d">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select> 일 <select name="time-h" id="time-h">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select> 시간 <select name="time-m" id="time-m">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select> 분
					</div>
				</div>

				<div style="width: 940px;" align="left">
					<h3 style="margin-left: 10px;">재료</h3>
					<div style="border: 2px solid black; margin-top: -10px;"></div>
					<p>
				</div>
				<div style="border: 1px solid black; padding: 10px;">
					<div class="ui-widget">
						<label for="material">재료 검색</label> <input id="material" size="50" name="material">
					</div>
					<p>
					<div>
						<ul id="ul-material">

						</ul>
					</div>
				</div>
				<div style="width: 940px;" align="left">
					<h3 style="margin-left: 10px;">내용</h3>
				</div>
				<div style="border: 2px solid black; margin-top: -10px;"></div>
				<p>
				<div style="border: 2px solid black; overflow: auto; padding: 10px; vertical-align: middle;"
					align="center" id="div-content">

					<ul style="list-style: none;" id="wcontent">
						<li>
							<table class="content-table">
								<tr>
									<td><div id="image" class="content-table-div-left"></div></td>
									<td style="padding-left: 10px;">
										<span class="action-bold">B</span>
										<span class="action-italic">I</span>
										<span class="action-underline">U</span>
										<span class="action-unformat">✘</span>
										<div class="content-table-div-right content" id="content"></div>
										<div class="content-table-div-right content" id="content"></div>
									</td>
								</tr>
								<tr>
									<td style="padding-top: 10px;"><input type="button" value="사진 등록" id="upload" class="upload-btn"></td>
									<td align="right" style="padding-top: 10px;"><input type="button" style="margin-right: 10px;"
										class="addlist" value="추가"> <input type="button" class="removelist" value="삭제"></td>
								</tr>
							</table>
						</li>
					</ul>
				</div>
			</div>
			<input type="button" id="send" value="확인" style="margin-top: 30px;">
		</div>
		<div id="sendText"></div>
		<div id="sendLi"></div>
		<div id="imageLi"></div>
	</form>
</body>
</html>