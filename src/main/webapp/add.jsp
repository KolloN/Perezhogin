<%--
  Created by IntelliJ IDEA.
  User: Kirill
  Date: 28.09.2017
  Time: 17:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Страница добавления</title>
</head>
<body>
<form action="/main" method="get">
    <input type="text" name="fio" placeholder="ФИО">
    <input type="text" name="phone" placeholder="Телефон">
    <input type="text" name="typeOf" value="adding" hidden>
    <input type="submit">
</form>
</body>
</html>
