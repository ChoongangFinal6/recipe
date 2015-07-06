<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Create the toolbar container -->
<div id="toolbar">
  <button class="ql-bold">Bold</button>
  <button class="ql-italic">Italic</button>
</div>

<!-- Create the editor container -->
<div id="editor">
  <div>Hello World!</div>
  <div>Some initial <b>bold</b> text</div>
  <div><br></div>
</div>

<!-- Include the Quill library -->
<script src="//cdn.quilljs.com/0.19.14/quill.js"></script>

<!-- Initialize Quill editor -->
<script>
  var quill = new Quill('#editor');
  quill.addModule('toolbar', { container: '#toolbar' });
</script>
</body>
</html>