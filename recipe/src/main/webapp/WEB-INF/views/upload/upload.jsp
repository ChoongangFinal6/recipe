<%@ include file="../aa.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<!-- header -->
    <div>
        <h1>사진 첨부하기</h1>
    </div>
    <!-- //header -->
    <!-- container -->
	
    <!-- [D] HTML5인 경우 pop_container 클래스와 하위 HTML 적용
	    	 그밖의 경우 pop_container2 클래스와 하위 HTML 적용      -->
	<div>
    	<!-- content -->
		<form id="frm" action="upload2.html" method="post" enctype="multipart/form-data">
        <div>
			<input type="file" name="upload">
            <p><strong>10MB</strong>이하의 이미지 파일만 등록할 수 있습니다.<br>(JPG, GIF, PNG, BMP)</p>
        </div>    
		 </form>
        <!-- //content -->
    </div>
    <div style="display:none;">
    	<!-- content -->
        <div>	     
			<div style="display:none;"></div>
            <p><em>한 장당 10MB, 1회에 50MB까지, 10개</em>의 이미지 파일을<br>등록할 수 있습니다. (JPG, GIF, PNG, BMP)</p>
        </div>
        <!-- //content -->
    </div>

    <!-- //container -->
    <!-- footer -->
    <div>
	    <div>
         	<input type="submit" id="submit" value="확인">
           <input type="button" id="cancel" value="취소">
        </div>
    </div>
    <!-- //footer -->
   
</div>
</body>
</html>