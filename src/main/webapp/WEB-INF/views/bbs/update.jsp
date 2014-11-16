<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h3>This Page is Update Page</h3>

	<form action="updatedata" accept-charset="utf-8" id="ins" method="post">
		&nbsp; &nbsp;
		<h1>제목</h1>
		<textarea name="title" rows="2" cols="100">${up.title}</textarea>
		<br>
		<h1>글 내용</h1>
		<textarea name="cont" rows="5" cols="100">${up.cont}</textarea>
		<li>첨부파일: ${up.contfile}</li>
		<br> <input type="hidden" name="bno" value="${up.bno}">
			 <input type="submit">
	</form>
</body>
</html>