/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import database.DatabaseConnection;
import database.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.UsuarioDTO;

public class UsuarioDAO extends DatabaseConnection {

    static final Logger logger = Logger.getLogger(UsuarioDAO.class.getName());

    public List<UsuarioDTO> getAll() {
        UsuarioDTO usuario = null;
        ArrayList<UsuarioDTO> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuario LIMIT 10";
        try {
            this.createConnection();
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                ResultSet resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    int itemAi = resultSet.getInt(Usuario.ITEM_AI);
                    int usuId = resultSet.getInt(Usuario.USU_ID);
                    String usuCod = resultSet.getString(Usuario.USU_COD);
                    String usu = resultSet.getString(Usuario.USU);
                    String usuPass = resultSet.getString(Usuario.USU_PASS);
                    String usuNombres = resultSet.getString(Usuario.USU_NOMBRES);
                    String usuApellidos = resultSet.getString(Usuario.USU_APELLIDOS);
                    String usuEmail = resultSet.getString(Usuario.USU_EMAIL);
                    String usuPermisos = resultSet.getString(Usuario.USU_PERMISOS);
                    int usuEstado = resultSet.getInt(Usuario.USU_ESTADO);
                    int usuEnlinea = resultSet.getInt(Usuario.USU_ENLINEA);
                    int usuNIngresos = resultSet.getInt(Usuario.USU_N_INGRESOS);
                    String fecCreacion = resultSet.getString(Usuario.FEC_CREACION);
                    String fecModificacion = resultSet.getString(Usuario.FEC_MODIFICACION);
                    String fecEliminacion = resultSet.getString(Usuario.FEC_ELIMINACION);
                    String fecUltAccesso = resultSet.getString(Usuario.FEC_ULT_ACCESSO);
                    String creadoPor = resultSet.getString(Usuario.CREADO_POR);
                    String modificadoPor = resultSet.getString(Usuario.MODIFICADO_POR);
                    String eliminadoPor = resultSet.getString(Usuario.ELIMINADO_POR);
                    String horaCreacion = resultSet.getString(Usuario.HORA_CREACION);
                    String horaModificacion = resultSet.getString(Usuario.HORA_MODIFICACION);
                    String horaEliminacion = resultSet.getString(Usuario.HORA_ELIMINACION);
                    String horaUltAcceso = resultSet.getString(Usuario.HORA_ULT_ACCESO);

                    usuario = new UsuarioDTO(itemAi, usuId, usuCod, usu, usuPass, usuNombres,
                            usuApellidos, usuEmail, usuPermisos,
                            usuEstado, usuEnlinea, usuNIngresos, fecCreacion, fecModificacion,
                            fecEliminacion, fecUltAccesso,
                            creadoPor, modificadoPor, eliminadoPor, horaCreacion, horaModificacion,
                            horaEliminacion, horaUltAcceso);

                    usuarios.add(usuario);
                }
                logger.log(Level.INFO, "🔁 ALL USUSARIOS FETCHED");

                return usuarios;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return Collections.emptyList();
        } finally {
            this.closeConnection();
        }
    }

    public boolean insertUsuario(UsuarioDTO usuario) {
        String sql = "INSERT INTO usuario (USU_COD, USU, USU_PASS, USU_NOMBRES, USU_APELLIDOS, USU_EMAIL, USU_PERMISOS, "
                + "USU_ESTADO, USU_ENLINEA, USU_N_INGRESOS, FEC_CREACION, FEC_MODIFICACION, FEC_ELIMINACION, "
                + "FEC_ULT_ACCESSO, CREADO_POR, MODIFICADO_POR, ELIMINADO_POR, HORA_CREACION, HORA_MODIFICACION, "
                + "HORA_ELIMINACION, HORA_ULT_ACCESO) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String usuCod = usuario.getCodigo();
        String usu = usuario.getSobrenombre();
        String usuPass = usuario.getPassword();
        String usuNombres = usuario.getNombres();
        String usuApellidos = usuario.getApellidos();
        String usuEmail = usuario.getEmail();
        String usuPermisos = usuario.getPermisos();
        int usuEstado = usuario.getEstado();
        int usuEnlinea = usuario.getEnlinea();
        int usuNIngresos = usuario.getNumeroIngresos();
        String fecCreacion = usuario.getFechaCreacion();
        String fecModificacion = usuario.getFechaModificacion();
        String fecEliminacion = usuario.getFechaEliminacion();
        String fecUltAccesso = usuario.getFechaUltAccesso();
        String creadoPor = usuario.getCreadoPor();
        String modificadoPor = usuario.getModificadoPor();
        String eliminadoPor = usuario.getEliminadoPor();
        String horaCreacion = usuario.getHoraCreacion();
        String horaModificacion = usuario.getHoraModificacion();
        String horaEliminacion = usuario.getHoraEliminacion();
        String horaUltAcceso = usuario.getHoraUltAcceso();

        try {
            this.createConnection();
            try (PreparedStatement preparedStatement = this.connection.prepareStatement(sql)) {
                preparedStatement.setString(1, usuCod);
                preparedStatement.setString(2, usu);
                preparedStatement.setString(3, usuPass);
                preparedStatement.setString(4, usuNombres);
                preparedStatement.setString(5, usuApellidos);
                preparedStatement.setString(6, usuEmail);
                preparedStatement.setString(7, usuPermisos);
                preparedStatement.setInt(8, usuEstado);
                preparedStatement.setInt(9, usuEnlinea);
                preparedStatement.setInt(10, usuNIngresos);
                preparedStatement.setString(11, fecCreacion);
                preparedStatement.setString(12, fecModificacion);
                preparedStatement.setString(13, fecEliminacion);
                preparedStatement.setString(14, fecUltAccesso);
                preparedStatement.setString(15, creadoPor);
                preparedStatement.setString(16, modificadoPor);
                preparedStatement.setString(17, eliminadoPor);
                preparedStatement.setString(18, horaCreacion);
                preparedStatement.setString(19, horaModificacion);
                preparedStatement.setString(20, horaEliminacion);
                preparedStatement.setString(21, horaUltAcceso);

                preparedStatement.executeUpdate();
            }
            logger.log(Level.INFO, "⭐ NEW USUARIO INSERTED - CODE: " + usuario.getCodigo());
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            this.closeConnection();
        }
    }

    public UsuarioDTO getUsuarioByEmail(String email) {
        UsuarioDTO usuario = null;
        String sql = "SELECT * FROM usuario WHERE USU_EMAIL = ? LIMIT 10";
        try {
            this.createConnection();
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, email);
                ResultSet resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    logger.log(Level.INFO,
                            "=======================GETTING ALL THE USERS, ROW NUMBER: {0} ===========================",
                            resultSet.getRow());
                    int itemAi = resultSet.getInt(Usuario.ITEM_AI);
                    int usuId = resultSet.getInt(Usuario.USU_ID);
                    String usuCod = resultSet.getString(Usuario.USU_COD);
                    String usu = resultSet.getString(Usuario.USU);
                    String usuPass = resultSet.getString(Usuario.USU_PASS);
                    String usuNombres = resultSet.getString(Usuario.USU_NOMBRES);
                    String usuApellidos = resultSet.getString(Usuario.USU_APELLIDOS);
                    String usuEmail = resultSet.getString(Usuario.USU_EMAIL);
                    String usuPermisos = resultSet.getString(Usuario.USU_PERMISOS);
                    int usuEstado = resultSet.getInt(Usuario.USU_ESTADO);
                    int usuEnlinea = resultSet.getInt(Usuario.USU_ENLINEA);
                    int usuNIngresos = resultSet.getInt(Usuario.USU_N_INGRESOS);
                    String fecCreacion = resultSet.getString(Usuario.FEC_CREACION);
                    String fecModificacion = resultSet.getString(Usuario.FEC_MODIFICACION);
                    String fecEliminacion = resultSet.getString(Usuario.FEC_ELIMINACION);
                    String fecUltAccesso = resultSet.getString(Usuario.FEC_ULT_ACCESSO);
                    String creadoPor = resultSet.getString(Usuario.CREADO_POR);
                    String modificadoPor = resultSet.getString(Usuario.MODIFICADO_POR);
                    String eliminadoPor = resultSet.getString(Usuario.ELIMINADO_POR);
                    String horaCreacion = resultSet.getString(Usuario.HORA_CREACION);
                    String horaModificacion = resultSet.getString(Usuario.HORA_MODIFICACION);
                    String horaEliminacion = resultSet.getString(Usuario.HORA_ELIMINACION);
                    String horaUltAcceso = resultSet.getString(Usuario.HORA_ULT_ACCESO);

                    usuario = new UsuarioDTO(itemAi, usuId, usuCod, usu, usuPass, usuNombres,
                            usuApellidos, usuEmail, usuPermisos,
                            usuEstado, usuEnlinea, usuNIngresos, fecCreacion, fecModificacion,
                            fecEliminacion, fecUltAccesso,
                            creadoPor, modificadoPor, eliminadoPor, horaCreacion, horaModificacion,
                            horaEliminacion, horaUltAcceso);
                }
                logger.log(Level.INFO, "🔎 USUARIO FETCHED BY EMAIL - CODE: " + usuario.
                        getCodigo());

                return usuario;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            this.closeConnection();
        }
    }

    public List<UsuarioDTO> getUsuarioByNombres(String nombres) {
        UsuarioDTO usuario = null;
        ArrayList<UsuarioDTO> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuario WHERE USU_NOMBRES LIKE ? OR USU_APELLIDOS LIKE ? LIMIT 10;";
        try {
            this.createConnection();

            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, "%" + nombres + "%");
                preparedStatement.setString(2, "%" + nombres + "%");
                ResultSet resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    logger.log(Level.INFO,
                            "===========================GETTING BY NAMES OR SURNAMES ROW NUMBER: {0} ===========================",
                            resultSet.getRow());
                    int itemAi = resultSet.getInt(Usuario.ITEM_AI);
                    int usuId = resultSet.getInt(Usuario.USU_ID);
                    String usuCod = resultSet.getString(Usuario.USU_COD);
                    String usu = resultSet.getString(Usuario.USU);
                    String usuPass = resultSet.getString(Usuario.USU_PASS);
                    String usuNombres = resultSet.getString(Usuario.USU_NOMBRES);
                    String usuApellidos = resultSet.getString(Usuario.USU_APELLIDOS);
                    String usuEmail = resultSet.getString(Usuario.USU_EMAIL);
                    String usuPermisos = resultSet.getString(Usuario.USU_PERMISOS);
                    int usuEstado = resultSet.getInt(Usuario.USU_ESTADO);
                    int usuEnlinea = resultSet.getInt(Usuario.USU_ENLINEA);
                    int usuNIngresos = resultSet.getInt(Usuario.USU_N_INGRESOS);
                    String fecCreacion = resultSet.getString(Usuario.FEC_CREACION);
                    String fecModificacion = resultSet.getString(Usuario.FEC_MODIFICACION);
                    String fecEliminacion = resultSet.getString(Usuario.FEC_ELIMINACION);
                    String fecUltAccesso = resultSet.getString(Usuario.FEC_ULT_ACCESSO);
                    String creadoPor = resultSet.getString(Usuario.CREADO_POR);
                    String modificadoPor = resultSet.getString(Usuario.MODIFICADO_POR);
                    String eliminadoPor = resultSet.getString(Usuario.ELIMINADO_POR);
                    String horaCreacion = resultSet.getString(Usuario.HORA_CREACION);
                    String horaModificacion = resultSet.getString(Usuario.HORA_MODIFICACION);
                    String horaEliminacion = resultSet.getString(Usuario.HORA_ELIMINACION);
                    String horaUltAcceso = resultSet.getString(Usuario.HORA_ULT_ACCESO);

                    usuario = new UsuarioDTO(itemAi, usuId, usuCod, usu, usuPass, usuNombres,
                            usuApellidos, usuEmail, usuPermisos,
                            usuEstado, usuEnlinea, usuNIngresos, fecCreacion, fecModificacion,
                            fecEliminacion, fecUltAccesso,
                            creadoPor, modificadoPor, eliminadoPor, horaCreacion, horaModificacion,
                            horaEliminacion, horaUltAcceso);
                    usuarios.add(usuario);
                }
            }
            logger.
                    log(Level.INFO, "⭐ USUARIO FETCHED BY NOMBRES - CODE: " + usuario.
                            getCodigo());

            return usuarios;
        } catch (SQLException e) {
            e.printStackTrace();
            return Collections.emptyList();
        } finally {
            this.closeConnection();
        }
    }

    public List<UsuarioDTO> getUsuarioByCodigo(String codigo) {
        UsuarioDTO usuario = null;
        ArrayList<UsuarioDTO> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuario WHERE USU_COD LIKE ? LIMIT 10;";
        try {
            this.createConnection();
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, "%" + codigo + "%");
                ResultSet resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    logger.log(Level.INFO,
                            "===========================GETTING BY CODE, NAMES OR SURNAMES ROW NUMBER: {0} ===========================",
                            resultSet.getRow());
                    int itemAi = resultSet.getInt(Usuario.ITEM_AI);
                    int usuId = resultSet.getInt(Usuario.USU_ID);
                    String usuCod = resultSet.getString(Usuario.USU_COD);
                    String usu = resultSet.getString(Usuario.USU);
                    String usuPass = resultSet.getString(Usuario.USU_PASS);
                    String usuNombres = resultSet.getString(Usuario.USU_NOMBRES);
                    String usuApellidos = resultSet.getString(Usuario.USU_APELLIDOS);
                    String usuEmail = resultSet.getString(Usuario.USU_EMAIL);
                    String usuPermisos = resultSet.getString(Usuario.USU_PERMISOS);
                    int usuEstado = resultSet.getInt(Usuario.USU_ESTADO);
                    int usuEnlinea = resultSet.getInt(Usuario.USU_ENLINEA);
                    int usuNIngresos = resultSet.getInt(Usuario.USU_N_INGRESOS);
                    String fecCreacion = resultSet.getString(Usuario.FEC_CREACION);
                    String fecModificacion = resultSet.getString(Usuario.FEC_MODIFICACION);
                    String fecEliminacion = resultSet.getString(Usuario.FEC_ELIMINACION);

                    String fecUltAccesso = resultSet.getString(Usuario.FEC_ULT_ACCESSO);
                    String creadoPor = resultSet.getString(Usuario.CREADO_POR);
                    String modificadoPor = resultSet.getString(Usuario.MODIFICADO_POR);
                    String eliminadoPor = resultSet.getString(Usuario.ELIMINADO_POR);
                    String horaCreacion = resultSet.getString(Usuario.HORA_CREACION);
                    String horaModificacion = resultSet.getString(Usuario.HORA_MODIFICACION);
                    String horaEliminacion = resultSet.getString(Usuario.HORA_ELIMINACION);
                    String horaUltAcceso = resultSet.getString(Usuario.HORA_ULT_ACCESO);

                    usuario = new UsuarioDTO(itemAi, usuId, usuCod, usu, usuPass, usuNombres,
                            usuApellidos, usuEmail, usuPermisos,
                            usuEstado, usuEnlinea, usuNIngresos, fecCreacion, fecModificacion,
                            fecEliminacion, fecUltAccesso,
                            creadoPor, modificadoPor, eliminadoPor, horaCreacion, horaModificacion,
                            horaEliminacion, horaUltAcceso);
                    usuarios.add(usuario);
                }
                logger.log(Level.INFO, "⭐ USUARIO FETCHED BY CODIGO - CODE: " + usuario.
                        getCodigo());

                return usuarios;

            }
        } catch (SQLException e) {
            e.printStackTrace();
            return Collections.emptyList();
        } finally {
            this.closeConnection();
        }
    }

    public List<UsuarioDTO> getUsuarioByCodigoNombresApellidos(String codigo,
            String nombresApellidos) {
        UsuarioDTO usuario = null;
        ArrayList<UsuarioDTO> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuario WHERE USU_COD LIKE ? OR USU_NOMBRES LIKE ? OR USU_APELLIDOS LIKE ? LIMIT 10;";
        try {
            this.createConnection();
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, "%" + codigo + "%");
                preparedStatement.setString(2, "%" + nombresApellidos + "%");
                preparedStatement.setString(3, "%" + nombresApellidos + "%");
                ResultSet resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    logger.log(Level.INFO,
                            "===========================GETTING BY CODE, NAMES OR SURNAMES ROW NUMBER: {0} ===========================",
                            resultSet.getRow());
                    int itemAi = resultSet.getInt(Usuario.ITEM_AI);
                    int usuId = resultSet.getInt(Usuario.USU_ID);
                    String usuCod = resultSet.getString(Usuario.USU_COD);
                    String usu = resultSet.getString(Usuario.USU);
                    String usuPass = resultSet.getString(Usuario.USU_PASS);
                    String usuNombres = resultSet.getString(Usuario.USU_NOMBRES);
                    String usuApellidos = resultSet.getString(Usuario.USU_APELLIDOS);
                    String usuEmail = resultSet.getString(Usuario.USU_EMAIL);
                    String usuPermisos = resultSet.getString(Usuario.USU_PERMISOS);
                    int usuEstado = resultSet.getInt(Usuario.USU_ESTADO);
                    int usuEnlinea = resultSet.getInt(Usuario.USU_ENLINEA);
                    int usuNIngresos = resultSet.getInt(Usuario.USU_N_INGRESOS);
                    String fecCreacion = resultSet.getString(Usuario.FEC_CREACION);
                    String fecModificacion = resultSet.getString(Usuario.FEC_MODIFICACION);
                    String fecEliminacion = resultSet.getString(Usuario.FEC_ELIMINACION);

                    String fecUltAccesso = resultSet.getString(Usuario.FEC_ULT_ACCESSO);
                    String creadoPor = resultSet.getString(Usuario.CREADO_POR);
                    String modificadoPor = resultSet.getString(Usuario.MODIFICADO_POR);
                    String eliminadoPor = resultSet.getString(Usuario.ELIMINADO_POR);
                    String horaCreacion = resultSet.getString(Usuario.HORA_CREACION);
                    String horaModificacion = resultSet.getString(Usuario.HORA_MODIFICACION);
                    String horaEliminacion = resultSet.getString(Usuario.HORA_ELIMINACION);
                    String horaUltAcceso = resultSet.getString(Usuario.HORA_ULT_ACCESO);

                    usuario = new UsuarioDTO(itemAi, usuId, usuCod, usu, usuPass, usuNombres,
                            usuApellidos, usuEmail, usuPermisos,
                            usuEstado, usuEnlinea, usuNIngresos, fecCreacion, fecModificacion,
                            fecEliminacion, fecUltAccesso,
                            creadoPor, modificadoPor, eliminadoPor, horaCreacion, horaModificacion,
                            horaEliminacion, horaUltAcceso);
                    usuarios.add(usuario);
                }
                logger.log(Level.INFO,
                        "⭐ USUARIO FETCHED BY CODIGO, NOMBRES Y APELLIDOS - CODE: " + usuario.
                                getCodigo());

                return usuarios;
            }
        } catch (SQLException e) {

            e.printStackTrace();
            return Collections.emptyList();
        } finally {
            this.closeConnection();
        }
    }

    public boolean updateUsuarioByEmail(String email, UsuarioDTO usuario) {
        String sql = "UPDATE usuario SET USU_COD = ?, USU = ?, USU_PASS = ?, USU_NOMBRES = ?, USU_APELLIDOS = ?, "
                + "USU_EMAIL = ?, USU_PERMISOS = ?, USU_ESTADO = ?, USU_ENLINEA = ?, USU_N_INGRESOS = ?, FEC_CREACION = ?, "
                + "FEC_MODIFICACION = ?, FEC_ELIMINACION = ?, FEC_ULT_ACCESSO = ?, CREADO_POR = ?, MODIFICADO_POR = ?, "
                + "ELIMINADO_POR = ?, HORA_CREACION = ?, HORA_MODIFICACION = ?, HORA_ELIMINACION = ?, HORA_ULT_ACCESO = ? "
                + "WHERE USU_EMAIL = ?";
        String usuCod = usuario.getCodigo();
        String usu = usuario.getSobrenombre();
        String usuPass = usuario.getPassword();
        String usuNombres = usuario.getNombres();
        String usuApellidos = usuario.getApellidos();
        String usuEmail = usuario.getEmail();
        String usuPermisos = usuario.getPermisos();
        int usuEstado = usuario.getEstado();
        int usuEnlinea = usuario.getEnlinea();
        int usuNIngresos = usuario.getNumeroIngresos();
        String fecCreacion = usuario.getFechaCreacion();
        String fecModificacion = usuario.getFechaModificacion();
        String fecEliminacion = usuario.getFechaEliminacion();
        String fecUltAccesso = usuario.getFechaUltAccesso();
        String creadoPor = usuario.getCreadoPor();
        String modificadoPor = usuario.getModificadoPor();
        String eliminadoPor = usuario.getEliminadoPor();
        String horaCreacion = usuario.getHoraCreacion();
        String horaModificacion = usuario.getHoraModificacion();
        String horaEliminacion = usuario.getHoraEliminacion();
        String horaUltAcceso = usuario.getHoraUltAcceso();

        try {
            this.createConnection();
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, usuCod);
                preparedStatement.setString(2, usu);
                preparedStatement.setString(3, usuPass);
                preparedStatement.setString(4, usuNombres);
                preparedStatement.setString(5, usuApellidos);
                preparedStatement.setString(6, usuEmail);
                preparedStatement.setString(7, usuPermisos);
                preparedStatement.setInt(8, usuEstado);
                preparedStatement.setInt(9, usuEnlinea);
                preparedStatement.setInt(10, usuNIngresos);
                preparedStatement.setString(11, fecCreacion);
                preparedStatement.setString(12, fecModificacion);
                preparedStatement.setString(13, fecEliminacion);
                preparedStatement.setString(14, fecUltAccesso);
                preparedStatement.setString(15, creadoPor);
                preparedStatement.setString(16, modificadoPor);
                preparedStatement.setString(17, eliminadoPor);
                preparedStatement.setString(18, horaCreacion);
                preparedStatement.setString(19, horaModificacion);
                preparedStatement.setString(20, horaEliminacion);
                preparedStatement.setString(21, horaUltAcceso);
                preparedStatement.setString(22, email);
                logger.log(Level.INFO, "🔺 USER UPDATED BY EMAIL - CODE: " + usuario.
                        getCodigo());

                return preparedStatement.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            this.closeConnection();
        }
    }

    public boolean deleteByEmail(String email) {
        String sql = "DELETE FROM usuario WHERE USU_EMAIL = ?";
        try {
            this.createConnection();

            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, email);
                preparedStatement.executeUpdate();
                logger.log(Level.INFO, "❌ USUARIO DELETED BY EMAIL - EMAIL: " + email);

                return preparedStatement.getUpdateCount() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            this.closeConnection();
        }
    }

    public boolean deleteById(int id) {
        String sql = "DELETE FROM usuario WHERE USU_ID = ?";
        try {
            this.createConnection();
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, id);
                preparedStatement.executeUpdate();
                logger.log(Level.INFO, "❌ USER DELETED BY ID - ID: " + id);
                return preparedStatement.getUpdateCount() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            this.closeConnection();
        }
    }

}
