<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<jsp:include page="../member/member_head.jsp"></jsp:include>

<head>
<meta charset="UTF-8">
<title>학생관리</title>
<link rel="stylesheet" href="${ctx}/resources/css/member.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div id="wrapper">
		<header>
		
		</header>
	</div>

<div id="container">
	<form id="login_box" name="login_box">
		<img src="${img}/login.jpg" alt="" /><br />
		<span id="login_id">ID</span>
		<input type="text" id="input_id" name="input_id" /> <br />
		<span id="login_pass">PASSWORD</span> 
		<input type="text" id="input_pass"name="input_pass"  /> <br /><br />
		<input type="submit" value="LOGIN" onclick="loginAlert()"/>
		<input type="hidden" name="action" value="login" />
		<input type="hidden" name="page" value="main" />
		<input type="reset" value="CANCEL" />
	</form>
</div>
<script>
	function loginAlert(){
	<%-- window가 document의 상위라서  window.document지만, window는 생략가능하다. --%>
	var input_id=document.getElementById('input_id').value;
	var input_pass=document.getElementById('input_pass').value;
	if(input_id===""){
		alert('ID를 입력해 주세요');
		return false;
	}
	if(input_pass===""){
		alert('비밀번호를를 입력해 주세요');
		return false;
	}
	var form=document.getElementById('login_box');
	form.action="${ctx}/common.do";
	form.method="post";
	return true;
	}
</script>
</body>