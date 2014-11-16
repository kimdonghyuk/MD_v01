<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
.thumb {
	float: left;
	width: 100px;
	height: 100px;
}
</style>
</head>
<body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

	<h3>This Page is View</h3>
	
<!-- read페이지로 돌아감................................................................................. -->	
	<button type="button">
		<a href="read"> Back List </a>
	</button>
	&nbsp; &nbsp;<h1>제목</h1>	${view.title}
	<br>
	<h1>글 내용</h1>${view.cont}<p></p>

<!-- update, delete 버튼 셋팅 .......................................................................... -->
	<button type="button">
		<a href="update?bno=${view.bno}">Update </a>
	</button>
	<button type="button">
		<a href="delete?bno=${view.bno}">Delete </a>
	</button>
	
<!-- 파일 업로드부분 .................................................................................... -->	
	<p> <p>
	<div>
	<ul id="downloadUL">
		<!-- file download -->
	</ul>		
	<a href="javascript:uploadlist('${view.contfile }')">첨부파일 미리보기</a>	
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

<!-- 댓글 등록 부분 ..................................................................................... -->
	<h1>[댓글 등록란]</h1>
		<div> 게시자 : <input type="text" class="rUser"></div>
		<div> 댓글내용 : <input type = "text" class="rCont">
		<input type="button" value="등록" class="rCreate" onclick="createReply();">
		</div>
<!-- 댓글 뿌려주는 부분................................................................................... -->	
	<h2>댓글 게시글</h2>
	<div>
		<div class="bbs">
	</div>
	
<!------------------------------------------------------------------------------------------------------->	
<!-- 스크립트 구문 .......................................................................................-->		
	<script>

/* 댓글 리스트를 만들어주는 부분...............................................................................*/	
   	$(document).ready(list());
  	
	
/* 댓글 리스트를 갱신해주는 부분...............................................................................*/	
function list(){
	console.log("-----------list------------------")
	var url = "reply/view?bno=" + ${view.bno};	// url을 호출한 뒤 선택한 bno 값을 더해줌.
	var target = $(".bbs");
	var content = "";
	$.getJSON(url, function (data) {			// 해당 url에 담겨져있는 Jsondata를 parameter값으로 받음.
		var items = [];							// items라는 이름의 빈배열 생성
		$.each(data, function (key, val) {	// for each문을 돌려서 key값을 잡고 val값을 item 배열에 넣어줌.
			console.log(key, val);
		content += "<ul id = " + "'reply_" + val.rno + "'><li>" + "[글쓴이 : " + val.userid + " ]" +"[내용 : "+ val.cont + "]" 
		+ "&nbsp;" + "<input type='button'" + "value='수정'" + "class='rInsert'" + " onclick='updateReply(" + val.rno + ',' + '"' + val.userid + '"' + ',' + '"' + val.cont + '")'+";'>"    
		+ "&nbsp;" + "<input type='button'" + "value='삭제'" + "class='rDelete'" + " onclick='deleteReply(" + val.rno + ");'>" 
		+ "</li></ul>";
		});
		target.html(content);
		});
	};
   	
/* 댓글 Create를 해주는 부분 ................................................................................*/   	
   	function createReply(){
   		if($(".rCont").val()==""){
   			alert("내용을 입력해주세요");
   			$(".rCont").focus();return;
   			}
   		// 버튼 중복 클릭 방지
   		$(".rCreate").attr('disabled','disabled');
   		$.post(url='reply/create',
   				{cont:$(".rCont").val(),
   				userid:$(".rUser").val(),
   				bno:${view.bno}},
   				function(data){
   					$(".rCont").val('');
   					$(".rUser").val('');
   					$(".rCreate").attr("disabled",false);
					list();
		});		
	}
 
/* 댓글 삭제해주는 부분.....................................................................................*/
	function deleteReply(num){
		$.post(url='reply/delete',
				{rno:num},
				function(data){
					list();
				});
	}

/* 댓글 수정해주는 부분.....................................................................................*/
 	function updateReply(num,id,cont){
		console.log(num, cont)
  		var target = document.getElementById('reply_' + num);
		var content = "";
		content +=  "<textarea" + " rows='1'" + "id = 'replyText_" + num + "'" + " cols='100'" + ">" + cont + "</textarea>"
		+ "&nbsp;" + "<input type='button'" + "value='수정'" + "id='replyBtn'"
		+ " onclick='replyUpList(" + num + ");'>"
		target.innerHTML = content;
	}
	
/* 댓글 수정값 받는 부분 .................................................................................. */	
	function replyUpList(num){
		var rNum = num
		var rCont = document.getElementById('replyText_' + num).value;
		console.log(rNum,rCont);
		$.post(url='reply/upReply',
				{cont:rCont, 
				 rno:rNum},
				function(data){
					list();
				});
	}
	
/* 첨부파일 보기..........................................................................................*/	
	
   function uploadlist(file){   
	   console.log(file)
	   if(file.length ==0){
		   alert("첨부파일 없음");   
	   }else{
	   /* 첨부파일보기 다시 눌렀을 때 중복으로 보여짐 막음 */
		   var element = document.getElementById("downloadUL");
		   while (element.firstChild) {
		     element.removeChild(element.firstChild);
		   }		   
      var name = file.split(",");
      for(var i=0 ; len=i<name.length,len; i++ )
    	  /* -1은 존재하지 않는다면을 뜻함 */
         if (name[i].indexOf('.jpg')!= -1){
         $("#downloadUL").append("<p><a href='/hanBbs/file/down?src="+name[i]+"'><image class='thumb' data-src='"+name[i]+"' src='/hanBbs/file/view/"+name[i]+"'/></a></p>");
         }else{
         $("#downloadUL").append("<p><a href='/hanBbs/file/down?src="+name[i]+"'><image class='thumb' data-src='"+name[i]+"' src='/resources/images/iconsets9.jpg'/></a></p>");
         }
   	  }
   }

/*.....................................................................................................*/
/*.......End Script....................................................................................*/   	
</script>
</div>
<br>

</body>
</html>