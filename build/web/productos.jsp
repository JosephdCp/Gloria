<%-- 
    Document   : productos.jsp
    Created on : 6 sept 2024, 1:16:06
    Author     : DELL
--%>

<%@ page import="java.sql.*" %>
<%@ page import="com.gloria.database.DatabaseConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Productos</title>
    
</head>
<body>

    <h1>Lista de Productos</h1>
     <link rel="stylesheet" href="assets/css/prod.css">
    <!-- Botón para agregar nuevo producto -->
    <a href="nuevoProducto.jsp" class="btn-add">Agregar Nuevo Producto</a>

    <!-- Tabla para mostrar productos -->
    <table>
        <thead>
            <tr>
                <th>Código</th>
                <th>Nombre</th>
                <th>Tipo</th>
                <th>Descripción</th>
                <th>Precio</th>
                <th>Stock</th>
                <th>Fecha Vencimiento</th>
                <th>Imagen</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    // Conexión a la base de datos y consulta para obtener los productos
                    Connection conn = DatabaseConnection.getConnection();
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM tb_producto");

                    // Iterar sobre los resultados de la consulta y mostrarlos en la tabla
                    while (rs.next()) {
                        int codigo = rs.getInt("cod_pro");
                        String nombre = rs.getString("nom_pro");
                        String tipo = rs.getString("tipo_pro");
                        String descripcion = rs.getString("des_pro");
                        double precio = rs.getDouble("pre_pro");
                        int stock = rs.getInt("stock_pro");
                        String fechaVencimiento = rs.getString("fec_ven_pro");
                        String imagen = rs.getString("tam_pro");

                        out.println("<tr>");
                        out.println("<td>" + codigo + "</td>");
                        out.println("<td>" + nombre + "</td>");
                        out.println("<td>" + tipo + "</td>");
                        out.println("<td>" + descripcion + "</td>");
                        out.println("<td>S/ " + precio + "</td>");
                        out.println("<td>" + stock + "</td>");
                        out.println("<td>" + fechaVencimiento + "</td>");
                        out.println("<td>" + imagen + "</td>");
                        // Agregar enlaces para modificar el producto
                        out.println("<td><a href='modificarProducto.jsp?cod_pro=" + codigo + "' class='btn-modificar'>Modificar</a></td>");
                        out.println("</tr>");
                    }
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </tbody>
    </table>

</body>
</html>





