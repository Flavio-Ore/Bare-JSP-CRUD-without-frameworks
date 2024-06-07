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

<% if (session.getAttribute(DAO) == null) {
        UsuarioDAO dao = new UsuarioDAO();
        session.setAttribute(DAO, dao);
    }
    try {
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

        if (usuCod != null && usu != null && usuPass != null && usuNombres != null && usuApellidos != null
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

            boolean newestUser = dao.insertUsuario(newUsuario);
            if (newestUser) {
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
        out.println("<script>window.alert('Error en los datos.')</script>");
        e.printStackTrace();
    }

%>

<%    try {
        String emailToDeleteUsuario = request.getParameter("eliminar");

        if (emailToDeleteUsuario != null) {
            UsuarioDAO dao = (UsuarioDAO) session.getAttribute(DAO);
            dao.deleteByEmail(emailToDeleteUsuario);
        }

    } catch (Exception e) {
        out.println("<dialog open>"
                + "<p>¡Error! Los datos no fueron llenados correctamente.</p>"
                + "<form method='dialog'>"
                + "<input type='submit' value='Ok'>"
                + "</form>"
                + "</dialog>");
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
        <h2>Búsqueda de usuarios</h2>
        <form action="./index.jsp">
            <label for="busqueda_cod">Búsqueda por código</label>
            <input type="search" name="busqueda_cod" placeholder="USRXXXXX" />
            <label for="busqueda_nom_ape">Búsqueda por nombre o apellido</label>
            <input type="search" name="busqueda_nom_ape" placeholder="Nombre o Apellido" />
            <input type="submit" value="Buscar">
        </form>


        <h1>Usuarios registrados</h1>
        <div class="table-wrapper">
            <table class="lista-usuarios">
                <tr>
                    <th>Edición</th>
                    <th>Item</th>
                    <th>ID</th>
                    <th>Código de Usuario</th>
                    <th>Sobrenombre</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Contraseña</th>
                    <th>Email</th>
                    <th>Permisos</th>
                    <th>Estado</th>
                    <th>En Línea</th>
                    <th>Número de Ingresos</th>
                    <th>Creado Por</th>
                    <th>Modificado Por</th>
                    <th>Eliminado Por</th>
                    <th>Fecha de Creación</th>
                    <th>Fecha de Modificación</th>
                    <th>Fecha de Eliminación</th>
                    <th>Fecha de Último Acceso</th>
                    <th>Hora de Creación</th>
                    <th>Hora de Modificación</th>
                    <th>Hora de Eliminación</th>
                    <th>Hora de Último Acceso</th>
                </tr>
                <%                    try {
                        UsuarioDAO dao = (UsuarioDAO) session.getAttribute(DAO);

                        String searchCod = request.getParameter("busqueda_cod");
                        String searchNomApe = request.getParameter("busqueda_nom_ape");

                        if (searchCod == null || searchNomApe == null || (searchCod.trim().length() <= 0 && searchNomApe.
                                trim().length() <= 0)) {
                            out.println("<h3>Todos los resultados</h3>");
                            List<UsuarioDTO> usuarios = usuarios = dao.getAll();

                            for (UsuarioDTO usuario : usuarios) {
                                out.println("<tr>");
                                out.println(
                                        "<td>"
                                        + "<div class='table-form-edicion'>"
                                        + "<form action='./editar.jsp'>"
                                        + "<div class=\"invisible\">"
                                        + "<input name='emailUsuario' value=" + usuario.getEmail() + ">"
                                        + "</div>"
                                        + "<button type='submit' class='btn-editar'>Edit</button>"
                                        + "</form>"
                                        + "<form action='./index.jsp'>"
                                        + "<button type='submit' "
                                        + "name='eliminar' "
                                        + "value=" + usuario.getEmail() + " "
                                        + "class='btn-eliminar'>Remove</button>"
                                        + "</form>"
                                        + "</div>"
                                        + "</td>");
                                out.println("<td>" + usuario.getItemAutoIncrement() + "</td>");
                                out.println("<td>" + usuario.getId() + "</td>");
                                out.println("<td>" + usuario.getCodigo() + "</td>");
                                out.println("<td>" + usuario.getSobrenombre() + "</td>");
                                out.println("<td>" + usuario.getNombres() + "</td>");
                                out.println("<td>" + usuario.getApellidos() + "</td>");
                                out.println("<td>" + usuario.getPassword() + "</td>");
                                out.println("<td>" + usuario.getEmail() + "</td>");
                                out.println("<td>" + usuario.getPermisosToString() + "</td>");
                                out.println("<td>" + usuario.getEstadoToString() + "</td>");
                                out.println("<td>" + usuario.getEnlineaToBoolean() + "</td>");
                                out.println("<td>" + usuario.getNumeroIngresos() + "</td>");
                                out.println("<td>" + usuario.getCreadoPor() + "</td>");
                                out.println("<td>" + usuario.getModificadoPor() + "</td>");
                                out.println("<td>" + usuario.getEliminadoPor() + "</td>");
                                out.println("<td>" + usuario.getFechaCreacion() + "</td>");
                                out.println("<td>" + usuario.getFechaModificacion() + "</td>");
                                out.println("<td>" + usuario.getFechaEliminacion() + "</td>");
                                out.println("<td>" + usuario.getFechaUltAccesso() + "</td>");
                                out.println("<td>" + usuario.getHoraCreacion() + "</td>");
                                out.println("<td>" + usuario.getHoraModificacion() + "</td>");
                                out.println("<td>" + usuario.getHoraEliminacion() + "</td>");
                                out.println("<td>" + usuario.getHoraUltAcceso() + "</td>");
                                out.println("</tr>");
                            }
                        } else if (searchCod != null && searchCod.trim().length() > 0) {
                            out.println("<h3>Resultados para " + searchCod + "</h3>");
                            List<UsuarioDTO> usuariosByCod = dao.getUsuarioByCodigo(searchCod);

                            for (UsuarioDTO usuario : usuariosByCod) {
                                out.println("<tr>");
                                out.println(
                                        "<td>"
                                        + "<div class='table-form-edicion'>"
                                        + "<form action='./editar.jsp'>"
                                        + "<div class=\"invisible\">"
                                        + "<input name='emailUsuario' value=" + usuario.getEmail() + ">"
                                        + "</div>"
                                        + "<button type='submit' class='btn-editar'>Edit</button>"
                                        + "</form>"
                                        + "<form action='./index.jsp'>"
                                        + "<button type='submit' class='btn-eliminar'>Remove</button>"
                                        + "</form>"
                                        + "</div>"
                                        + "</td>");
                                out.println("<td>" + usuario.getItemAutoIncrement() + "</td>");
                                out.println("<td>" + usuario.getId() + "</td>");
                                out.println("<td>" + usuario.getCodigo() + "</td>");
                                out.println("<td>" + usuario.getSobrenombre() + "</td>");
                                out.println("<td>" + usuario.getNombres() + "</td>");
                                out.println("<td>" + usuario.getApellidos() + "</td>");
                                out.println("<td>" + usuario.getPassword() + "</td>");
                                out.println("<td>" + usuario.getEmail() + "</td>");
                                out.println("<td>" + usuario.getPermisosToString() + "</td>");
                                out.println("<td>" + usuario.getEstadoToString() + "</td>");
                                out.println("<td>" + usuario.getEnlineaToBoolean() + "</td>");
                                out.println("<td>" + usuario.getNumeroIngresos() + "</td>");
                                out.println("<td>" + usuario.getCreadoPor() + "</td>");
                                out.println("<td>" + usuario.getModificadoPor() + "</td>");
                                out.println("<td>" + usuario.getEliminadoPor() + "</td>");
                                out.println("<td>" + usuario.getFechaCreacion() + "</td>");
                                out.println("<td>" + usuario.getFechaModificacion() + "</td>");
                                out.println("<td>" + usuario.getFechaEliminacion() + "</td>");
                                out.println("<td>" + usuario.getFechaUltAccesso() + "</td>");
                                out.println("<td>" + usuario.getHoraCreacion() + "</td>");
                                out.println("<td>" + usuario.getHoraModificacion() + "</td>");
                                out.println("<td>" + usuario.getHoraEliminacion() + "</td>");
                                out.println("<td>" + usuario.getHoraUltAcceso() + "</td>");
                                out.println("</tr>");
                            }
                            if (usuariosByCod.isEmpty()) {
                                out.println(
                                        "<h4 class=\"form-no-encontrado\">No se encontraron usuarios</h4>");
                            }
                        } else if (searchNomApe != null && searchNomApe.trim().length() > 0) {
                            out.println("<h3>Resultados para " + searchNomApe + "</h3>");
                            List<UsuarioDTO> usuariosByNombres = dao.
                                    getUsuarioByNombres(searchNomApe);
                            for (UsuarioDTO usuario : usuariosByNombres) {
                                out.println("<tr>");
                                out.println(
                                        "<td>"
                                        + "<div class='table-form-edicion'>"
                                        + "<form action='./editar.jsp'>"
                                        + "<div class=\"invisible\">"
                                        + "<input name='emailUsuario' value=" + usuario.getEmail() + ">"
                                        + "</div>"
                                        + "<button type='submit' class='btn-editar'>Edit</button>"
                                        + "</form>"
                                        + "<form action='./index.jsp'>"
                                        + "<button type='submit' class='btn-eliminar'>Remove</button>"
                                        + "</form>"
                                        + "</div>"
                                        + "</td>");
                                out.println("<td>" + usuario.getItemAutoIncrement() + "</td>");
                                out.println("<td>" + usuario.getId() + "</td>");
                                out.println("<td>" + usuario.getCodigo() + "</td>");
                                out.println("<td>" + usuario.getSobrenombre() + "</td>");
                                out.println("<td>" + usuario.getNombres() + "</td>");
                                out.println("<td>" + usuario.getApellidos() + "</td>");
                                out.println("<td>" + usuario.getPassword() + "</td>");
                                out.println("<td>" + usuario.getEmail() + "</td>");
                                out.println("<td>" + usuario.getPermisosToString() + "</td>");
                                out.println("<td>" + usuario.getEstadoToString() + "</td>");
                                out.println("<td>" + usuario.getEnlineaToBoolean() + "</td>");
                                out.println("<td>" + usuario.getNumeroIngresos() + "</td>");
                                out.println("<td>" + usuario.getCreadoPor() + "</td>");
                                out.println("<td>" + usuario.getModificadoPor() + "</td>");
                                out.println("<td>" + usuario.getEliminadoPor() + "</td>");
                                out.println("<td>" + usuario.getFechaCreacion() + "</td>");
                                out.println("<td>" + usuario.getFechaModificacion() + "</td>");
                                out.println("<td>" + usuario.getFechaEliminacion() + "</td>");
                                out.println("<td>" + usuario.getFechaUltAccesso() + "</td>");
                                out.println("<td>" + usuario.getHoraCreacion() + "</td>");
                                out.println("<td>" + usuario.getHoraModificacion() + "</td>");
                                out.println("<td>" + usuario.getHoraEliminacion() + "</td>");
                                out.println("<td>" + usuario.getHoraUltAcceso() + "</td>");
                                out.println("</tr>");
                            }
                            if (usuariosByNombres.isEmpty()) {
                                out.println(
                                        "<h4 class=\"form-no-encontrado\">No se encontraron usuarios</h4>");
                            }
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
        </div>

        <h2>Agregar nuevo usuario</h2>
        <form action="./index.jsp" method="post">
            <label for="<%=Usuario.USU_COD%>">Código de usuario</label>
            <input required type="text" name=<%=Usuario.USU_COD%> placeholder="Código de usuario*"/>
            <label for="<%=Usuario.USU%>">Usuario</label>
            <input required required type="text" name="<%=Usuario.USU%>" placeholder="Usuario*"/>
            <label for="<%=Usuario.USU_PASS%>">Contraseña</label>
            <input required type="password" name="<%=Usuario.USU_PASS%>" placeholder="Contraseña*"/>
            <label for="<%=Usuario.USU_NOMBRES%>">Nombres</label>
            <input required type="text" name="<%=Usuario.USU_NOMBRES%>" placeholder="Nombres*"/>
            <label for="<%=Usuario.USU_APELLIDOS%>">Apellidos</label>
            <input required type="text" name="<%=Usuario.USU_APELLIDOS%>" placeholder="Apellidos*"/>
            <label for="<%=Usuario.USU_EMAIL%>">Email</label>
            <input required type="email" name="<%=Usuario.USU_EMAIL%>" placeholder="Email*"/>
            <label for="<%=Usuario.USU_PERMISOS%>">Permisos</label>
            <select name="<%=Usuario.USU_PERMISOS%>">
                <%
                    for (String permiso : Usuario.USU_PERMISOS_VALUES) {
                        out.println("<option value='" + permiso + "'>" + permiso + "</option>");
                    }
                %>

            </select>
            <label for="<%=Usuario.USU_ESTADO%>">Estado</label>
            <select name="<%=Usuario.USU_ESTADO%>">
                <%
                    for (int i = 0;
                            i < Usuario.USU_ESTADO_VALUES.length;
                            i++) {
                        out.println(
                                "<option value='" + i + "'>" + Usuario.USU_ESTADO_VALUES[i] + "</option>");
                    }
                %>

            </select>
            <label for="<%=Usuario.USU_ENLINEA%>">En línea</label>
            <select name="<%=Usuario.USU_ENLINEA%>">
                <%
                    for (int i = 0; i < Usuario.USU_ENLINEA_VALUES.length; i++) {
                        out.println(
                                "<option value='" + i + "'>" + Usuario.USU_ENLINEA_VALUES[i] + "</option>");
                    }
                %>

            </select>
            <label for="<%=Usuario.USU_N_INGRESOS%>">Número de ingresos</label>
            <input required type="number" name="<%=Usuario.USU_N_INGRESOS%>" placeholder="Número de ingresos*"/>
            <label for="<%=Usuario.CREADO_POR%>">Creado por</label>
            <input required type="text" name="<%=Usuario.CREADO_POR%>" placeholder="Creado por*"/>
            <label for="<%=Usuario.MODIFICADO_POR%>">Modificado por</label>
            <input required type="text" name="<%=Usuario.MODIFICADO_POR%>" placeholder="Modificado por*"/>
            <label for="<%=Usuario.ELIMINADO_POR%>">Eliminado por</label>
            <input required type="text" name="<%=Usuario.ELIMINADO_POR%>" placeholder="Eliminado por*"/>
            <label for="<%=Usuario.FEC_CREACION%>">Fecha de creación</label>
            <input required type="date" name="<%=Usuario.FEC_CREACION%>" placeholder="Fecha de creación*"/>
            <label for="<%=Usuario.FEC_MODIFICACION%>">Fecha de modificación</label>
            <input required type="date" name="<%=Usuario.FEC_MODIFICACION%>" placeholder="Fecha de modificación*"/>
            <label for="<%=Usuario.FEC_ELIMINACION%>">Fecha de eliminación</label>
            <input required type="date" name="<%=Usuario.FEC_ELIMINACION%>" placeholder="Fecha de eliminación*"/>
            <label for="<%=Usuario.FEC_ULT_ACCESSO%>">Fecha de último acceso</label>
            <input required type="date" name="<%=Usuario.FEC_ULT_ACCESSO%>" placeholder="Fecha de último acceso*"/>
            <label for="<%=Usuario.HORA_CREACION%>">Hora de creación</label>
            <input required type="time" name="<%=Usuario.HORA_CREACION%>" placeholder="Hora de creación*"/>
            <label for="<%=Usuario.HORA_MODIFICACION%>">Hora de modificación</label>
            <input required type="time" name="<%=Usuario.HORA_MODIFICACION%>" placeholder="Hora de modificación*"/>
            <label for="<%=Usuario.HORA_ELIMINACION%>">Hora de eliminación</label>
            <input required type="time" name="<%=Usuario.HORA_ELIMINACION%>" placeholder="Hora de eliminación*"/>
            <label for="<%=Usuario.HORA_ULT_ACCESO%>">Hora de último acceso</label>
            <input required type="time" name="<%=Usuario.HORA_ULT_ACCESO%>" placeholder="Hora de último acceso*"/>
            <input class="btn-guardar" type="submit" value="Guardar" />
        </form>
    </body>
</html>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        $guardarBtn = document.querySelector(".btn-guardar")

    })
</script>

