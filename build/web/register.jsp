<%-- 
    Document   : register.jsp
    Created on : 9 sept 2024, 12:03:00
    Author     : DELL
--%>

<%@ page import="java.sql.*" %>
<%@ page import="com.gloria.database.DatabaseConnection" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>  <!-- Importar jBCrypt para encriptar contraseñas -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String nombre_completo = request.getParameter("nombre_completo");
    String correo = request.getParameter("correo");
    String usuario = request.getParameter("usuario");
    String contrasena = request.getParameter("contrasena");

    // Encriptar la contraseña usando jBCrypt
    String hashedPassword = BCrypt.hashpw(contrasena, BCrypt.gensalt());  // Encriptamos la contraseña

    Connection conn = null;
    try {
        conn = DatabaseConnection.getConnection();  // Obtener conexión desde DatabaseConnection

        // Insertar nuevo usuario con la contraseña encriptada
        String sql = "INSERT INTO usuarios (nombre_completo, correo, usuario, contrasena) VALUES (?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, nombre_completo);
        stmt.setString(2, correo);
        stmt.setString(3, usuario);
        stmt.setString(4, hashedPassword);  // Guardar la contraseña encriptada

        int rowsInserted = stmt.executeUpdate();
        if (rowsInserted > 0) {
            out.println("Registro exitoso, ahora puedes iniciar sesión");
            response.sendRedirect("index.jsp");  // Redirige a la página de inicio de sesión
        } else {
            out.println("Error en el registro");
        }

        // Cerrar la consulta
        stmt.close();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Cerrar la conexión
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>


