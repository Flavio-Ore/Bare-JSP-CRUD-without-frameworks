<%-- 
    Document   : index
    Created on : 9 may. 2024, 00:17:50
    Author     : GonHP
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="database.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="models.UsuarioDTO"%>
<%@page import="dao.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
    final static String DAO = "DAO";
%>

<%
    if (session.getAttribute(DAO) == null) {
        UsuarioDAO dao = new UsuarioDAO();
        session.setAttribute(DAO, dao);
    }
    try {
        String email = (String) session.getAttribute("USUARIO_EMAIL");

        UsuarioDAO dao = (UsuarioDAO) session.getAttribute(DAO);
        String usuCod = request.getParameter(Usuario.USU_COD);
        String usu = request.getParameter(Usuario.USU);
        String usuPass = request.getParameter(Usuario.USU_PASS);
        String usuNombres = request.getParameter(Usuario.USU_NOMBRES);
        String usuApellidos = request.getParameter(Usuario.USU_APELLIDOS);
        String usuEmail = request.getParameter(Usuario.USU_EMAIL);
        String usuPermisos = request.getParameter(Usuario.USU_PERMISOS);
        String usuEstadoParameter = request.getParameter(Usuario.USU_ESTADO);
        String usuEnlineaParameter = request.getParameter(Usuario.USU_ENLINEA);
        String usuNIngresosParameter = request.getParameter(Usuario.USU_N_INGRESOS);
        String fecCreacion = request.getParameter(Usuario.FEC_CREACION);
        String fecModificacion = request.getParameter(Usuario.FEC_MODIFICACION);
        String fecEliminacion = request.getParameter(Usuario.FEC_ELIMINACION);
        String fecUltAccesso = request.getParameter(Usuario.FEC_ULT_ACCESSO);
        String creadoPor = request.getParameter(Usuario.CREADO_POR);
        String modificadoPor = request.getParameter(Usuario.MODIFICADO_POR);
        String eliminadoPor = request.getParameter(Usuario.ELIMINADO_POR);
        String horaCreacion = request.getParameter(Usuario.HORA_CREACION);
        String horaModificacion = request.getParameter(Usuario.HORA_MODIFICACION);
        String horaEliminacion = request.getParameter(Usuario.HORA_ELIMINACION);
        String horaUltAcceso = request.getParameter(Usuario.HORA_ULT_ACCESO);

        if (email != null && usuCod != null && usu != null && usuPass != null && usuNombres != null && usuApellidos != null
                && usuEmail != null && usuPermisos != null && usuEstadoParameter != null && usuEnlineaParameter != null
                && usuNIngresosParameter != null && fecCreacion != null && fecModificacion != null
                && fecEliminacion != null && fecUltAccesso != null && creadoPor != null
                && modificadoPor != null && eliminadoPor != null && horaCreacion != null
                && horaModificacion != null && horaEliminacion != null && horaUltAcceso != null) {

            Integer usuEstado = Integer.parseInt(usuEstadoParameter);
            Integer usuEnlinea = Integer.parseInt(usuEnlineaParameter);
            Integer usuNIngresos = Integer.parseInt(usuNIngresosParameter);
            UsuarioDTO newUsuario = new UsuarioDTO(usuCod, usu, usuPass, usuNombres, usuApellidos,
                    usuEmail,
                    usuPermisos, usuEstado, usuEnlinea, usuNIngresos, fecCreacion, fecModificacion,
                    fecEliminacion, fecUltAccesso, creadoPor, modificadoPor, eliminadoPor,
                    horaCreacion,
                    horaModificacion, horaEliminacion, horaUltAcceso);

            boolean updatedUser = dao.updateUsuarioByEmail(email, newUsuario);
            if (updatedUser) {
                out.println("<dialog open>"
                        + "<p>¡Éxito! Los datos fueron llenados correctamente. Tabla actualizada</p>"
                        + "<form method='dialog'>"
                        + "<input type='submit' value='Ok'>"
                        + "</form>"
                        + "</dialog>");
            } else {
                out.println("<dialog open>"
                        + "<p>¡Error! Los datos no fueron llenados correctamente.</p>"
                        + "<form method='dialog'>"
                        + "<input type='submit' value='Ok'>"
                        + "</form>"
                        + "</dialog>");
            }
        }
    } catch (Exception e) {
        out.println("<script>window.alert('Error en los datos')</script>");
        e.printStackTrace();
    }

