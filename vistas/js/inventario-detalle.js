
$(document).ready(function(){ 

    var idProducto = localStorage.getItem("idProductoDetalle");

    if(idProducto){
        var datos = new FormData();
        datos.append("idProducto", idProducto);

        $.ajax({
            url:"ajax/datable-inventario-detalle.ajax.php",
            method: "POST",
            data: datos,
            cache: false,
            contentType: false,
            processData: false,
            dataType:"json",
            success:function(respuesta){
                console.log("Detalles del producto:", respuesta);




                if (typeof respuesta === 'object' && respuesta !== null && respuesta.hasOwnProperty('producto') && respuesta.hasOwnProperty('inventario')) {

                    // Asignar los datos del producto a una variable separada
                    var infoProducto = respuesta.producto;
                    // Asignar los datos de inventario a otra variable separada
                    var movimientosInventario = respuesta.inventario;

                    // --- 6. Llenar los datos del Producto en la sección superior ---
                    // Se verifica que 'infoProducto' no sea nulo o vacío antes de intentar acceder a sus propiedades
                    if (infoProducto) {
                        $("#detalleImagenProducto").attr("src", infoProducto.imagen);
                        $("#detalleDescripcionProducto").text(infoProducto.descripcion);
                        $("#detalleCodigoProducto").text(infoProducto.codigo);
                        $("#detalleIdCategoriaProducto").text(infoProducto.id_categoria);
                        $("#detalleStockProducto").text(infoProducto.stock);
                        $("#detallePrecioCompraProducto").text(infoProducto.precio_compra);
                        $("#detallePrecioVentaProducto").text(infoProducto.precio_venta);
                        $("#detalleVentasProducto").text(infoProducto.ventas);
                    } else {
                        // Si no hay datos del producto, mostrar un mensaje de error y redirigir
                        Swal.fire({
                            type: "error",
                            title: "Producto no encontrado",
                            text: "No se pudieron cargar los detalles del producto.",
                            showConfirmButton: true,
                            confirmButtonText: "Cerrar"
                        }).then((result) => {
                            if (result.value) {
                                window.location = "productos";
                            }
                        });
                        return;
                    }
                    var tablaBody = $("#tablaMovimientosInventario");
                    tablaBody.empty();

                    if (movimientosInventario && movimientosInventario.length > 0) {
                        movimientosInventario.forEach(function(movimiento) {
                            var newRow = `
                                <tr>
                                    <td>${movimiento.fecha}</td>
                                    <td>${movimiento.cant_movimiento}</td>
                                    <td>${movimiento.tipo_movimiento}</td>
                                    <td>${movimiento.factura_or_boleta}</td>
                                    <td>${movimiento.observacion}</td>
                                    <td>
                                        <div class="btn-group">
                                                <button class="btn btn-warning btnEditarMovimiento" idMovimiento="${movimiento.id}" data-toggle="modal" data-target="#modalEditarMovimiento">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                                <button class="btn btn-danger btnEliminarMovimiento" idMovimiento="${movimiento.id}">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                        </div>
                                    </td>
                                </tr>
                            `;
                            tablaBody.append(newRow);
                        });
                    } else {
                        tablaBody.append(`<tr><td colspan="6" class="text-center">No hay movimientos de inventario registrados para este producto.</td></tr>`);
                    }

                } else {
                    Swal.fire({
                        type: "error",
                        title: "Error en los datos recibidos",
                        text: "El formato de la información del producto es incorrecto o faltan datos.",
                        showConfirmButton: true,
                        confirmButtonText: "Cerrar"
                    }).then((result) => {
                        if (result.value) {
                            window.location = "productos";
                        }
                    });
                }
                


            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error("Error en la petición AJAX:", textStatus, errorThrown);
            }
        });

    } else {
        console.warn("No se encontró idProducto en localStorage. Redirigiendo a productos.");
    }
});