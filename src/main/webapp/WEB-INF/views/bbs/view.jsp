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
      var url = "reply/view?bno=" + ${view.bno};
      var target = $(".bbs");
         $.getJSON(url, function (data) {
            var items = [];
                $.each(data, function (key, val) {
                    console.log(key, val);
                    items.push("<ul><li>"+val.cont+"</li></ul>")
                    /* items.push("<ul id='" + key + "'>"
                          +("<li class=\"bno\">"+val.bno+"</li>")
                          +("<li class=\"readtitle\"><a href='read?bno="+val.bno+"'>"+val.title+"</a></li>")
                          +("<li class=\"writer\">"+val.userid+"</li>")
                          +("<li class=\"writedate\">"+val.regdate+"</li>")
                          +("<li class=\"viewcount\">"+val.vcount+"</li>")+"</ul>")   */
                });
                $("<div/>", {
                    html: items.join("")
                }).appendTo(target);
            });
   });
</script>

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

<div class = "bbs">
</div>
<br>

</body>
</html>