<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h2> This page is Create Page. </h2>

<form action="createdata" accept-charset="utf-8" method="post">
	<h1> 게시글을 등록해주세요</h1>
	<br>
	<p> 글 제목 <input type="text" name="title"></p>
	<p> 글쓴이 <input type="text" name="userid"></p>
	<p> 글 내용 <textarea name="cont" row="3" cols="50"></textarea></p>
	
	<input type="submit">
</form>


</body>
</html>