<%@ page import="ra.academy.model.Todo" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 11/11/2023
  Time: 10:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Todo> list = (List<Todo>) request.getAttribute("todoList");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>Danh sách công việc</h1>
<a href="/TodoServlet?action=ADD">Thêm mới</a>
<table border="1" cellspacing="10" cellpadding="20">
    <tr>
        <th>ID</th>
        <th>TASK</th>
        <th>STATUS</th>
        <th colspan="2">ACTION</th>
    </tr>
    <c:forEach items="<%=list%>" var="todo" varStatus="loop">
        <tr>
            <td>${todo.getId()}</td>
            <td>${todo.getTask()}</td>
            <td>${todo.isStatus()?"Hoan Thanh":"Chua Hoan Thanh"}</td>
            <td><a href="/TodoServlet?action=EDIT&id=${todo.getId()}">EDIT</a></td>
            <td><a href="/TodoServlet?action=DELETE&id=${todo.getId()}">DELETE</a></td>
        </tr>
    </c:forEach>

</table>

</body>
</html>
