<%@ include file="../aa.jsp" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"	pageEncoding="UTF-8"%>
<head>
<title>FullFilePath</title>
</head>
<body>
	<script type="text/javascript">	
	window.opener.cntplus('${path}', '${name}');
	window.close();				
	</script>
</body>
</html>