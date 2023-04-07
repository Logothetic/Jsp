<%-- 
    Document   : insert
    Created on : Feb 16, 2023, 9:32:06 PM
    Author     : Alexi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <h3>Insert a new Student</h3>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action="InsertServlet" method="POST">
            <table>
                <tr>
                    <th>Id<th>
                    <td> <input type="text" name ="sid" id="sid"> <td>
                </tr>
                <tr>
                    <th>Name<th>
                    <td> <input type="text" name ="sname" id="sname"> <td>
                </tr>
                <tr>
                    <th>Lessons<th>
                    <td> <input type="text" name ="noLess" id="noLess"> <td>
                </tr>
                <tr>
                    <td> <br> <input type="submit" name ="submit" id="submit" value="submit"><td>
                </tr>
            </table>
        </form>
    </body>
</html>
 