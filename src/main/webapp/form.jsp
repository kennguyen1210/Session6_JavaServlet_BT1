<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 11/11/2023
  Time: 8:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Form login</title>
</head>
<body>
<form action="">
    <div>
        <lable for="user"></lable>
        <input type="text" name="user" id="user" value="${user? user :""}">
    </div>
    <div>
        <lable for="password"></lable>
        <input type="password" name="password" id="password" value="${password? password :""}">
    </div>
    <div>
        <p>${error? "User hoac password chua dung!" : ""}</p>
    </div>
    <input type="submit" value="LOGIN" name="action">
</form>
</body>
</html>
