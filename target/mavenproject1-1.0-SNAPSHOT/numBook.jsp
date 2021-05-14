<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP List Users Records</title>
</head>

    <sql:setDataSource
        var="myDS"
        driver="org.sqlite.JDBC"
        url="jdbc:sqlite:/home/jj/Desktop/bookstore/WEB-INF/dbs/bookstore.db"
    />
     
     <sql:query var="listBooks"   dataSource="${myDS}">
        SELECT Count(id) As myCount FROM inventory;
    </sql:query>
     
    <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>Numb</h2></caption>
            
            
                    <td><c:out value="${listBooks}" /></td>
                    
        </table>
    </div>

</html>