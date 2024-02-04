<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="BLOOD_DONATION_PROJECT.Jdbc"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%
	String rname = request.getParameter("rn-name");
	String rage = request.getParameter("rn-age");
	String rgender = request.getParameter("rn-gender");
	String rphone = request.getParameter("rn-phone");
	String rgroup = request.getParameter("rn-group");
	String raddress = request.getParameter("rn-address");
	String rcity = request.getParameter("rn-city");
	String rdistrict = request.getParameter("rn-district");
	String rpincode = request.getParameter("rn-pincode");
	String bgroup = request.getParameter("bloodgroup");
	Jdbc db = new Jdbc();
	Connection con = db.dbconnect();
	%>
	<%
	if (request.getParameter("save") != null) {
		out.print(con);
		if ((rphone.length() > 0) && (rgroup.length() > 0)) {

			String sql = "insert into new_donar values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, rname);
			ps.setString(2, rage);
			ps.setString(3, rgender);
			ps.setString(4, rphone);
			ps.setString(5, rgroup);
			ps.setString(6, rcity);
			ps.setString(7, rdistrict);
			ps.setString(8, rpincode);
			System.out.println(sql);
			int n = ps.executeUpdate();
			ps.close();
			JOptionPane.showMessageDialog(null, "Successfully registered");
	%>
	<jsp:forward page="BloodDonationProject.html" />
	<%
	} else {
	JOptionPane.showMessageDialog(null, "Invalid");
	%>
	<jsp:forward page="BloodDonationProject.html" />
	<%
	}
	}
	if (request.getParameter("select") != null) {
	Statement st = con.createStatement();
	String sql = "select *from new_donar";
	System.out.println(sql);
	ResultSet rs = st.executeQuery(sql);
	%>
	<jsp:include page="DonarList.html" />
	<table id="styled-table">
		<thead>
			<tr>
				<th>FULLNAME</th>
				<th>AGE</th>
				<th>GENDER</th>
				<th>PHONE NUMBER</th>
				<th>BLOODGROUP</th>
				<th>CITY</th>
				<th>DISTRICT</th>
				<th>PINCODE</th>
			</tr>
		</thead>
		<%
		while (rs.next()) {
		%>
		<tbody>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(8)%></td>
			</tr>
		</tbody>
		<%
		}
		%>
	</table>
	<%
	rs.close();
	st.close();
	}

	if (request.getParameter("bloodgroup") != null) {
	String sql = "select *from new_donar where bloodgroup=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, bgroup);
	System.out.println(sql);
	ResultSet rs = ps.executeQuery();
	%>
	<jsp:include page="SearchList.html" />
	<table id="searchlist" align="center" border="1">
		<thead>
			<tr>
				<th>FULLNAME</th>
				<th>AGE</th>
				<th>GENDER</th>
				<th>PHONE NUMBER</th>
				<th>BLOODGROUP</th>
				<th>CITY</th>
				<th>DISTRICT</th>
				<th>PINCODE</th>
			</tr>
		</thead>
		<%
		while (rs.next()) {
		%>
		<tdata>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
		</tr>
		</tdata>
		<%
		}
		%>
	</table>
	<%
	rs.close();
	ps.close();
	}
	con.close();
	%>
</body>
</html>