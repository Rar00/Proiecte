<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
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
    	table {
    	 background-color : white;
	 	 border-collapse: collapse;
  		 width: 100%;
		}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

tr:hover {background-color: coral;}
    	
    </style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela jucatori</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body style="background-color:#f2ee9b;">

	<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="btn-group" role="group">
				 <a href="tabela_jucatori.jsp">
					<button  class="btn btn-secondary"  type="button">
						<b><strong>Jucatori</strong></b>
					</button>
				</a> 
				<a href="tabela_jocuri.jsp">
					<button  class="btn btn-secondary"  type="button">
						<b><strong>Jocuri</strong></b>
					</button>
				</a> 
				<a href="tabela_cont.jsp">
					<button  class="btn btn-secondary"  type="button">
						<b><strong>Conturi</strong></b>
					</button>
				</a> 
			</div>
			<div class="btn-group" role="group">
				 
				<a href="modifica_jucator.jsp">
					<button  class="btn btn-secondary"  type="button">
						<b><strong>Modifica Jucator</strong></b>
					</button>
				</a> 
				<a href="modifica_joc.jsp">
					<button  class="btn btn-secondary"  type="button">
						<b><strong>Modifica Joc</strong></b>
					</button>
				</a> 
				<a href="modifica_cont.jsp">
					<button  class="btn btn-secondary"  type="button">
						<b><strong>Modifica Cont</strong></b>
					</button>
				</a> 
			</div>
		</div>
	</div>
	</div>
	<br></br><br></br><br></br>
	<h1 align="center">Tabela jucatori:</h1>
	<br />
	<p align="center">
		<a href="nou_jucator.jsp"><button><b>Adauga un nou jucator.</b></button></a>
		
	</p>
	<form action="sterge_jucator.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td><b>Mark:</b></td>
				<td><b>Idjucator:</b></td>
				<td><b>Nume:</b></td>
				<td><b>parola:</b></td>
				<td><b>email:</b></td>

			</tr>
			<%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("jucatori");
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idjucator");
                %>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
				<td><%= x%></td>
				<td><%= rs.getString("username")%></td>
				<td><%= rs.getString("parola")%></td>
				<td><%= rs.getString("email")%></td>
				<%
                        }
                    %>
			</tr>
		</table>
		<br />
		<p align="center">
			<input type="submit" value="Sterge liniile marcate">
		</p>
	</form>
	<%
            rs.close();
            jb.disconnect();
        %>
	<br />
	<br></br><br></br><br></br><br></br><br></br>
	<a href="index.html"><button  style="background-color:yellow;" ><b >Home</b></button></a>
	
</body>
</html>