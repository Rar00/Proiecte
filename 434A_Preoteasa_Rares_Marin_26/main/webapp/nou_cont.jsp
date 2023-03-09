]
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Adauga cont</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color:#f2ee9b;">
        <%
            int idjucator, idjoc;
            String id1, id2, numejoc_jucator, parola, email, numejocjoc, tipjoc, descriere;
            id1 = request.getParameter("idjucator");
            id2 = request.getParameter("idjoc");
            if (id1 != null)  {
                jb.connect();
                jb.adaugacont(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2));
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("jucatori");
        ResultSet rs2 = jb.vedeTabela("jocuri");
        %>
        <br></br><br></br><br></br><br></br><br></br>
        <h1 style="text-align:center"> Adauga cont.</h1>
        <form style="text-align:center; width: 50%; margin-left : 25%" action="nou_cont.jsp" method="post">
            <table>
                <tr>
                    <td> 
                        Selectati jucatorul:
			<SELECT NAME="idjucator">
                                <%
                                    while(rs1.next()){
                                        idjucator = rs1.getInt("idjucator");
                                        numejoc_jucator = rs1.getString("username");
                                        parola = rs1.getString("parola");
                                        email = rs1.getString("email");
                                %>
                                    <OPTION VALUE="<%= idjucator%>"><%= idjucator%>,<%= numejoc_jucator%>,<%= parola%>,<%= email%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                    
                    </td>
                </tr>
                <tr>
                    <td> 
                        Selectati jocul:
			<SELECT NAME="idjoc">
				<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                                <%
                                    while(rs2.next()){
                                        idjoc = rs2.getInt("idjoc");
                                        numejocjoc = rs2.getString("numejoc");
                                        tipjoc = rs2.getString("tip");
                                        descriere = rs2.getString("descriere");
                                %>
                                    <OPTION VALUE="<%= idjoc%>"><%= idjoc%>,<%= numejocjoc%>,<%= tipjoc%>,<%= descriere%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                     </td>
                </tr>
                <tr>
             </table>
            <input type="submit" value="Adauga contul" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>