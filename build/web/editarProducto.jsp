<%-- 
    Document   : editarProductos.jsp
    Created on : 6 sept 2024, 1:57:17
    Author     : DELL
--%>

<%@ page import="java.sql.*" %>
<%@ page import="com.gloria.database.DatabaseConnection" %>
<%
    int codPro = Integer.parseInt(request.getParameter("cod_pro"));
    String nombre = "";
    double precio = 0.0;
    int stock = 0;

    try {
        Connection conn = DatabaseConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM tb_producto WHERE cod_pro = ?");
        ps.setInt(1, codPro);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            nombre = rs.getString("nom_pro");
            precio = rs.getDouble("pre_pro");
            stock = rs.getInt("stock_pro");
        }
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<link rel="stylesheet" href="assets/css/pro2.css">
<h2>Nuevo Producto</h2>
<form action="ProductoServlet" method="post">

    <label for="nombre">Nombre del Producto:</label>
    <input type="text" id="nombre" name="nombre" required><br>

    <label for="tipo">Tipo de Producto:</label>
    <select id="tipo" name="tipo" required>
        <option value="TARRO">TARRO</option>
        <option value="UHT">UHT</option>
        <option value="YOGURT">YOGURT</option>
        <option value="POLVO">POLVO</option>
        <option value="JUGO/BEBIDA">JUGO/BEBIDA</option>
        <option value="ALIMENTO">ALIMENTO</option>
    </select><br>

    <label for="descripcion">Descripción:</label>
    <input type="text" id="descripcion" name="descripcion" required><br>

    <label for="precio">Precio:</label>
    <input type="text" id="precio" name="precio" required><br>

    <label for="stock">Stock:</label>
    <input type="text" id="stock" name="stock" required><br>

    <label for="fecha_venc">Fecha de Vencimiento:</label>
    <input type="date" id="fecha_venc" name="fecha_venc" required><br>

    <!-- El campo de imagen no será obligatorio -->
    <label for="imagen">Ruta de la Imagen (opcional):</label>
    <input type="text" id="imagen" name="imagen" placeholder="img/nombreimagen.jpg"><br>

    <input type="submit" value="Agregar Producto">
</form>

