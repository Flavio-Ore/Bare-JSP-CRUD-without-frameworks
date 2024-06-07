/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author GonHP
 */
public class UsuarioDTO {

    private static final String USUARIO_NORMAL = "UsuarioNormal";
    private static final String USUARIO_ADMINISTRADOR = "Administrador";
    private int itemAutoIncrement;
    private int id;
    private String codigo;
    private String sobrenombre;
    private String password;
    private String nombres;
    private String apellidos;
    private String email;
    private String permisos;
    private int estado;
    private int enlinea;
    private int numeroIngresos;
    private String fechaCreacion;
    private String fechaModificacion;
    private String fechaEliminacion;
    private String fechaUltAccesso;
    private String creadoPor;
    private String modificadoPor;
    private String eliminadoPor;
    private String horaCreacion;
    private String horaModificacion;
    private String horaEliminacion;
    private String horaUltAcceso;

    public UsuarioDTO(String usuCod, String usu, String usuPass, String usuNombres,
            String usuApellidos, String usuEmail,
            String usuPermisos, int usuEstado, int usuEnlinea, int usuNIngresos, String fecCreacion,
            String fecModificacion,
            String fecEliminacion, String fecUltAccesso, String creadoPor, String modificadoPor,
            String eliminadoPor,
            String horaCreacion, String horaModificacion, String horaEliminacion,
            String horaUltAcceso) {
        this.itemAutoIncrement = -1;
        this.id = -1;
        this.codigo = usuCod;
        this.sobrenombre = usu;
        this.password = usuPass;
        this.nombres = usuNombres;
        this.apellidos = usuApellidos;
        this.email = usuEmail;
        this.permisos = usuPermisos;
        this.estado = usuEstado;
        this.enlinea = usuEnlinea;
        this.numeroIngresos = usuNIngresos;
        this.fechaCreacion = fecCreacion;
        this.fechaModificacion = fecModificacion;
        this.fechaEliminacion = fecEliminacion;
        this.fechaUltAccesso = fecUltAccesso;
        this.creadoPor = creadoPor;
        this.modificadoPor = modificadoPor;
        this.eliminadoPor = eliminadoPor;
        this.horaCreacion = horaCreacion;
        this.horaModificacion = horaModificacion;
        this.horaEliminacion = horaEliminacion;
        this.horaUltAcceso = horaUltAcceso;
    }

    public UsuarioDTO(int itemAutoIncrement, int id, String usuCod, String usu, String usuPass,
            String usuNombres,
            String usuApellidos, String usuEmail, String usuPermisos, int usuEstado, int usuEnlinea,
            int usuNIngresos,
            String fecCreacion, String fecModificacion, String fecEliminacion, String fecUltAccesso,
            String creadoPor,
            String modificadoPor, String eliminadoPor, String horaCreacion, String horaModificacion,
            String horaEliminacion,
            String horaUltAcceso) {
        this.itemAutoIncrement = itemAutoIncrement;
        this.id = id;
        this.codigo = usuCod;
        this.sobrenombre = usu;
        this.password = usuPass;
        this.nombres = usuNombres;
        this.apellidos = usuApellidos;
        this.email = usuEmail;
        this.permisos = usuPermisos;
        this.estado = usuEstado;
        this.enlinea = usuEnlinea;
        this.numeroIngresos = usuNIngresos;
        this.fechaCreacion = fecCreacion;
        this.fechaModificacion = fecModificacion;
        this.fechaEliminacion = fecEliminacion;
        this.fechaUltAccesso = fecUltAccesso;
        this.creadoPor = creadoPor;
        this.modificadoPor = modificadoPor;
        this.eliminadoPor = eliminadoPor;
        this.horaCreacion = horaCreacion;
        this.horaModificacion = horaModificacion;
        this.horaEliminacion = horaEliminacion;
        this.horaUltAcceso = horaUltAcceso;
    }

