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
		String t3=request.getParameter("t3");
		String t4=request.getParameter("t4");
		String t5=request.getParameter("t5");
		String t6=request.getParameter("t6");
		String t7=request.getParameter("t7");
		String t8=request.getParameter("t8");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
			PreparedStatement psmt=conn.prepareStatement("insert into product values(?,?,?,?,?,?,?,?)");
			psmt.setString(1,t1);
			psmt.setString(2,t2);
			psmt.setString(3,t3);
			psmt.setString(4,t4);
			psmt.setString(5,t5);
			psmt.setString(6,t6);
			psmt.setString(7,t7);
			psmt.setString(8,t8);
			psmt.executeQuery();
			out.println("<script>alert('Your data is successfully Saved...')</script>");
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
				PreparedStatement psmt=conn.prepareStatement("delete from Product where id=?");
				psmt.setString(1,t1);
				psmt.executeQuery();
				out.println("<script>alert('Your data is Deleted succesfully...')</script>");
			}
			catch(Exception e)
			{
				out.println(e.toString());
			}
		}//End of save
		//Update record
				if(btnval.equalsIgnoreCase("update"))
				{
					String t1=request.getParameter("t1");
					String t2=request.getParameter("t2");
					String t3=request.getParameter("t3");
					String t4=request.getParameter("t4");
					String t5=request.getParameter("t5");
					String t6=request.getParameter("t6");
					String t7=request.getParameter("t7");
					String t8=request.getParameter("t8");
					try
					{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
						PreparedStatement psmt=conn.prepareStatement("update product set barcode=?,name=?,desc1=?,category=?,qty=?,weight=?,refrigerated=? where id=?");
						psmt.setString(1,t2);
						psmt.setString(2,t3);
						psmt.setString(3,t4);
						psmt.setString(4,t5);
						psmt.setString(5,t6);
						psmt.setString(6,t7);
						psmt.setString(7,t8);
						psmt.setString(8,t1);
						psmt.executeQuery();
						out.println("<script>alert('Your data is Updated successfully....')</script>");
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
						ResultSet rs=smt.executeQuery("select * from Product");
						%>
						<table border=2>
						<tr>
							<th>Product ID</th>
							<TH>Barcode</TH> 
							<th>Name</th>
							<th>Desc1</th>
							<th>Category</th>
							<TH>Qty</TH> 
							<th>Weight</th>
							<th>Refrigerated</th>
						</tr>
						<%
						while(rs.next())
						{
						%>
							<tr>
								<th><%=rs.getString(1)%></th>
								<th><%=rs.getString(2)%></th>
								<th><%=rs.getString(3)%></th>
								<th><%=rs.getString(4)%></th>
								<th><%=rs.getString(5)%></th>
								<th><%=rs.getString(6)%></th>
								<th><%=rs.getString(7)%></th>
								<th><%=rs.getString(8)%></th>
								
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
				//Record of particular search
				if(btnval.equalsIgnoreCase("psearch"))
				{
					String t1=request.getParameter("t1");
					try
					{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection conn=DriverManager.getConnection("ojdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
						Statement smt=conn.createStatement();
						ResultSet rs=smt.executeQuery("select * from Product where id ='"+t1+"'");
						%>
						<table border=2>
						<tr>
							<th>Product ID</th>
							<TH>Barcode</TH> 
							<th>Name</th>
							<th>Desc1</th>
							<th>Category</th>
							<TH>Qty</TH> 
							<th>Weight</th>
							<th>Refrigerated</th>
						</tr>
						<%
						while(rs.next())
						{
						%>
							<tr>
								<th><%=rs.getString(1)%></th>
								<th><%=rs.getString(2)%></th>
								<th><%=rs.getString(3)%></th>
								<th><%=rs.getString(4)%></th>
								<th><%=rs.getString(5)%></th>
								<th><%=rs.getString(6)%></th>
								<th><%=rs.getString(7)%></th>
								<th><%=rs.getString(8)%></th>
								
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
				//Record of special search
				if(btnval.equalsIgnoreCase("search"))
				{
					String t1=request.getParameter("t1");
					String s1 = request.getParameter("s1");
					try
					{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection conn=DriverManager.getConnection("ojdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
						Statement smt=conn.createStatement();
						if(!s1.equals("all")){
							ResultSet rs=smt.executeQuery("select * from product where "+s1+" = '"+t1+"' ");
							%>
							<table border=2>
							<tr>
								<th>Product ID</th>
								<TH>Barcode</TH> 
								<th>Name</th>
								<th>Desc1</th>
								<th>Category</th>
								<TH>Qty</TH> 
								<th>Weight</th>
								<th>Refrigerated</th>
							</tr>
							<%
							while(rs.next())
							{
							%>
								<tr>
									<th><%=rs.getString(1)%></th>
									<th><%=rs.getString(2)%></th>
									<th><%=rs.getString(3)%></th>
									<th><%=rs.getString(4)%></th>
									<th><%=rs.getString(5)%></th>
									<th><%=rs.getString(6)%></th>
									<th><%=rs.getString(7)%></th>
									<th><%=rs.getString(8)%></th>
									
								</tr>
							<%}}%>
							<input type=button value="print" onclick="window.print()">
							</table>
							
							<%
							if(s1.equals("all")){
								ResultSet rs2=smt.executeQuery("select * from product");
								%>
								<table border=2>
							<tr>
								<th>Product ID</th>
								<TH>Barcode</TH> 
								<th>Name</th>
								<th>Desc1</th>
								<th>Category</th>
								<TH>Qty</TH> 
								<th>Weight</th>
								<th>Refrigerated</th>
							</tr>
							<%
							while(rs2.next())
							{
							%>
								<tr>
									<th><%=rs2.getString(1)%></th>
									<th><%=rs2.getString(2)%></th>
									<th><%=rs2.getString(3)%></th>
									<th><%=rs2.getString(4)%></th>
									<th><%=rs2.getString(5)%></th>
									<th><%=rs2.getString(6)%></th>
									<th><%=rs2.getString(7)%></th>
									<th><%=rs2.getString(8)%></th>
									
								</tr>
							<%}}%>
							</table>
					<%}
					catch(Exception e)
					{
						out.println(e.toString());
					}
				}//End of special search

%>
</body>
</html>