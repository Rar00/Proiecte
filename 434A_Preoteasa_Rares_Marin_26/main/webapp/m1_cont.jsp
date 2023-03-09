
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
    <title>Tabela cont</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color:#f2ee9b">
        <h1 align="center">Tabela cont:</h1>
        <br/>
        <%
            jb.connect();
            String username, parola, email, numejoc, tip, descriere, Diagnostic, jocament, datacrearii;

            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarcecontId(aux);
            rs.first();
            int id1 = rs.getInt("idjucator");
            int id2 = rs.getInt("idjoc");

            username = rs.getString("username");
            parola = rs.getString("parola");
            email = rs.getString("email");
            numejoc = rs.getString("numejoc");
            tip = rs.getString("tip");
            descriere = rs.getString("descriere");
            datacrearii = rs.getString("datacrearii");
            
            ResultSet rs1 = jb.vedeTabela("jucatori");
            ResultSet rs2 = jb.vedeTabela("jocuri");
            int idjucator, idjoc;


        %>
        <form action="m2_cont.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">Idcont:</td>
                    <td> <input type="text" name="idcont" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">idjucator:</td>
                    <td> 
                        <SELECT NAME="idjucator">
                            <%
                                while (rs1.next()) {
                                    idjucator = rs1.getInt("idjucator");
                                    username = rs1.getString("username");
                                    parola = rs1.getString("parola");
                                    email = rs1.getString("email");
                                    if (idjucator != id1) {
                            %>
                            <OPTION VALUE="<%= idjucator%>"><%= idjucator%>, <%= username%>, <%= parola%>, <%= email%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idjucator%>"><%= idjucator%>, <%= username%>, <%= parola%>, <%= email%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">idjoc:</td>
                    <td> 
                        <SELECT NAME="idjoc">
                            <%
                                while (rs2.next()) {
                                    idjoc = rs2.getInt("idjoc");
                                    numejoc = rs2.getString("numejoc");
                                    tip = rs2.getString("tip");
                                    descriere = rs2.getString("descriere");
                            if (idjoc != id2) {
                            %>
                            <OPTION VALUE="<%= idjoc%>"><%= idjoc%>, <%= numejoc%>, <%= tip%>, <%= descriere%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idjoc%>"><%= idjoc%>, <%= numejoc%>, <%= tip%>, <%= descriere%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">datacrearii:</td>
                    <td> <input type="text" name="datacrearii" size="30" value="<%= datacrearii%>"/></td>
                </tr>
                
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
</html>