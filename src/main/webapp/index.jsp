<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--Dieu huong trang tu dong--%>
<%
    // dieu huong theo duong dan
//    response.sendRedirect("/about.jsp");
    // chuyen tiep yeu cau
//    request.setAttribute("name","KenNguyen");
//    request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request,response);
%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="/TodoServlet?action=GETALL">Quản lý công việc</a>

<%--tao tinh nang dang nhap
B1: bam vao nut dang nhap -> form dang nhap
B2: nhap thong tin dang nhap -> servlet AuthServlet
B3: neu sai thong tin --> hien thi loi va thuc hien lai buoc 2
B4: neu dung tra ve loi chao o trang home va an nut login di
--%>
</body>
</html>