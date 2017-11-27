<%--
  Created by IntelliJ IDEA.
  User: T-420-9
  Date: 2017/11/17
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<p id="demo"></p>
<script>
    var text = '{"employees":[' +
        '{"firstName":"John","lastName":"Doe" },' +
        '{"firstName":"Anna","lastName":"Smith" },' +
        '{"firstName":"Peter","lastName":"Jones" }]}';
    obj = JSON.parse(text);
    document.getElementById("demo").innerHTML =
        obj.employees[2].firstName + " " + obj.employees[1].lastName;

    var x = 1;

    function myFunction() {
        x++;
        alert(x);
    }
   //alert(x)

</script>
<button onclick="myFunction()">show myFunction</button>


<script>
    document.write(Date());
</script>

<p id="p2">Hello World!</p>

<script>
    document.getElementById("p2").style.color="blue";
</script>

<p>The paragraph above was changed by a script.</p>



<h1 id="id1">My Heading 1</h1>
<button type="button"
        onclick="document.getElementById('id1').style.color='red'">
    Click Me!</button>




</body>
</html>
