/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.gloria.servlets;

import com.gloria.database.DatabaseConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/modificarProductoServlet")
public class ModificarProductoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cod_pro = Integer.parseInt(request.getParameter("cod_pro"));
        String nombre = request.getParameter("nombre");
        String tipo = request.getParameter("tipo");
        String descripcion = request.getParameter("descripcion");
        double precio = Double.parseDouble(request.getParameter("precio"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String fecha_venc = request.getParameter("fecha_vencimiento");
        String imagen = request.getParameter("imagen");

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DatabaseConnection.getConnection();
            String query = "UPDATE tb_producto SET nom_pro=?, tipo_pro=?, des_pro=?, pre_pro=?, stock_pro=?, fecha_venc=?, tam_pro=? WHERE cod_pro=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, nombre);
            ps.setString(2, tipo);
            ps.setString(3, descripcion);
            ps.setDouble(4, precio);
            ps.setInt(5, stock);
            ps.setString(6, fecha_venc);
            ps.setString(7, imagen);
            ps.setInt(8, cod_pro);
            ps.executeUpdate();

            response.sendRedirect("productos.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(ModificarProductoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (conn != null) try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(ModificarProductoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}

