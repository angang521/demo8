<%--
  Created by IntelliJ IDEA.
  User: T-420-9
  Date: 2017/11/14
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        function myFunction()
        {
            document.getElementById("demo").innerHTML="我的第一个 JavaScript 函数";
        }
    </script>
    <script>
        function myFunction()
        {
            alert("Hello World!");
        }
        function myFunction2(name,job)
        {
            alert("Welcome " + name + ", the " + job);
        }
    </script>
</head>
<body>


<h1> show  user success! </h1>
<p id="demo">一个段落</p>
<button type="button" onclick="myFunction()">尝试一下</button>
<button onclick="myFunction()">Try it</button>
<button onclick="myFunction2('Bob','Builder')">Try it2</button>
</body>
</html>
