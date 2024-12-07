/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.gloria.servlets;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/agregarProductoServlet")
public class AgregarProductoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los datos del formulario, manejando valores nulos o vacíos
        String nombre = request.getParameter("nom_pro");
        String tipo = request.getParameter("tipo_pro");
        String descripcion = request.getParameter("des_pro");
        String precioString = request.getParameter("pre_pro");
        String stockString = request.getParameter("stock_pro");
        String fechaVencimiento = request.getParameter("fec_ven_pro");
        String img = request.getParameter("tam_pro");

        // Validación para asegurarse de que los campos no sean nulos ni vacíos
        if (nombre == null || nombre.trim().isEmpty() ||
            tipo == null || tipo.trim().isEmpty() ||
            descripcion == null || descripcion.trim().isEmpty() ||
            precioString == null || precioString.trim().isEmpty() ||
            stockString == null || stockString.trim().isEmpty() ||
            fechaVencimiento == null || fechaVencimiento.trim().isEmpty() ||
            img == null || img.trim().isEmpty()) {

            // Redirigir a una página de error si hay algún campo vacío
            response.sendRedirect("error.jsp");
            return;
        }

        // Convertir precio y stock a los tipos de datos correctos
        double precio = 0.0;
        int stock = 0;
        try {
            precio = Double.parseDouble(precioString);
            stock = Integer.parseInt(stockString);
        } catch (NumberFormatException e) {
            // Si los valores no son números válidos, redirigir a la página de error
            response.sendRedirect("error.jsp");
            return;
        }

        // Guardar el producto en la base de datos
        try {
            // Conectar a la base de datos
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_gloria", "root", "");

            // Preparar la consulta SQL para insertar un nuevo producto
            String sql = "INSERT INTO tb_producto (nom_pro, tipo_pro, des_pro, pre_pro, stock_pro, fec_ven_pro, tam_pro) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nombre);
            statement.setString(2, tipo);
            statement.setString(3, descripcion);
            statement.setDouble(4, precio);
            statement.setInt(5, stock);
            statement.setString(6, fechaVencimiento);
            statement.setString(7, img);

            // Ejecutar la consulta
            int filasInsertadas = statement.executeUpdate();
            if (filasInsertadas > 0) {
                // Redirigir al usuario a una página de éxito si se agregó correctamente
                response.sendRedirect("producto_agregado_exito.jsp");
            }

            // Cerrar la conexión
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}


