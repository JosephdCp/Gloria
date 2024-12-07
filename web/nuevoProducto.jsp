<%-- 
    Document   : nuevoProducto
    Created on : 7 sept 2024, 2:39:50
    Author     : DELL
--%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Nuevo Producto</title>
    <link rel="stylesheet" href="productos.css">
</head>
<body>
    <h1>Agregar Nuevo Producto</h1>
    <form action="agregarProductoServlet" method="POST" enctype="multipart/form-data">
        Nombre: <input type="text" name="nom_pro" maxlength="25" required><br>
        Tipo: <input type="text" name="tipo_pro" maxlength="25" required><br>
        Descripción: <input type="text" name="des_pro" maxlength="250" required><br>
        Precio: <input type="number" step="0.01" name="pre_pro" required><br>
        Stock: <input type="number" name="stock_pro" required><br>
        Fecha de Vencimiento: <input type="date" name="fec_ven_pro" required><br>
        Imagen: <input type="text" name="tam_pro" maxlength="25" required><br>
        <button type="submit">Agregar Producto</button>
    </form>
</body>
</html>