%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Probando JSP</title>
        <%@include file="./styles.jspf" %>
    </head>
    <body>
        <header><%@include file="./navigation.jspf" %></header>
        <h1>Edición de usuario</h1>
        <form action="./editar.jsp" method="POST">
            <%                UsuarioDAO dao = (UsuarioDAO) session.getAttribute(DAO);
                String email = request.getParameter("emailUsuario");
                String sessionEmail = (String) session.getAttribute("USUARIO_EMAIL");
                UsuarioDTO usuario = null;

                if (email != null) {
                    session.setAttribute("USUARIO_EMAIL", email);
                    usuario = dao.getUsuarioByEmail(email);
                } else if (sessionEmail != null) {
                    usuario = dao.getUsuarioByEmail(sessionEmail);
                }

                if ((sessionEmail != null || email != null) && usuario != null) {

                    out.println("<label for=" + Usuario.USU_COD + ">Código de usuario</label>");
                    out.println("<input type='text' name=" + Usuario.USU_COD + " value='" + usuario.
                            getCodigo() + "' placeholder='Código de usuario*'/>");
                    out.println("<label for=" + Usuario.USU + ">Usuario</label>");
                    out.println("<input type='text' name=" + Usuario.USU + " value='" + usuario.
                            getSobrenombre() + "' placeholder='Usuario*'/>");
                    out.println("<label for=" + Usuario.USU_PASS + ">Contraseña</label>");
                    out.println(
                            "<input type='password' name=" + Usuario.USU_PASS + " value='" + usuario.
                                    getPassword() + "' placeholder='Contraseña*'/>");
                    out.println("<label for=" + Usuario.USU_NOMBRES + ">Nombres</label>");
                    out.println(
                            "<input type='text' name=" + Usuario.USU_NOMBRES + " value='" + usuario.
                                    getNombres() + "' placeholder='Nombres*'/>");
                    out.println("<label for=" + Usuario.USU_APELLIDOS + ">Apellidos</label>");
                    out.println(
                            "<input type='text' name=" + Usuario.USU_APELLIDOS + " value='" + usuario.
                                    getApellidos() + "' placeholder='Apellidos*'/>");
                    out.println("<label for=" + Usuario.USU_EMAIL + ">Email</label>");
                    out.println(
                            "<input type='email' name=" + Usuario.USU_EMAIL + " value='" + usuario.
                                    getEmail() + "' placeholder='Email*'/>");
                    out.println("<label for=" + Usuario.USU_PERMISOS + ">Permisos</label>");
                    out.println("<select name=" + Usuario.USU_PERMISOS + ">");
                    for (String permiso : Usuario.USU_PERMISOS_VALUES) {
                        out.println("<option value='" + permiso + "'>" + permiso + "</option>");
                    }
                    out.println("</select>");
                    out.println("<label for=" + Usuario.USU_ESTADO + ">Estado</label>");
                    out.println("<select name=" + Usuario.USU_ESTADO + ">");
                    for (int i = 0; i < Usuario.USU_ESTADO_VALUES.length; i++) {
                        out.println(
                                "<option value='" + i + "'>" + Usuario.USU_ESTADO_VALUES[i] + "</option>");
                    }
                    out.println("</select>");
                    out.println("<label for=" + Usuario.USU_ENLINEA + ">En línea</label>");
                    out.println("<select name=" + Usuario.USU_ENLINEA + ">");
                    for (int i = 0; i < Usuario.USU_ENLINEA_VALUES.length; i++) {
                        out.println(
                                "<option value='" + i + "'>" + Usuario.USU_ENLINEA_VALUES[i] + "</option>");
                    }
                    out.println("</select>");
                    out.println(
                            "<label for=" + Usuario.USU_N_INGRESOS + ">Número de ingresos</label>");
                    out.println(
                            "<input type='number' name=" + Usuario.USU_N_INGRESOS + " value='" + usuario.
                                    getNumeroIngresos() + "' placeholder='Número de ingresos*'/>");
                    out.println("<label for=" + Usuario.CREADO_POR + ">Creado por</label>");
                    out.println(
                            "<input type='text' name=" + Usuario.CREADO_POR + " value='" + usuario.
                                    getCreadoPor() + "' placeholder='Creado por*'/>");
                    out.println("<label for=" + Usuario.MODIFICADO_POR + ">Modificado por</label>");
                    out.println(
                            "<input type='text' name=" + Usuario.MODIFICADO_POR + " value='" + usuario.
                                    getModificadoPor() + "' placeholder='Modificado por*'/>");
                    out.println("<label for=" + Usuario.ELIMINADO_POR + ">Eliminado por</label>");
                    out.println(
                            "<input type='text' name=" + Usuario.ELIMINADO_POR + " value='" + usuario.
                                    getEliminadoPor() + "' placeholder='Eliminado por*'/>");
                    out.println("<label for=" + Usuario.FEC_CREACION + ">Fecha de creación</label>");
                    out.println(
                            "<input type='date' name=" + Usuario.FEC_CREACION + " value='" + usuario.
                                    getFechaCreacion() + "' placeholder='Fecha de creación*'/>");
                    out.println(
                            "<label for=" + Usuario.FEC_MODIFICACION + ">Fecha de modificación</label>");
                    out.println(
                            "<input type='date' name=" + Usuario.FEC_MODIFICACION + " value='" + usuario.
                                    getFechaModificacion() + "' placeholder='Fecha de modificación*'/>");
                    out.println(
                            "<label for=" + Usuario.FEC_ELIMINACION + ">Fecha de eliminación</label>");
                    out.println(
                            "<input type='date' name=" + Usuario.FEC_ELIMINACION + " value='" + usuario.
                                    getFechaEliminacion() + "' placeholder='Fecha de eliminación*'/>");
                    out.println(
                            "<label for=" + Usuario.FEC_ULT_ACCESSO + ">Fecha de último acceso</label>");
                    out.println(
                            "<input type='date' name=" + Usuario.FEC_ULT_ACCESSO + " value='" + usuario.
                                    getFechaUltAccesso() + "' placeholder='Fecha de último acceso*'/>");
                    out.println("<label for=" + Usuario.HORA_CREACION + ">Hora de creación</label>");
                    out.println(
                            "<input type='time' name=" + Usuario.HORA_CREACION + " value='" + usuario.
                                    getHoraCreacion() + "' placeholder='Hora de creación*'/>");
                    out.println(
                            "<label for=" + Usuario.HORA_MODIFICACION + ">Hora de modificación</label>");
                    out.println(
                            "<input type='time' name=" + Usuario.HORA_MODIFICACION + " value='" + usuario.
                                    getHoraModificacion() + "' placeholder='Hora de modificación*'/>");
                    out.println(
                            "<label for=" + Usuario.HORA_ELIMINACION + ">Hora de eliminación</label>");
                    out.println(
                            "<input type='time' name=" + Usuario.HORA_ELIMINACION + " value='" + usuario.
                                    getHoraEliminacion() + "' placeholder='Hora de eliminación*'/>");
                    out.println(
                            "<label for=" + Usuario.HORA_ULT_ACCESO + ">Hora de último acceso</label>");
                    out.println(
                            "<input type='time' name=" + Usuario.HORA_ULT_ACCESO + " value='" + usuario.
                                    getHoraUltAcceso() + "' placeholder='Hora de último acceso*'/>");
                    out.println("<input class='btn-guardar' type='submit' value='Actualizar' />");
                }
            %>

        </form>
    </body>
</html>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        $guardarBtn = document.querySelector(".btn-guardar")

    })
</script>