<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.sungil.database.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	PrintWriter writer = response.getWriter();
	
	String sql = "select resvno from tbl_vaccresv_202108";
	
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	int num = Integer.parseInt(request.getParameter("resvno"));
	int result = 0;
	while(rs.next()) {
		if(num==rs.getInt(1)) {
			result = 1;
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	if(result==1) {
%>
	<jsp:forward page="resv_search_exist.jsp"></jsp:forward>
<%
	} else {
%>
	<jsp:forward page="resv_search_empty.jsp"></jsp:forward>
<%
	}
%>
</body>
</html>