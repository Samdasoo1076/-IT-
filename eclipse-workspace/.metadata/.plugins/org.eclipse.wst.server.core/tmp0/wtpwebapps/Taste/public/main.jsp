<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>키워드로 장소검색하기</title>
    <link rel="stylesheet" href="kakao_api.css">
    <style>
    .Login {
    position: absolute;
    right: 50px;
    top:20px;
    display: flex;
    }
    
    .Logout {
    position: absolute;
    top: 30px;
   	z-index: 1;
    }
    
    </style>
</head>
<body>
	<div class="Login">
	<%
		// 세션에서 회원 이름을 가져옴
		String re = (String) session.getAttribute("member");
		
		// 만약 회원 이름이 없다면 로그인 페이지로 리다이렉트
		if(re == null) {
			%>
			<div class="login-signup">
            <a href="login.jsp">로그인</a> 
            <a href="join01.jsp">회원가입</a>
        </div>	
			
	<% } else { 
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
	%>
	<form action="../LogOut.jsp" method="post">
	<h2><%= name %> 회원님 환영합니다.</h2>
	<input type="submit" value="로그아웃" class="Logout">
	</form>
      <%} %>
	</div>

    <div class="map_wrap">
        <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
        <div class="addition">
            <button class="map_level" onclick="zoomIn()"> <!--돋보기(맵 레벨 +1)-->
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-zoom-in" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11M13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0"/>
                    <path d="M10.344 11.742q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1 6.5 6.5 0 0 1-1.398 1.4z"/>
                    <path fill-rule="evenodd" d="M6.5 3a.5.5 0 0 1 .5.5V6h2.5a.5.5 0 0 1 0 1H7v2.5a.5.5 0 0 1-1 0V7H3.5a.5.5 0 0 1 0-1H6V3.5a.5.5 0 0 1 .5-.5"/>
                  </svg>
                </button>
            <button class="map_level" onclick="zoomOut()"> <!--돋보기(맵 레벨 -1)-->
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-zoom-out" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11M13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0"/>
                <path d="M10.344 11.742q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1 6.5 6.5 0 0 1-1.398 1.4z"/>
                <path fill-rule="evenodd" d="M3 6.5a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5"/>
              </svg>
            </button>
        </div>
        <div id="menu_wrap" class="bg_white">
            <div class="option">
                <div>
                    <form onsubmit="searchPlaces(); return false;">
                        키워드 : <input type="text" value="가락동 맛집" id="keyword" size="15"> 
                        <button type="submit" class="kakao_search">검색하기</button> 
                    </form>
                </div>
            </div>
            <hr>
            <ul id="placesList"></ul>
            <div id="pagination"></div>
        </div>
    </div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5691f2dfa678062007c018fe0db503f&libraries=services"></script>
<script src="JS/kakao_api.js"></script>
</body>
</html>