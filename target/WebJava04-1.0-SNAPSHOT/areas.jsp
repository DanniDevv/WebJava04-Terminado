
<!-- Importe de clases general -->
<%@page import="java.sql.*" %> 
<%--validacion de sesion--%>
<%
    HttpSession misession = (HttpSession) request.getSession();
    String usuario = (String) misession.getAttribute("usuario");
    if (misession == null || misession.getAttribute("usuario") == null) {
        out.print("<link rel=\"stylesheet\" \n"
                + "              href=\"webjars/bootstrap/5.2.3/css/bootstrap.min.css\" type=\"text/css\" />");
        out.println("<center>");
        out.println("<h3>Usted no se encuentra logueado INICIE SESION</h3>");
        out.println("<a class='btn btn-primary' href='/WebJava04/login.jsp'>INICIAR SESION</a>");
        out.println("</center>");
        return;
    }
%>


<%
    String driver = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC";
    String user = "root";
    String pass = "dante900100";

    Class.forName(driver);
    Connection xcon = DriverManager.getConnection(url, user, pass);

    String sql = "select * from areas";
    Statement stm = xcon.createStatement();
    ResultSet rs = stm.executeQuery(sql);
%>

<!DOCTYPE html>
<html>

    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="webjars/bootstrap/5.2.3/css/bootstrap.min.css" type="text/css" />
            <style>
                .table-striped>tbody>tr:nth-child(odd)>td,
                .table-striped>tbody>tr:nth-child(odd)>th{
                    background-color: #AF7AC5;
                }
                .table-striped>tbody>tr:nth-child(even)>td,
                .table-striped>tbody>tr:nth-child(even)>th{
                    background-color: #5DADE2;
                }
                .table-striped>thead>tr>th {
                    background-color: skyblue;
                }
            </style>
            <title>JSP Page</title>
        </head>
        <body>
            <div class="container">
                <h1>Listado de Areas</h1>
                <h3>Usuario Logeado: <b><% out.print(usuario); %></b></h3>
                <h3><a class='btn btn-danger' href="f_sesion.jsp">Cerrar Sesion</a></h3>
                <h3><a class='btn btn-danger' href="usuario_logueado.jsp">Regresar</a></h3>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">CODIGO</th>
                            <th scope="col">NOMBRE</th>
                            <th scope="col">ESTADO</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            while (rs.next()) {
                                out.print("<tr>");
                                out.print("<td>" + rs.getString(1) + "</td>");
                                out.print("<td>" + rs.getString(2) + "</td>");
                                out.print("<td>" + rs.getString(3) + "</td>");
                                out.print("</tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </body>

    </html>
