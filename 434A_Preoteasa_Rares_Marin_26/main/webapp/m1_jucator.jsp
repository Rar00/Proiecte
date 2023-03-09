
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <title>Tabela Jucatori</title>
    <style>
	input[type=text], select {
  width: 100%;
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
</head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color:#f2ee9b">
        <h1 align="center">Tabela jucatori:</h1>
        <br/>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("jucatori", "idjucator", aux);
            rs.first();
            String username = rs.getString("username");
            String parola = rs.getString("parola");
            String email = rs.getString("email");
            rs.close();
            jb.disconnect();
        %>
           <div>
  		  <form action="m2_jucator.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">Idjucator:</td>
                    <td> <input type="text" name="idjucator" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Nume utilizator:</td>
                    <td> <input type="text" name="username" size="30" value="<%= username%>"/></td>
                </tr>
                <tr>
                    <td align="right">parola:</td>
                    <td> <input type="text" name="parola" size="30" value="<%= parola%>"/></td>
                </tr>
                <tr>
                    <td align="right">email:</td>
                    <td> <input type="text" name="email" size="30" value="<%= email%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
</div>
       <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>