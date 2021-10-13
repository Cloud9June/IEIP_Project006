<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript">
	function chkVal() {
		
		var sech = document.sData;
		
		if(!sech.resvno.value) {
			alert("주민번호가 입력되지 않았습니다!");
			sech.resvno.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<jsp:include page="../include/nav.jsp"></jsp:include>
	
	<section id="section">
		<h2>백신예약조회</h2>
		
		<form action="resv_search_input.jsp" name="sData" method="post" onsubmit="return chkVal()">
			<table class="inputTable" width="30%">
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tr>
					<th>예약번호</th>
					<td>
						<input type="text" name="resvno" size="20">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="조회하기">
					</td>
				</tr>
			</table>
		</form>
	</section>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>