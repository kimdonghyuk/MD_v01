<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<!--ThumbNail Of File..................................................................................-->
<style>
	.thumb {
		list-style: none;
		float: left;
		width: 100px;
		height: 100px;
	}
</style>

</head>
<body>

<h2> This page is Create Page. </h2>

<!--Table Context reg..................................................................................-->
<form action="createdata" accept-charset="utf-8" method="post">
	<h1> 게시글을 등록해주세요</h1>
	<br>
	<p> 글 제목 <input type="text" name="title"></p>
	<p> 글쓴이 <input type="text" name="userid"></p>
	<p> 글 내용 <textarea name="cont" row="3" cols="50"></textarea></p>
	<ul class="uploadUL"> 
		<!-- file upload  -->
	</ul>
	<input type="submit" value="글등록">
</form>

<!--Upload File Reg....................................................................................-->
<p><p>
<form target="zero" action="/hanBbs/file/upload" method="post" enctype="multipart/form-data" >
	<input type='file' name='file'><input type='submit' value="UPLOAD">
</form>

<iframe name="zero" width="0" height="0" >
</iframe>

<!--Java Script .......................................................................................-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.js"></script>
<script>

/*file Upload...........................................................................................*/
 	function updateResult(data){
	console.log(data);
		$(".uploadUL").append("<input type='hidden' name='contfile' value='"+data.fileName+"'></p>");
		
		if(data.suffix == '.jpg'){
			$(".uploadUL").append("<p><a href='/hanBbs/file/down?src="+data.fileName+"'><image class='thumb' src='/hanBbs/file/view/"+data.fileName+"'/></p>");
			/* $(".uploadUL").append("<li><image class='thumb' data-src='"+data.fileName+"' src='/web/file/view/"+ data.fileName+"'/></a></li>"); */
		}else{
			$(".uploadUL").append("<p><a href='/hanBbs/file/down?src="+data.fileName+"'><image class='thumb' data-src='"+data.fileName+"' src='/resources/images/iconsets9.jpg'/></a></p>");
		}
}

</script>


</body>
</html>