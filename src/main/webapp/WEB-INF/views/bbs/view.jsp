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
		   var url = "reply/view?bno=" + ${view.bno};	// url�� ȣ���� �� ������ bno ���� ������.
	       var target = $(".bbs");						// target���� bbs�� id�� div�� ����Ű�� ����.
	       $.getJSON(url, function (data) {			// �ش� url�� ������ִ� Jsondata�� parameter������ ����.
	    	   var items = [];							// items��� �̸��� ��迭 ����
	    	   $.each(data, function (key, val) {	// for each���� ������ key���� ��� val���� item �迭�� �־���.
	                    console.log(key, val);
	                    items.push("<ul><li>"+val.cont+"</li></ul>")
	                });
	                $("<div/>", {						// innerhtml�� ����ؼ� itmes �迭�� ������ �ٿ��ش�.
	                    html: items.join("")		
	                }).appendTo(target);				// targert�̸��� ����� div class�̸��� �ش� ������� ������.
	            });
	       });
</script>

	<h3>This Page is View</h3>
	<button type="button">
		<a href="read"> Back List </a>
	</button>
	</h2>
	&nbsp; &nbsp;
	<h1>����</h1>
	${view.title}
	<br>
	<h1>�� ����</h1>
	${view.cont}
	<p></p>
	<p></p>

	<button type="button">
		<a href="update?bno=${view.bno}">Update </a>
	</button>
	<button type="button">
		<a href="delete?bno=${view.bno}">Delete </a>
	</button>


	<h2>��۶�</h2>
	<div class="bbs">
</div>
<br>




</body>
</html>