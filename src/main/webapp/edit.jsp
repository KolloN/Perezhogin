<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Kirill
  Date: 28.09.2017
  Time: 17:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Страница редактирования</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost/main?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String username="mysql";
        String password="mysql";
        String query="select * from phones where id="+id;
        Connection conn= DriverManager.getConnection(url,username,password);
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(query);
        while(rs.next())
        {

%>
<form action="/main" method="get">
    <input type="text" name="fio" value="<%=rs.getString("fio") %>">
    <input type="text" name="phone" value="<%=rs.getString("phone") %>">
    <input type="text" name="typeOf" value="edit" hidden>
    <input type="text" name="id" value="<%=id%>" hidden>
    <input type="submit" value="Click AFTER edit">
</form>
<%
    }
        rs.close();
        stmt.close();
        conn.close();
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>
</body>
</html>
