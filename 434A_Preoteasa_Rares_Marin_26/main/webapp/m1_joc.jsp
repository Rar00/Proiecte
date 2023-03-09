
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
            	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    
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
        <h1 align="center">Tabela jocuri:</h1>
        <br/>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("jocuri", "idjoc", aux);
            rs.first();
            String numejoc = rs.getString("numejoc");
            String tip = rs.getString("tip");
            String descriere = rs.getString("descriere");
            rs.close();
            jb.disconnect();
        %>
        <div>
  		<form action="m2_joc.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">Idjoc:</td>
                    <td> <input type="text" name="idjoc" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">numejoc:</td>
                    <td> <input type="text" name="numejoc" size="30" value="<%= numejoc%>"/></td>
                </tr>
                <tr>
                    <td align="right">tip:</td>
                    <td> <input type="text" name="tip" size="30" value="<%= tip%>"/></td>
                </tr>
                <tr>
                    <td align="right">descriere:</td>
                    <td> <input type="text" name="descriere" size="30" value="<%= descriere%>"/></td>
                </tr>
            </table><p align="center">
            <input type="submit" value="Modifica linia">
  </form>
</div>
        
            <br/>
    </body>
</html>