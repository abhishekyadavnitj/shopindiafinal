<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		shopindia.DConnection db=new shopindia.DConnection();
		String user=request.getParameter("user");
		String pass=request.getParameter("pass");
		try
		{
			ResultSet rst=db.getdata("select * from users where userid='"+user+"' and password='"+pass+"' and usertype='admin'");
			if(rst.next()) // if authorized
			{
				session.setAttribute("user","auth");
				db.close();
%>
				<jsp:include page="adminhome.jsp"></jsp:include>
<%
			}
			else //if unauthorized
			{
				db.close();
%>
				<jsp:include page="index.jsp"></jsp:include>
	<%out.print("<center><h1>Invalid user or password</h1></center>");%>	
				
<%				
			}
		}
		catch(SQLException e)
		{
			out.print(e.getMessage());
		}
	%>
</body>
</html>