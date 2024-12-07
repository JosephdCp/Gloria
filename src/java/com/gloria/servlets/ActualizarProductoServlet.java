/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.gloria.servlets;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.gloria.database.DatabaseConnection;
import com.gloria.database.DatabaseConnection;

@WebServlet("/ActualizarProductoServlet")
public class ActualizarProductoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros del formulario
        int codPro = Integer.parseInt(request.getParameter("cod_pro"));
        String nombre = request.getParameter("nombre");
        double precio = Double.parseDouble(request.getParameter("precio"));
        int stock = Integer.parseInt(request.getParameter("stock"));

        try {
            // Establecer conexión con la base de datos
            Connection conn = DatabaseConnection.getConnection();

            // Crear consulta SQL para actualizar el producto
            String sql = "UPDATE tb_producto SET nom_pro = ?, pre_pro = ?, stock_pro = ? WHERE cod_pro = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setDouble(2, precio);
            ps.setInt(3, stock);
            ps.setInt(4, codPro);

            // Ejecutar la consulta
            ps.executeUpdate();

            // Cerrar la conexión
            conn.close();

            // Redirigir de vuelta a la página de productos después de la actualización
            response.sendRedirect("productos.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");  // Puedes redirigir a una página de error si lo prefieres
        }
    }
}
