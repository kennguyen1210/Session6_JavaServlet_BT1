<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 11/11/2023
  Time: 10:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EDIT TODO</title>
</head>
<body>

<h1>Chinh sửa</h1>
<form action="/TodoServlet" method="post">
    <input type="number" name="id" value="${editTodo.getId()}" readonly>
    <textarea placeholder="nội dung công việc" name="task">${editTodo.getTask()}</textarea>
    <select name="status">
        <option value="true" ${editTodo.isStatus()? "selected":""} >Hoàn thành</option>
        <option value="false" ${!editTodo.isStatus()? "selected":""}>Chưa hoàn thành</option>
    </select>
    <input type="submit" value="EDIT" name="action">

</form>

</body>
</html>
