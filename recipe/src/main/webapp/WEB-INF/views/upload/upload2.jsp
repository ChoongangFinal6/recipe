<%@ include file="../aa.jsp" %>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy, java.util.*,java.io.*"%>

<% 
	// 파일명이 한글일 경우를 위한 인코딩
	request.setCharacterEncoding("UTF-8");

	String realPath = "";
	String realFileName = "";
	String encType = "UTF-8";
	String filePath = "";
	int maxFileSize = 1024 * 1024 * 10;	

	try {
		// 웹 루트 구하기 
		ServletContext scontext = getServletContext();		
		realPath = scontext.getRealPath("/");
		filePath = realPath + "image" + File.separator;		
		
		File file = new File(filePath);
		if (!file.exists()) {
			file.mkdirs();
		}

		//MultipartRequest 클래스의 객체를 생성할 때 request객체와 웹서버의 루트 경로, 최대파일크기, 인코딩타입, 파일이름정책 등을 전달한다.
		MultipartRequest multi = new MultipartRequest(request,
				filePath, maxFileSize, encType,
				new DefaultFileRenamePolicy());

		// 업로드할 파일 목록을 얻어온다. 클라이언트 쪽에서 보낸 이미지 파일은 여러 개 일 수 있다.
		Enumeration<?> uploadFiles = multi.getFileNames();		

		// 클라이언트 쪽에서 보낸 파일명을 얻어온다.
		String uploadFile = (String) uploadFiles.nextElement();		

		// 파일명 정책이 적용된 최종 파일명을 얻어온다.
		realFileName = multi.getFilesystemName(uploadFile);
	} catch (Exception e) {
		e.printStackTrace();
		//out.println(e);
	}

	String fullPath = realPath + "image\\" + realFileName;
	//out.println("fullPath : " + fullPath);	
%>

<!-- 클라이언트 쪽으로 응답되는 내용 -->
<head>
<title>FullFilePath</title>
<script type="text/javascript">	
	function submit() {	 
		window.opener.document.getElementById("image").insertAdjacentHTML('afterbegin',"<img src='./image/<%=realFileName%>' alt='업로드 이미지' id='resizable${cnt}' width='300px'>");
		opener.cntplus();		
	    self.close();		
	}
</script>
</head>
<body onload="submit()">		
<form id="frm">
<input type="hidden" name="realpath" id="realpath" value="./upload/<%=realFileName%>">
</form>
</body>
</html>