<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/login.css">
    <style>
    </style>
</head>
<body>

  <div class="main">
		<form action="loginok.jsp" method="post">
			아이디 <input type="text" placeholder="id" name="id">
			비밀번호 <input type="password" placeholder="pw" name="pw">
			<input type="submit" value="로그인">
		</form>  	
  </div>
</html>