<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.sungil.database.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql = "select max(resvno)+1 from tbl_vaccresv_202108";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
	String num = rs.getString(1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript">
	function chkVal() {
		
		var resv = document.rData;
		var hospcode = document.getElementsByName("hospcode");
		
		if(!resv.jumin.value) {
			alert("주민번호가 입력되지 않았습니다!");
			resv.jumin.focus();
			return false;
		}
		if(resv.vcode.value=="none") {
			alert("백신코드가 선택되지 않았습니다!");
			resv.vcode.focus();
			return false;
		}
		if(hospcode[0].checked!=true && hospcode[1].checked!=true && hospcode[2].checked!=true && hospcode[3].checked!=true) {
			alert("검사상태가 선택되지 않았습니다!");
			return false;
		}
		if(!resv.resvdate.value) {
			alert("예약날짜가 입력되지 않았습니다!");
			resv.resvdate.focus();
			return false;
		}
		if(!resv.resvtime.value) {
			alert("예약시간이 입력되지 않았습니다!");
			resv.resvtime.focus();
			return false;
		}
	}
	
	function re() {
		alert("정보를 지우고 처음부터 다시 입력 합니다!");
		document.rData.reset();
		document.rData.jumin.focus();
	}
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<jsp:include page="../include/nav.jsp"></jsp:include>
	
	<section id="section">
		<h2>백신 예약</h2>
		
		<form action="resv_vacc_inp.jsp" name="rData" method="post" onsubmit="return chkVal()">
			<table class="inputTable">
				<tr>
					<th>예약번호</th>
					<td>
						<input type="text" name="resvno" value="<%= num %>" size="20" readonly>
					</td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td>
						<input type="text" name="jumin" size="20">
						<span>예)790101-1111111</span>
					</td>
				</tr>
				<tr>
					<th>백신코드</th>
					<td>
						<select name="vcode">
							<option value="none">백신코드</option>
 							<option value="V001">A백신</option>
							<option value="V002">B백신</option>
							<option value="V003">C백신</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>병원코드</th>
					<td>
						<input type="radio" name="hospcode" value="H001">가_병원
						<input type="radio" name="hospcode" value="H002">나_병원
						<input type="radio" name="hospcode" value="H003">다_병원
						<input type="radio" name="hospcode" value="H004">라_병원
					</td>
				</tr>
				<tr>
					<th>예약날짜</th>
					<td>
						<input type="text" name="resvdate" size="20">
						<span>예)20210101</span>
					</td>
				</tr>
				<tr>
					<th>예약시간</th>
					<td>
						<input type="text" name="resvtime" size="20">
						<span>예)0930, 1130</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록">
						<input type="button" value="취소" onclick="re()">
					</td>
				</tr>
			</table>
		</form>
	</section>

	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>