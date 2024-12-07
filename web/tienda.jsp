<%-- 
    Document   : tienda.jsp
    Created on : 6 sept 2024, 11:51:55
    Author     : DELL
--%>

<%@ page import="java.sql.*" %>
<%@ page import="com.gloria.database.DatabaseConnection" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tienda - Productos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/productos.css">
    00
</head>
<body>
    <div class="container mt-4">
        <h1 class="text-center">TIENDA DE PRODUCTOS</h1>

        <!-- Bloque: LECHE EN TARRO -->
        <h2 class="section-title">Leche en Tarro</h2>
        <div class="productos-container">
            <%
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    conn = DatabaseConnection.getConnection();
                    String query = "SELECT tam_pro, cod_pro, nom_pro, des_pro, pre_pro FROM tb_producto WHERE stock_pro > 1 AND tipo_pro = 'TARRO'";
                    ps = conn.prepareStatement(query);
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        String tamPro = rs.getString("tam_pro");
                        String codPro = rs.getString("cod_pro");
                        String nomPro = rs.getString("nom_pro");
                        String desPro = rs.getString("des_pro");
                        double prePro = rs.getDouble("pre_pro");

                        String imagen = (tamPro == null || tamPro.isEmpty()) ? "img/nohay.jpg" : "img/" + tamPro;
            %>
                        <div class="box">
                            <div class="card mb-4">
                                <img src="<%= imagen %>" class="card-img-top" alt="<%= nomPro %>">
                                <div class="card-body">
                                    <h5 class="card-title"><%= nomPro %></h5>
                                    <p class="card-text"><%= desPro %></p>
                                    <p class="card-text text-primary">S/ <%= prePro %></p>
                                    <a href="#" class="btn btn-primary agregar-carrito" 
                                       data-id="<%= codPro %>" 
                                       data-nombre="<%= nomPro %>" 
                                       data-precio="<%= prePro %>">Agregar al Carrito</a>
                                </div>
                            </div>
                        </div>
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
        </div>

        <!-- Bloque: LECHE UHT -->
        <h2 class="section-title">Leche UHT</h2>
        <div class="productos-container">
            <%
                try {
                    conn = DatabaseConnection.getConnection();
                    String query = "SELECT tam_pro, cod_pro, nom_pro, des_pro, pre_pro FROM tb_producto WHERE stock_pro > 1 AND tipo_pro = 'UHT'";
                    ps = conn.prepareStatement(query);
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        String tamPro = rs.getString("tam_pro");
                        String codPro = rs.getString("cod_pro");
                        String nomPro = rs.getString("nom_pro");
                        String desPro = rs.getString("des_pro");
                        double prePro = rs.getDouble("pre_pro");

                        String imagen = (tamPro == null || tamPro.isEmpty()) ? "img/nohay.jpg" : "img/" + tamPro;
            %>
                        <div class="box">
                            <div class="card mb-4">
                                <img src="<%= imagen %>" class="card-img-top" alt="<%= nomPro %>">
                                <div class="card-body">
                                    <h5 class="card-title"><%= nomPro %></h5>
                                    <p class="card-text"><%= desPro %></p>
                                    <p class="card-text text-primary">S/ <%= prePro %></p>
                                    <a href="#" class="btn btn-primary agregar-carrito" 
                                       data-id="<%= codPro %>" 
                                       data-nombre="<%= nomPro %>" 
                                       data-precio="<%= prePro %>">Agregar al Carrito</a>
                                </div>
                            </div>
                        </div>
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
        </div>
        <h2 class="section-title">Yogurt</h2>
        <div class="productos-container">
            <%
                try {
                    conn = DatabaseConnection.getConnection();
                    String query = "SELECT tam_pro, cod_pro, nom_pro, des_pro, pre_pro FROM tb_producto WHERE stock_pro > 1 AND tipo_pro = 'YOGURT'";
                    ps = conn.prepareStatement(query);
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        String tamPro = rs.getString("tam_pro");
                        String codPro = rs.getString("cod_pro");
                        String nomPro = rs.getString("nom_pro");
                        String desPro = rs.getString("des_pro");
                        double prePro = rs.getDouble("pre_pro");

                        String imagen = (tamPro == null || tamPro.isEmpty()) ? "img/nohay.jpg" : "img/" + tamPro;
            %>
                        <div class="box">
                            <div class="card mb-4">
                                <img src="<%= imagen %>" class="card-img-top" alt="<%= nomPro %>">
                                <div class="card-body">
                                    <h5 class="card-title"><%= nomPro %></h5>
                                    <p class="card-text"><%= desPro %></p>
                                    <p class="card-text text-primary">S/ <%= prePro %></p>
                                    <a href="#" class="btn btn-primary agregar-carrito" 
                                       data-id="<%= codPro %>" 
                                       data-nombre="<%= nomPro %>" 
                                       data-precio="<%= prePro %>">Agregar al Carrito</a>
                                </div>
                            </div>
                        </div>
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
        </div>
        <h2 class="section-title">Leche en Polvo</h2>
        <div class="productos-container">
            <%
                try {
                    conn = DatabaseConnection.getConnection();
                    String query = "SELECT tam_pro, cod_pro, nom_pro, des_pro, pre_pro FROM tb_producto WHERE stock_pro > 1 AND tipo_pro = 'POLVO'";
                    ps = conn.prepareStatement(query);
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        String tamPro = rs.getString("tam_pro");
                        String codPro = rs.getString("cod_pro");
                        String nomPro = rs.getString("nom_pro");
                        String desPro = rs.getString("des_pro");
                        double prePro = rs.getDouble("pre_pro");

                        String imagen = (tamPro == null || tamPro.isEmpty()) ? "img/nohay.jpg" : "img/" + tamPro;
            %>
                        <div class="box">
                            <div class="card mb-4">
                                <img src="<%= imagen %>" class="card-img-top" alt="<%= nomPro %>">
                                <div class="card-body">
                                    <h5 class="card-title"><%= nomPro %></h5>
                                    <p class="card-text"><%= desPro %></p>
                                    <p class="card-text text-primary">S/ <%= prePro %></p>
                                    <a href="#" class="btn btn-primary agregar-carrito" 
                                       data-id="<%= codPro %>" 
                                       data-nombre="<%= nomPro %>" 
                                       data-precio="<%= prePro %>">Agregar al Carrito</a>
                                </div>
                            </div>
                        </div>
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
        </div>
        <h2 class="section-title">Jugos y Bebidas</h2>
        <div class="productos-container">
            <%
                try {
                    conn = DatabaseConnection.getConnection();
                    String query = "SELECT tam_pro, cod_pro, nom_pro, des_pro, pre_pro FROM tb_producto WHERE stock_pro > 1 AND tipo_pro = 'JUGO/BEBIDA'";
                    ps = conn.prepareStatement(query);
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        String tamPro = rs.getString("tam_pro");
                        String codPro = rs.getString("cod_pro");
                        String nomPro = rs.getString("nom_pro");
                        String desPro = rs.getString("des_pro");
                        double prePro = rs.getDouble("pre_pro");

                        String imagen = (tamPro == null || tamPro.isEmpty()) ? "img/nohay.jpg" : "img/" + tamPro;
            %>
                        <div class="box">
                            <div class="card mb-4">
                                <img src="<%= imagen %>" class="card-img-top" alt="<%= nomPro %>">
                                <div class="card-body">
                                    <h5 class="card-title"><%= nomPro %></h5>
                                    <p class="card-text"><%= desPro %></p>
                                    <p class="card-text text-primary">S/ <%= prePro %></p>
                                    <a href="#" class="btn btn-primary agregar-carrito" 
                                       data-id="<%= codPro %>" 
                                       data-nombre="<%= nomPro %>" 
                                       data-precio="<%= prePro %>">Agregar al Carrito</a>
                                </div>
                            </div>
                        </div>
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
        </div>
        <h2 class="section-title">Alimentos</h2>
        <div class="productos-container">
            <%
                try {
                    conn = DatabaseConnection.getConnection();
                    String query = "SELECT tam_pro, cod_pro, nom_pro, des_pro, pre_pro FROM tb_producto WHERE stock_pro > 1 AND tipo_pro = 'ALIMENTO'";
                    ps = conn.prepareStatement(query);
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        String tamPro = rs.getString("tam_pro");
                        String codPro = rs.getString("cod_pro");
                        String nomPro = rs.getString("nom_pro");
                        String desPro = rs.getString("des_pro");
                        double prePro = rs.getDouble("pre_pro");

                        String imagen = (tamPro == null || tamPro.isEmpty()) ? "img/nohay.jpg" : "img/" + tamPro;
            %>
                        <div class="box">
                            <div class="card mb-4">
                                <img src="<%= imagen %>" class="card-img-top" alt="<%= nomPro %>">
                                <div class="card-body">
                                    <h5 class="card-title"><%= nomPro %></h5>
                                    <p class="card-text"><%= desPro %></p>
                                    <p class="card-text text-primary">S/ <%= prePro %></p>
                                    <a href="#" class="btn btn-primary agregar-carrito" 
                                       data-id="<%= codPro %>" 
                                       data-nombre="<%= nomPro %>" 
                                       data-precio="<%= prePro %>">Agregar al Carrito</a>
                                </div>
                            </div>
                        </div>
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
        </div>

        <!-- Puedes seguir creando bloques similares para los demás tipos de productos -->
        
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-OERcA2mVjVxFw1ffK7ujIR8b4HfSA4ERf/c7hFpJOqZ6l3AOV6FycugH626tjf8F" crossorigin="anonymous"></script>
</body>
</html>