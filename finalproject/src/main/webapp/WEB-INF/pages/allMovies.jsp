<%--
  Created by IntelliJ IDEA.
  User: huitianrui
  Date: 2017/5/30
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>所有电影</title>
    <link rel="stylesheet" href="/static/css/public.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <script src="/static/scripts/jquery-3.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js"
            integrity="sha384-Plbmg8JY28KFelvJVai01l8WyZzrYWG825m+cZ0eDDS1f7d/js6ikvy1+X+guPIB"
            crossorigin="anonymous"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="/static/scripts/jquery.twbsPagination.js" type="text/javascript"></script>
</head>
<body>

<table>
    <c:forEach items="${moviePage.list}" var="movie">
        <tr id="${movie.movieId}">
            <td align="center">
                <img src="${movie.posterUrl}" width="120px" height="165px"/>
            </td>
            <td align="center">${movie.movieName}</td>
            <td align="center">${movie.description}</td>
        </tr>
    </c:forEach>
</table>

<div class="container">
    <nav aria-label="Page navigation">
        <ul class="pagination" id="pagination"></ul>
    </nav>
</div>

<script type="text/javascript">
    $(function () {
        $('#pagination').twbsPagination({
            totalPages: ${moviePage.totalPage},
            visiblePages: 5,
            first: "首页",
            prev: "上一页",
            next: "下一页",
            last: "末页",
            initiateStartPageClick: false,
            startPage: ${moviePage.currPage},
            onPageClick: function (event, page) {
                window.location.href="http://localhost:8080/movies?pageNo=" + page + "&pageSize=2";
            }
        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function(){
        $("table tr").click(function(){
            var url = "http://localhost:8080/movies/" + this.id + "/cinemas";
            window.location.href = url;
        });
    });
</script>

</body>
</html>
