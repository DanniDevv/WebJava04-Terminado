<%-- 
    Document   : usuario_logueado
    Created on : 14 abr. 2023, 18:41:02
    Author     : dante
--%>
<%@page import="java.sql.*" %> 
<%
    HttpSession misession = (HttpSession) request.getSession();
    String usuario = (String) misession.getAttribute("usuario");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="webjars/bootstrap/5.2.3/css/bootstrap.min.css" type="text/css" />
        
        <title>JSP Page</title>
    </head>
    <body>
        <h1>LOGUEADO</h1><br>
        <h3>Usuario Logeado: <b><% out.print(usuario);%></b></h3><br>
        <h1>Estado: A</h1> <br>
        <ul>
            <a class="btn btn-info" href="areas.jsp">ÁREAS</a><br><br>
            <a class="btn btn-info" href="cargos.jsp">CARGOS</a><br><br>
            <a class='btn btn-danger' href="f_sesion.jsp">Cerrar Sesion</a>
        </ul>
    </body>
</html>
