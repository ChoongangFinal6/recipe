<%@ include file="../aa.jsp" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"	pageEncoding="UTF-8"%>
<head>
<title>FullFilePath</title>
</head>
<body>
	<script type="text/javascript">	
			window.opener.document.getElementById("image").innerHTML = "<img src=${path}/${name} alt='업로드 이미지' width='200px'>";
			self.close();		
	</script>
</body>
</html>