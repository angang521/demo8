<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
    <%--<script src="js/jquery-3.2.1.slim.min.js"></script>--%>
 <script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js">
    </script>
</head>
<body>
<h3>请登录</h3>
<form action="toLoggin" method="post">
    <p>账户: <input type="text" name="account" /></p>
    <p>密码: <input type="password" name="pwd" /></p>
    <input type="submit" value="Submit"/>
</form>
</body>
</html>
