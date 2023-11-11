<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="ra.academy.model.Todo" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 11/11/2023
  Time: 6:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    List<Todo> list ;
%>
<%! 
    public void jspInit(){
        list = Arrays.asList(
                new Todo(1,"Quét nhà", true),
                new Todo(2,"Rửa bát", false)
        );
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Hello world again! I am ${name}</h1>
<c:set var="age" value="50" scope="page"></c:set>

    <p>Age : ${age}</p>
    <c:if test="${true}"><p>Trung nien</p></c:if>
    <c:choose>
        <c:when test="${age < 50 }"><p>Chua trung nien</p></c:when>
        <c:when test="${age >= 50}"><p>Trung nien</p></c:when>
        <c:otherwise><p>Vi thanh nien</p></c:otherwise>
    </c:choose>

<table>
    <tr>
        <th>Index</th>
        <th>STT</th>
        <th>ID</th>
        <th>Task</th>
        <th>Status</th>
    </tr>
    <c:forEach items="<%=list%>" var="todo" varStatus="loop">
        <tr>
            <td>${loop.index}</td>
            <td>${loop.count}</td>
            <td>${loop.current.id}</td>
            <td>${loop.current.task}</td>
            <td>${loop.current.status?"Hoan thanh":"Chua hoan thanh"}</td>
        </tr>
    </c:forEach>

</table>
<div>
    <c:forEach begin="1" end="10" varStatus="loop">
        <a href="${loop.count}">${loop.count}</a>
    </c:forEach>
</div>
</body>
</html>
<%!
    public void jspDestroy(){
        System.out.println("Huy jsp");
    }
%>
