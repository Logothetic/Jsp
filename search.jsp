<%-- 
    Document   : search
    Created on : Feb 15, 2023, 6:09:47 PM
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
    <body>
        <%
            String JDBC_DRIVER="com.mysql.jdbc.Driver";
            String db_URL="jdbc:mysql://127.0.0.1:3306/charteredairlines?characterEncoding=utf8";
            String dbUSER="root";
            String dbPASS="";
            Connection dbConn=null;
            Statement dbStmt=null;
            try{
                Class.forName(JDBC_DRIVER);
                System.out.println("connected succ");
                dbConn=DriverManager.getConnection(db_URL,dbUSER,dbPASS);
                if(dbConn!=null){
                    dbStmt=dbConn.createStatement();
                    String sql="SELECT CID,NAME,SURNAME,NATIONALITY FROM CUSTOMERS WHERE NAME = '";
                    sql=sql+request.getParameter("name")+"';";
                    request.setCharacterEncoding("UTF-8");
                    ResultSet dbRs=dbStmt.executeQuery(sql);
                    
                    if(!dbRs.isBeforeFirst()){
                        out.print("No records found");
                    }else {
                        while(dbRs.next()){
                            int id=dbRs.getInt("CID");
                            String name=dbRs.getString("NAME");
                            String surname=dbRs.getString("SURNAME");
                            String nationality=dbRs.getString("NATIONALITY");
                            
                            out.print("id: "+String.valueOf(id) + "<br>");
                            out.print("name: "+name + "<br>");
                            out.print("surname: "+surname + "<br>");
                            out.print("nationality: "+nationality+ "<br>");
                        }
                        dbConn.close();
                    }
                }
            }catch(SQLException e){
                dbConn=null;
                out.println("sqlexception "+e.getMessage());
            }
            
            %>
            
            <<h1></h1>
    </body>
</html>
