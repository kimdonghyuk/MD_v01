<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h3> This Page is View </h3> <button type="button"><a href="read"> Back List </a></button> </h2>
&nbsp; &nbsp;<h1> 제목 </h1>
${view.title}
<br>
<h1> 글 내용 </h1>
${view.cont}
<p></p>
<p></p>

<button type="button"><a href="update?bno=${view.bno}">Update </a></button>

<button type="button"><a href="delete?bno=${view.bno}">Delete </a></button>


<br>

</body>
</html>