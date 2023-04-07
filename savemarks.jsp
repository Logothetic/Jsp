<%-- 
    Document   : savemarks
    Created on : Feb 16, 2023, 11:47:20 AM
    Author     : Alexi
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <h1>The data that you gave is</h1>
    <body>
        <%
            String JDBC_DRIVER = "com.mysql.jdbc.Driver";
            String db_URL = "jdbc:mysql://127.0.0.1:3306/students?characterEncoding=utf8";
            String dbUSER = "root";
            String dbPASS = "";
            Connection dbConn = null;
            Statement dbStmt = null;
                try {
                    dbConn = DriverManager.getConnection(db_URL, dbUSER, dbPASS);
                    if (dbConn != null) {
                        dbStmt = dbConn.createStatement();
                        String id = session.getAttribute("id").toString(); 
                        String sql = "SELECT LESSONS FROM STUDENT WHERE ID = '" + id + "';";
                        request.setCharacterEncoding("UTF-8");
                        ResultSet dbRs = dbStmt.executeQuery(sql);

                        if (!dbRs.isBeforeFirst()) {
                            out.print("No records found");
                        } else {
                            int noLess = 0;
                            dbRs.next();
                                noLess = dbRs.getInt("LESSONS");
                                for (int i = 0; i < noLess; i++) {
                                    String classValue = request.getParameter("class" + (i + 1));
                                    String gradeValue = request.getParameter("grade" + (i + 1));
                                    out.println(classValue + " " + gradeValue + "<br>" );
                                    sql = "INSERT INTO ATTENDANCE (ID, CID, GRADE) VALUES ('"+ id +"', '"+ classValue +"', '"+ gradeValue +"')";
                                    dbStmt.executeUpdate(sql);   
                                }
                            }
                        }
                    
//                    dbConn.close();
                } catch (SQLException e) {
                    dbConn = null;
                    out.println("sqlexception " + e.getMessage());
                }
//            }

        %>
        

    </body>
</html>
