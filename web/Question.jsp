<%-- 
    Document   : Question.jsp
    Created on : Nov 11, 2022, 9:41:56 AM
    Author     : LEGION 5
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="question" method="post">

            <table>
                <c:forEach items="${listQuestion}" var="lq">
                    <tr>
                        <td>${lq.getId()}</td>
                        <td>${lq.getQuestion()}</td>
                        <td><input type="radio" name="A" value="">${lq.getA()} </td>
                        <td><input type="radio" name="B" value="">B. ${lq.getB()}</td>
                        <td><input type="radio" name="C" value="">C. ${lq.getC()}</td>
                        <td><input type="radio" name="D" value="">D. ${lq.getD()}</td>
                    </tr>

                </c:forEach>
                <td><input type="submit" value="next"></td>

            </table>
        </form>
    </for
</body>
</html>
