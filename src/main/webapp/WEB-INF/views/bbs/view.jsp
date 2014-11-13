<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>


	<script>

   $(document).ready(function(){
		   var url = "reply/view?bno=" + ${view.bno};	// url을 호출한 뒤 선택한 bno 값을 더해줌.
	       var target = $(".bbs");						// target값이 bbs가 id인 div를 가리키고 있음.
	       $.getJSON(url, function (data) {			// 해당 url에 담겨져있는 Jsondata를 parameter값으로 받음.
	    	   var items = [];							// items라는 이름의 빈배열 생성
	    	   $.each(data, function (key, val) {	// for each문을 돌려서 key값을 잡고 val값을 item 배열에 넣어줌.
	                    console.log(key, val);
	                    items.push("<ul><li>"+val.cont+"</li></ul>")
	                });
	                $("<div/>", {						// innerhtml을 사용해서 itmes 배열의 내용을 붙여준다.
	                    html: items.join("")		
	                }).appendTo(target);				// targert이름에 저장된 div class이름에 해당 내용들을 보내줌.
	            });
	       });
</script>

	<h3>This Page is View</h3>
	<button type="button">
		<a href="read"> Back List </a>
	</button>
	</h2>
	&nbsp; &nbsp;
	<h1>제목</h1>
	${view.title}
	<br>
	<h1>글 내용</h1>
	${view.cont}
	<p></p>
	<p></p>

	<button type="button">
		<a href="update?bno=${view.bno}">Update </a>
	</button>
	<button type="button">
		<a href="delete?bno=${view.bno}">Delete </a>
	</button>


	<h2>댓글란</h2>
	<div class="bbs">
</div>
<br>




</body>
</html>