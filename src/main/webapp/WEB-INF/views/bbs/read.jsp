<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding ="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h1>This page is board  	
		<button type="button">
			<a href="create"> 글쓰기 </a>
		</button>
	</h1>



	<c:forEach items="${read}" var="read">
		<li>[글번호 : ${read.bno}] <a href="view?bno=${read.bno}"> [글제목 : ${read.title}]</a> 
		[게시자 : ${read.userid}]</li>
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


	<form method='get' accept-charset="utf-8" name='bbsForm'>
		<input type='hidden' name='bno'>
		<input type='hidden' name='page' value='${pageMaker.page}'>
		<input type='text' id='searchText' name='keyword' value='${pageMaker.keyword }'>
		<input type='checkbox' name='types' value="t" ${pageMaker.checked("t") }>제목
		<input type='checkbox' name='types' value="w" ${pageMaker.checked("w") }>글쓴이
		<input type='checkbox' name='types' value="c" ${pageMaker.checked("c") }>내용
		<button onclick="javascript:_goSearch(1);">Search</button>
	</form>

	<br>
	<br>
	<br>

	<script>
		function _goPage(num) {
			document.bbsForm.page.value = num;
			document.bbsForm.submit();
			}
		
		function _goSearch(num){
			var sText = document.getElementById('searchText').value;
			if(sText == ""){
				alert("검색어를 입력하세요.");
				return ;
			}
			document.bbsForm.page.value = num;
			document.bbsForm.submit();
		}
	</script>

</body>
</html>