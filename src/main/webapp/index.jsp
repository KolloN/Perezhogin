<%@ page import="com.mysql.cj.jdbc.PreparedStatement" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h1>В общем, вот видео как это всё работает: https://yadi.sk/d/b9Of_B2b3NJmuW</h1>
<h1>Извините за такой г***о-код. У меня у самого глаза режет, но что поделать.</h1>
<h2>Весь функционал сайта:</h2>
<form action="add.jsp">
    <input type="submit" value="Добавить запись" />
</form>
<h2>Введите ID, который хотите отредактировать!</h2>
<form action="edit.jsp">
    <input type="text" name="id" placeholder="id">
    <input type="submit" value="Отредактировать" />
</form>
<h2>Введите ID, который хотите удалить!</h2>
<form action="/main" method="get">
    <input type="text" name="id" placeholder="id"/>
    <input type="text" name="typeOf" value="delete" hidden>
    <input type="submit">
</form>
<table border="2">
    <tr>
        <td>ID</td>
        <td>FIO</td>
        <td>Phone</td>
    </tr>
    <%
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost/main?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            String username="mysql";
            String password="mysql";
            String query="select * from phones";
            Connection conn=DriverManager.getConnection(url,username,password);
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery(query);
            while(rs.next())
            {

    %>
    <tr><td><%=rs.getInt("id") %></td><td><%=rs.getString("fio") %></td><td><%=rs.getString("phone") %></td></tr>
    <%

        }
    %>
</table>
<%
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