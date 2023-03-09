
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
          <style>
	input[type=text], select {
  width: 200%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <title>Adauga joc</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color:#f2ee9b;">
        <%
            String numejoc = request.getParameter("numejoc");
            String tip = request.getParameter("tip");
            String descriere = request.getParameter("descriere");
            if (numejoc != null) {
                jb.connect();
                jb.adaugajoc(numejoc, tip, descriere);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <br></br><br></br><br></br><br></br><br></br><br></br>
        <h1 style="text-align:center"> Adauga joc.</h1>
        <form style="text-align:center; width: 50%; margin-left : 25%" action="nou_joc.jsp" method="post">
            <table>
                <tr>
                    <td align="right">numejoc:</td>
                    <td> <input type="text" name="numejoc" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">tip joc:</td>
                    <td> <input type="text" name="tip" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">descriere:</td>
                    <td> <input type="text" name="descriere" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga jocul" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>