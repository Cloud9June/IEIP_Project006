<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.sungil.database.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	StringBuffer sb = new StringBuffer();

	sb.append("select h.hospaddr, case h.hospaddr when '10' then '서울' when '20' then '대전' when '30' then '대구' when '40' then '광주' end hospaddra,");
	sb.append(" count(v.hospcode) cnt");
	sb.append(" from tbl_hosp_202108 h, tbl_vaccresv_202108 v");
	sb.append(" where h.hospcode = v.hospcode(+)");
	sb.append(" group by hospaddr order by hospaddr");

	String sql = sb.toString(); 

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	int sum = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<jsp:include page="../include/nav.jsp"></jsp:include>
	<section id="section">
		<h2>백신예약현황</h2>
		
		<table width="40%">
			<colgroup>
				<col width="33.3333%">
				<col width="33.3333%">
				<col width="33.3333%">
			</colgroup>
			<thead>
				<tr>
					<th>병원지역</th>
					<th>병원지역명</th>
					<th>접종예약건수</th>
				</tr>
			</thead>
			<tbody>
				<%
					while(rs.next()) {
						sum = sum + rs.getInt(3);
				%>
				<tr>
					<td><%= rs.getString(1)%></td>
					<td><%= rs.getString(2)%></td>
					<td><%= rs.getString(3)%></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td colspan="2">총합</td>
					<td><%= sum %></td>
				</tr>
			</tbody>
		</table>	
	</section>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>