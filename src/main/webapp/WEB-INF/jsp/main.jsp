<%--
  Created by IntelliJ IDEA.
  User: T-420-9
  Date: 2017/11/14
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        var data="{\n" +
            "                \"ADDRESS\": \"张江镇金科路\",\n" +
            "                \"CreditScore\": \"{\\\"success\\\":true,\\\"biz_no\\\":\\\"ZM201801023000000896800085725976\\\",\\\"zm_score\\\":\\\"786\\\"}\",\n" +
            "                \"DAS\": \"{\\\"success\\\":true,\\\"biz_no\\\":\\\"ZM201801023000000656800085638912\\\",\\\"vars\\\":[{\\\"key\\\":\\\"activity_area_stability\\\",\\\"value\\\":\\\"03\\\"},{\\\"key\\\":\\\"last_1y_total_active_biz_cnt\\\",\\\"value\\\":\\\"10\\\"},{\\\"key\\\":\\\"have_car_flag\\\",\\\"value\\\":\\\"01\\\"},{\\\"key\\\":\\\"have_fang_flag\\\",\\\"value\\\":\\\"01\\\"},{\\\"key\\\":\\\"ovd_order_cnt_5y_m6_status\\\",\\\"value\\\":\\\"N\\\"},{\\\"success\\\":true,\\\"biz_no\\\":\\\"ZM201801023000000206800085757203\\\",\\\"hit\\\":\\\"yes\\\",\\\"risk_code\\\":[\\\"R_CN_002\\\"]}\",\n" +
            "                \"WatchListii\": \"{\\\"success\\\":true,\\\"biz_no\\\":\\\"ZM201801023000000686800085754309\\\",\\\"is_matched\\\":false}\",\n" +
            "                \"contact_mobile\": \"11949725660\",\n" +
            "                \"contact_name\": \"吴3\",\n" +
            "                \"contact_relation\": \"PARENTS\",\n" +
            "                \"education_degree\": \"BACHELOR\",\n" +
            "                \"taxed_income\": \"BETEWEEN_16_20\"\n" +
            "}";
      function test() {
          $.ajax({
              url:'./getJson',
              data:JSON.stringify(data),
              type:"post",
              dataType:"json",
              contentType:"application/json",
              success:function(json){
                  $.messager.alert("提示","成功","info");
              }
          });
      }


    </script>
</head>
<body>
<h3>success! main</h3>

<br/>
<a href="showUser">SHOW USER</a>
</body>
</html>
