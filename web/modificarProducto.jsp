<%-- 
    Document   : modificarProducto
    Created on : 7 sept 2024, 2:40:19
    Author     : DELL
--%>

<%@ page import="java.sql.*" %>
<%@ page import="com.gloria.database.DatabaseConnection" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Producto</title>
    <link rel="stylesheet
    <link rel="stylesheet" href="assets/css/pro2.css">
    
    
</head>
<body>
    <h1>Modificar Producto</h1>
    <%
        int cod_pro = Integer.parseInt(request.getParameter("cod_pro"));
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DatabaseConnection.getConnection();
            String query = "SELECT * FROM tb_producto WHERE cod_pro=?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, cod_pro);
            rs = ps.executeQuery();
            if (rs.next()) {
    %>
                <form action="modificarProductoServlet" method="POST">
                    <input type="hidden" name="cod_pro" value="<%= rs.getInt("cod_pro") %>">
                    Nombre: <input type="text" name="nombre" value="<%= rs.getString("nom_pro") %>"><br>
                    Tipo: <input type="text" name="tipo" value="<%= rs.getString("tipo_pro") %>"><br>
                    Descripción: <input type="text" name="descripcion" value="<%= rs.getString("des_pro") %>"><br>
                    Precio: <input type="text" name="precio" value="<%= rs.getDouble("pre_pro") %>"><br>
                    Stock: <input type="text" name="stock" value="<%= rs.getInt("stock_pro") %>"><br>
                    Fecha Vencimiento: <input type="date" name="fecha_vencimiento" value="<%= rs.getString("fec_ven_pro") %>"><br>
                    Imagen: <input type="text" name="tam_pro"><br>
                    <button type="submit">Modificar Producto</button>
                </form>
    <%
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }
    %>
</body>
</html>



