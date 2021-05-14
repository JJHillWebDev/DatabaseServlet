<%@ page import="java.sql.*" %>
<HTML>
    <HEAD>
        <TITLE>Book Inventory</TITLE>
    </HEAD>
    <BODY>
        <H1>Add Book</H1>
  <FORM action="index.jsp" method="get">
    <TR>
	     <TH width="50%">ID</TH>
		     <TD width="50%"><INPUT TYPE="number" NAME="id"></TD>
	  </tr>
    <TR>
	     <TH width="50%">Title</TH>
		      <TD width="50%"><INPUT TYPE="text" NAME="title"></TD>
	  </tr>
	  <TR>
	     <TH width="50%">Author</TH>
	        <TD width="50%"><INPUT TYPE="text" NAME="author"></TD>
	  </tr>
    <TR>
	     <TH width="50%">Year</TH>
		     <TD width="50%"><INPUT TYPE="number" NAME="year"></TD>
	  </tr>
    <TR>
	     <TH width="50%">Pages</TH>
		     <TD width="50%"><INPUT TYPE="number" NAME="pages"></TD>
	  </tr>
    <TR>
	      <TH></TH>
		  <TD width="50%"><INPUT TYPE="submit" VALUE="submit"></TD>
	  </tr>
   </TABLE>
   <%
   String JDBC_DRIVER = "org.sqlite.JDBC";
   Class.forName(JDBC_DRIVER);
   %>
   <%
   String id = request.getParameter("id");
   String title = request.getParameter("title");
   String author = request.getParameter("author");
   String year = request.getParameter("year");
   String pages = request.getParameter("pages");
   String connectionURL = "jdbc:sqlite:/home/jj/Desktop/bookstore/WEB-INF/dbs/bookstore.db";
   Connection conn = DriverManager.getConnection(connectionURL);
   PreparedStatement stmt = null;
   int updateQuery = 0;

  if(id!=null && title!=null && author!=null && year!=null && pages!=null)
  {
    if(id!="" && title!="" && author!="" && year!="" && pages!="")
    {
      try
      {
        String queryString = "INSERT INTO inventory(id, title, author, year, pages) VALUES (?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(queryString);
        stmt.setString(1, id);
		    stmt.setString(2, title);
		    stmt.setString(3, author);
        stmt.setString(4, year);
        stmt.setString(5, pages);
        updateQuery = stmt.executeUpdate();

        if (updateQuery != 0)
        {
          stmt.close();
          conn.close();
          response.sendRedirect("numBook.jsp");
        }
      }
      catch (Exception ex)
      {
        out.println("Unable to connect to database.");
      }
      finally
      {
        stmt.close();
        conn.close();
      }
    }
  }
%>
</form>
</BODY>
</HTML>
