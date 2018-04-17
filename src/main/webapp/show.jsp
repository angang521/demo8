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
    <script src="../../Scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript">

        function add() {
            $.ajax({
                url: "/api/test/",
                type: "POST",
                data: {"UserID": 4, "UserName": "test", "UserEmail": "Parry@cnblogs.com"},
                success: function (data) {
                    alert(JSON.stringify(data));
                }
            });
        }

        //更新
        function update(id) {
            $.ajax({
                url: "/api/test?id=" + id,
                type: "Put",
                data: {"UserID": 1, "UserName": "moditest", "UserEmail": "Parry@cnblogs.com"},
                success: function (data) {
                    alert(JSON.stringify(data));
                }
            });
        }

        function deletes(id) {
            $.ajax({
                url: "/api/test/1",
                type: "DELETE",
                success: function (data) {
                    alert(data);
                }
            });
        }
    </script>
</head>
<body>
<div>
    <fieldset>
        <legend>测试Web Api
        </legend>
        <a href="javascript:add()">添加(post)</a>
        <a href="javascript:update(1)">更新(put)</a>
        <a href="javascript:deletes(1)">删除(delete)</a>
        <a href="/api/test">列表(Get)</a>
        <a href="/api/test/1">实体(Get)</a>
    </fieldset>
</div>

</body>
</html>
