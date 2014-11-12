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
		<a href="create"> �۾��� </a>
	</button>

	<c:forEach items="${read}" var="read">
		<li>[�۹�ȣ : ${read.bno}] <a href="view?bno=${read.bno}"> [������ : ${read.title}]</a> 
		[��ȸ�� : ${read.vcount}]</li>
	</c:forEach>


	<c:if test="${pageMaker.first - 1 > 0}">
		<a href="javascript:_goPage(${pageMaker.first}-10)">[���� ������]</a>
	</c:if>

	<c:forEach begin="${pageMaker.first}" end="${pageMaker.last}" var="idx">
 		<c:if test="${idx-1 < pageMaker.cnt}"> 
			<a href="javascript:_goPage(${idx})">[${idx}]</a>
		</c:if> 
	</c:forEach>
	
	<c:if test="${pageMaker.cnt > pageMaker.last}">
		<a href="javascript:_goPage(${pageMaker.last}+1)">[����������]</a>
	</c:if>


	<br> ${pageMaker}

	<form method='get' accept-charset="utf-8" name='bbsForm'>
		<input type='hidden' name='bno'>
		<input type='hidden' name='page' value='${pageMaker.page}'>
		<input type='text' name='keyword' value='${pageMaker.keyword }'>
		<input type='checkbox' name='types' value="t" ${pageMaker.checked("t") }>����
		<input type='checkbox' name='types' value="w" ${pageMaker.checked("w") }>�۾���
		<input type='checkbox' name='types' value="c" ${pageMaker.checked("c") }>����
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