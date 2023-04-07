<%-- 
    Document   : classes
    Created on : Feb 15, 2023, 10:52:15 PM
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
    <h1>Student id: <%=request.getParameter("id")%></h1>
    <body>
        <% 
//            String id=request.getParameter("id");
            String JDBC_DRIVER="com.mysql.jdbc.Driver";
            String db_URL="jdbc:mysql://127.0.0.1:3306/students?characterEncoding=utf8";
            String dbUSER="root";
            String dbPASS="";
            Connection dbConn=null;
            Statement dbStmt=null;
            try{
                Class.forName(JDBC_DRIVER);
                dbConn=DriverManager.getConnection(db_URL,dbUSER,dbPASS);
                if(dbConn!=null){
                    dbStmt=dbConn.createStatement();                
                    String sql="SELECT LESSONS FROM STUDENT WHERE ID = '";
                    sql=sql+request.getParameter("id")+"';";
                    request.setCharacterEncoding("UTF-8");
                    ResultSet dbRs=dbStmt.executeQuery(sql);
                      
                    if(!dbRs.isBeforeFirst()){
                        out.print("No records found");
                    }else {
                        int noLess=0;
                        while(dbRs.next()){
                            noLess=dbRs.getInt("LESSONS");  
                            for(int x=0;x<=9;x++){%>&nbsp;<%}%>
                            <label> Class </label> 
                            <% for(int x=0;x<=35;x++){ %>&nbsp;<% } %>
                            <label> Grade </label><br><%
                            for(int i=0;i<noLess;i++){
        %> 
        
        <form method="post" action="savemarks.jsp">
            class <%out.print(i+1);%> 
            <input type="text" name ="class<%= i+1 %>" id="class<%= i+1 %>"/>
            <input type="text" name="grade<%= i+1 %>" id="grade<%= i+1 %>"/>
        <br>
        
        <%                  
                            }
                        }
                    }
//                    dbConn.close();
                }
            }catch(SQLException e){
                dbConn=null;
                out.println("sqlexception "+e.getMessage());
            }
            
            session.setAttribute("id", request.getParameter("id"));
        %>
        
        <br>
        
            <input type="submit" name="submit" value="submit">
        </form>
    </body>
</html>