    public int getItemAutoIncrement() {
        return itemAutoIncrement;
    }

    public int getId() {
        return id;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String usuCod) {
        this.codigo = usuCod;
    }

    public String getSobrenombre() {
        return sobrenombre;
    }

    public void setSobrenombre(String usu) {
        this.sobrenombre = usu;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String usuPass) {
        this.password = usuPass;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String usuNombres) {
        this.nombres = usuNombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String usuApellidos) {
        this.apellidos = usuApellidos;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String usuEmail) {
        this.email = usuEmail;
    }

    public String getPermisos() {
        return permisos;
    }

    public String getPermisosToString() {
        if (permisos.equals(USUARIO_NORMAL)) {
            return "Usuario Normal";
        }
        if (permisos.equals(USUARIO_ADMINISTRADOR)) {
            return permisos;
        }
        return "N/A";
    }

    public String[] getPermisosArray() {
        return new String[]{"Usuario Normal", "Administrador"};
    }

    public void setPermisos(String usuPermisos) {
        this.permisos = usuPermisos;
    }

    public int getEstado() {
        return estado;
    }

    public String getEstadoToString() {
        if (estado == 0) {
            return "Anulado";
        }
        if (estado == 1) {
            return "Activo";
        }
        if (estado == 2) {
            return "Desactivado";
        }
        return "N/A";
    }

    public void setEstado(int usuEstado) {
        this.estado = usuEstado;
    }

    public int getEnlinea() {
        return enlinea;
    }

    public boolean getEnlineaToBoolean() {
        if (enlinea == 0) {
            return false;
        }
        if (enlinea == 1) {
            return true;
        }
        return false;
    }

    public void setEnlinea(int usuEnlinea) {
        this.enlinea = usuEnlinea;
    }

    public int getNumeroIngresos() {
        return numeroIngresos;
    }

    public void setNumeroIngresos(int usuNIngresos) {
        this.numeroIngresos = usuNIngresos;
    }

    public String getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(String fecCreacion) {
        this.fechaCreacion = fecCreacion;
    }

    public String getFechaModificacion() {
        return fechaModificacion;
    }

    public void setFechaModificacion(String fecModificacion) {
        this.fechaModificacion = fecModificacion;
    }

    public String getFechaEliminacion() {
        return fechaEliminacion;
    }

    public void setFechaEliminacion(String fecEliminacion) {
        this.fechaEliminacion = fecEliminacion;
    }

    public String getFechaUltAccesso() {
        return fechaUltAccesso;
    }

    public void setFechaUltAccesso(String fecUltAccesso) {
        this.fechaUltAccesso = fecUltAccesso;
    }

    public String getCreadoPor() {
        return creadoPor;
    }

    public void setCreadoPor(String creadoPor) {
        this.creadoPor = creadoPor;
    }

    public String getModificadoPor() {
        return modificadoPor;
    }

    public void setModificadoPor(String modificadoPor) {
        this.modificadoPor = modificadoPor;
    }

    public String getEliminadoPor() {
        return eliminadoPor;
    }

    public void setEliminadoPor(String eliminadoPor) {
        this.eliminadoPor = eliminadoPor;
    }

    public String getHoraCreacion() {
        return horaCreacion;
    }

    public void setHoraCreacion(String horaCreacion) {
        this.horaCreacion = horaCreacion;
    }

    public String getHoraModificacion() {
        return horaModificacion;
    }

    public void setHoraModificacion(String horaModificacion) {
        this.horaModificacion = horaModificacion;
    }

    public String getHoraEliminacion() {
        return horaEliminacion;
    }

    public void setHoraEliminacion(String horaEliminacion) {
        this.horaEliminacion = horaEliminacion;
    }

    public String getHoraUltAcceso() {
        return horaUltAcceso;
    }

    public void setHoraUltAcceso(String horaUltAcceso) {
        this.horaUltAcceso = horaUltAcceso;
    }

}
