
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela joc</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color:#f2ee9b">
        <h1 align="center"> Tabela jocuri:</h1>
        <br/>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idjoc"));
            String numejoc = request.getParameter("numejoc");
            String tip = request.getParameter("tip");
            String decriere = request.getParameter("decriere");

            String[] valori = {numejoc, tip, decriere};
            String[] campuri = {"numejoc", "tip", "descriere"};
            jb.modificaTabela("jocuri", "idjoc", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a style="button" href="index.html"><button><b>Home</b></button></a>
            <br/>
    </body>
</html>