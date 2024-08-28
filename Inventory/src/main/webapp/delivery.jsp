<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %> 
<%@ page import="javax.swing.*"%> 
<%
	String btnval=request.getParameter("b1");
	if(btnval.equalsIgnoreCase("save"))
	{
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
			PreparedStatement psmt=conn.prepareStatement("insert into delivery values(?,?)");
			psmt.setString(1,t1);
			psmt.setString(2,t2);
			psmt.executeQuery();
			out.println("<script>alert('your data is succesfully saved...')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of save
	// delete the record
		if(btnval.equalsIgnoreCase("delete"))
		{
			String t1=request.getParameter("t1");
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
				PreparedStatement psmt=conn.prepareStatement("delete from delivery where id=?");
				psmt.setString(1,t1);
				psmt.executeQuery();
				out.println("<script>alert('Your data is Deleted succesfully...')</script>");
			}
			catch(Exception e)
			{
				out.println(e.toString());
			}
		}//End of delete
		if(btnval.equalsIgnoreCase("update"))
		{
			String t1=request.getParameter("t1");
			String t2=request.getParameter("t2");
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
				PreparedStatement psmt=conn.prepareStatement("update delivery set status=? where id=?");
				psmt.setString(1,t2);
				psmt.setString(2,t1);
				psmt.executeQuery();
				out.println("<script>alert('Your data is succesfully Updated...')</script>");
			}
			catch(Exception e)
			{
				out.println(e.toString());
			}
		}//End of update
		//Record of Allsearch
		if(btnval.equalsIgnoreCase("allsearch"))
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn=DriverManager.getConnection("ojdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
				Statement smt=conn.createStatement();
				ResultSet rs=smt.executeQuery("select * from delivery");
				%>
				<table border=2>
				<tr>
					<th>Delivery ID</th>
					<TH>Status</TH> 
				</tr>
				<%
				while(rs.next())
				{
				%>
					<tr>
						<th><%=rs.getString(1)%></th>
						<th><%=rs.getString(2)%></th>
					</tr>
				<%}%>
				<input type=button value="print" onclick="window.print()">
				</table>
			<%}
			catch(Exception e)
			{
				out.println(e.toString());
			}
		}//End of all search
		//Record of special search
				if(btnval.equalsIgnoreCase("search"))
				{
					String s1 = request.getParameter("s1");
					String t1=request.getParameter("t1");
					try
					{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection conn=DriverManager.getConnection("ojdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
						Statement smt=conn.createStatement();
						if(!s1.equals("all")){
							ResultSet rs=smt.executeQuery("select * from delivery where "+s1+" = '"+t1+"' ");
							%>
							<table border=2>
							<tr>
								<th>Delivery ID</th>
								<TH>Status</TH> 
							</tr>
							<%
							while(rs.next())
							{
							%>
								<tr>
									<th><%=rs.getString(1)%></th>
									<th><%=rs.getString(2)%></th>
								</tr>
							<%}}%>
							<input type=button value="print" onclick="window.print()">
							</table>
							<%
							if(s1.equals("all")){
								ResultSet rs2=smt.executeQuery("select * from delivery");
								%>
								<table border=2>
								<tr>
									<th>Delivery ID</th>
									<TH>Status</TH> 
								</tr>
								<%
								while(rs2.next())
								{
								%>
									<tr>
										<th><%=rs2.getString(1)%></th>
										<th><%=rs2.getString(2)%></th>
									</tr>
								<%}}%>
						<%}
					catch(Exception e)
					{
						out.println(e.toString());
					}
				}//End of special search
				//Record of particular search
				if(btnval.equalsIgnoreCase("psearch"))
				{
					String t1=request.getParameter("t1");
					try
					{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection conn=DriverManager.getConnection("ojdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
						Statement smt=conn.createStatement();
						
						ResultSet rs=smt.executeQuery("select * from delivery where id = '"+t1+"'");
						%>
						<table border=2>
						<tr>
							<th>Delivery ID</th>
							<TH>Status</TH> 
						</tr>
						<%
						while(rs.next())
						{
						%>
							<tr>
								<th><%=rs.getString(1)%></th>
								<th><%=rs.getString(2)%></th>
							</tr>
						<%}%>
						<input type=button value="print" onclick="window.print()">
						</table>
					<%}
					catch(Exception e)
					{
						out.println(e.toString());
					}
				}//End of particular search

%>
</body>
</html>