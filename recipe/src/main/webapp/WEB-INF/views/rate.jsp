<%@ include file="aa.jsp"%>
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="rate">
<form action="rate.html" method="post">
<span class="score">평점 : ${score}</span> <span class="count">(${count}명 참여)</span> 
<span>
<select name="rate">
<c:forEach begin="0" end="9" var="j">
<option value="${j+1}">
<c:forEach begin="0" end="${9-j }" var="i">
♩
</c:forEach>
${10-j}
</option>
</c:forEach>
</select>
</span>
<span>
<input type="submit" value="평가">
<input type="hidden" name="postNo" value="${postNo}"> 
</span>
</form>
</div>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="rate">
a
</div>
>>>>>>> fb3b592fd5cf0b8bf1811de284de9cda8d7fdaab
