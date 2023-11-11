<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 11/11/2023
  Time: 10:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ADD TODO</title>
</head>
<body>
<h1>Thêm mới</h1>
<form action="/TodoServlet" method="post">
    <textarea placeholder="nội dung công việc" name="task"></textarea>
    <select name="status">
        <option value="true">Hoàn thành</option>
        <option value="false" selected>Chưa hoàn thành</option>
    </select>
    <input type="submit" value="ADD" name="action">
</form>
</body>
</html>
