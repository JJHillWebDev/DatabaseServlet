<%@ page import="java.sql.*" %>
<%
String JDBC_DRIVER = "org.sqlite.JDBC";
Class.forName(JDBC_DRIVER);
%>
<HTML>
    <HEAD>
        <TITLE>Inventory</TITLE>
    </HEAD>
    <BODY>
        <H1>Book Inventory</H1>
        <%
        String DB_URL = "jdbc:sqlite:/home/jj/Desktop/bookstore/WEB-INF/dbs/bookstore.db";
        Connection conn = DriverManager.getConnection(DB_URL);
            Statement stmt = conn.createStatement();
        String sql = "SELECT * FROM inventory";
            ResultSet rs = stmt.executeQuery(sql);
        %>
        <% while(rs.next()){ %>
           <br><br>ID: <%= rs.getInt("id") %><br>
           &nbsp Title: <%= rs.getString("title") %><br>
           &nbsp Author: <%= rs.getString("author") %><br>
           &nbsp Pages: <%= rs.getInt("year") %><br>
           &nbsp Year: <%= rs.getInt("pages") %><br>
       <% }
        %>
    </BODY>
</HTML>
