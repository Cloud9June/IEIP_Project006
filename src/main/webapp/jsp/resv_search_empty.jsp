<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css?ver=1">
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<jsp:include page="../include/nav.jsp"></jsp:include>
	<section id="section">
		<h2>예약번호 <%= request.getParameter("resvno") %>로 조회된 결과가 없습니다.</h2>
		
		<p class="center">
			<input type="button" value="홈으로" onclick="location.href='index.jsp'">
		</p>
	</section>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>