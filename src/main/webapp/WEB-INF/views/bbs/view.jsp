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

	<h3>This Page is View</h3>
	
<!-- read�������� ���ư�.................................................................................-->	
	<button type="button">
		<a href="read"> Back List </a>
	</button>
	&nbsp; &nbsp;<h1>����</h1>	${view.title}
	<br>
	<h1>�� ����</h1>${view.cont}<p></p>

<!-- update, delete ��ư ���� ......................................................................... -->
	<button type="button">
		<a href="update?bno=${view.bno}">Update </a>
	</button>
	<button type="button">
		<a href="delete?bno=${view.bno}">Delete </a>
	</button>

<!-- ��� ��� �κ� ..................................................................................... -->
	<h1>[��� ��϶�]</h1>
		<div> �Խ��� : <input type="text" class="rUser"></div>
		<div> ��۳��� : <input type = "text" class="rCont">
		<input type="button" value="���" class="rCreate" onclick="createReply();">
		</div>
	
<!-- ��� �ѷ��ִ� �κ�................................................................................... -->	
	<h2>��� �Խñ�</h2>
	<div>
		<div class="bbs">
	</div>

<!------------------------------------------------------------------------------------------------------->	
<!-- ��ũ��Ʈ ���� .......................................................................................-->		
	<script>

/* ��� ����Ʈ�� ������ִ� �κ�...............................................................................*/	
   	$(document).ready(list());
  	
	
/* ��� ����Ʈ�� �������ִ� �κ�...............................................................................*/	
function list(){
	var url = "reply/view?bno=" + ${view.bno};	// url�� ȣ���� �� ������ bno ���� ������.
	var target = $(".bbs");
	var content = "";
	$.getJSON(url, function (data) {			// �ش� url�� ������ִ� Jsondata�� parameter������ ����.
		var items = [];							// items��� �̸��� ��迭 ����
		$.each(data, function (key, val) {	// for each���� ������ key���� ��� val���� item �迭�� �־���.
			console.log(key, val);
		content += "<ul><li>"+"[�۾��� : " + val.userid + " ]" +"[���� : "+ val.cont + "]" 
		+ "<input type='button'" + "value='����'" + "class='rDelete'" + " onclick='deleteReply(" + val.rno + ");'>" 
		+ "<input type='button'" + "value='����'" + "class='rInsert'" + " onclick='insertReply(" + val.rno + ");'>"
		+ "</li></ul>";
		});
		target.html(content);
		});
	};
   	
/* ��� Create�� ���ִ� �κ� ................................................................................*/   	
   	function createReply(){
   		if($(".rCont").val()==""){
   			alert("������ �Է����ּ���");
   			$(".rCont").focus();return;
   			}
   		// ��ư �ߺ� Ŭ�� ����
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
 
/* ��� �������ִ� �κ�.....................................................................................*/
	function deleteReply(num){
		$.post(url='reply/delete',
				{rno:num},
				function(data){
					list();
				});
	}

/* ��� �������ִ� �κ�.....................................................................................*/
/* 	function insertReply(num){
		alert(num);
	} */
	
   	
</script>
</div>
<br>

</body>
</html>