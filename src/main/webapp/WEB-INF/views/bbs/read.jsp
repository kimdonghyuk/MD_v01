<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h1>This page is board</h1>

	<button type="button">
		<a href="create"> 글쓰기 </a>
	</button>

	<c:forEach items="${read}" var="read">
		<li>[글번호 : ${read.bno}] <a href="view?bno=${read.bno}"> [글제목 : ${read.title}]</a> 
		[조회수 : ${read.vcount}]</li>
	</c:forEach>


	<c:if test="${pageMaker.first - 1 > 0}">
		<a href="javascript:_goPage(${pageMaker.first}-10)">[이전 페이지]</a>
	</c:if>

	<c:forEach begin="${pageMaker.first}" end="${pageMaker.last}" var="idx">
 		<c:if test="${idx-1 < pageMaker.cnt}"> 
			<a href="javascript:_goPage(${idx})">[${idx}]</a>
		</c:if> 
	</c:forEach>
	
	<c:if test="${pageMaker.cnt > pageMaker.last}">
		<a href="javascript:_goPage(${pageMaker.last}+1)">[다음페이지]</a>
	</c:if>


	<br> ${pageMaker}

	<form method='get' accept-charset="utf-8" name='bbsForm'>
		<input type='hidden' name='bno'>
		<input type='hidden' name='page' value='${pageMaker.page}'>
		<input type='text' name='keyword' value='${pageMaker.keyword }'>
		<input type='checkbox' name='types' value="t" ${pageMaker.checked("t") }>제목
		<input type='checkbox' name='types' value="w" ${pageMaker.checked("w") }>글쓴이
		<input type='checkbox' name='types' value="c" ${pageMaker.checked("c") }>내용
		<button onclick="javascript:_goPage(1);">Search</button>
	</form>		

	<br>
	<br>
	<br>


	<script>
		function _goPage(num) {
			document.bbsForm.page.value = num;
			document.bbsForm.submit();
		}
	</script>

</body>
</html>