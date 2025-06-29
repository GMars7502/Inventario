
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
                        swal({
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
                    
                    // Inicializar DataTable con los datos de movimientos
                    $('#tablaInventario').DataTable({
                        destroy: true, // por si ya estaba inicializado
                        data: movimientosInventario,
                        columns: [
                            { data: 'fecha' },
                            { data: 'cant_movimiento' },
                            { data: 'tipo_movimiento' },
                            { data: 'factura_or_boleta' },
                            { data: 'observacion' },
                            {
                                data: 'id',
                                render: function(data, type, row) {
                                    return `
                                        <div class="btn-group">
                                            <button class="btn btn-warning btnEditarMovimiento" idMovimiento="${data}" data-toggle="modal" data-target="#modalEditarMovimiento">
                                                <i class="fa fa-pencil"></i>
                                            </button>
                                            <button class="btn btn-danger btnEliminarMovimiento" idMovimiento="${data}">
                                                <i class="fa fa-times"></i>
                                            </button>
                                        </div>`;
                                }
                            }
                        ]
                    });

                } else {
                    swal({
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

    //#region eliminar movimiento

    $(document).on("click", "button.btnEliminarMovimiento", function(){

	    var idMovimientoEliminacion = $(this).attr("idMovimiento");
	
        swal({

            title: '¿Está seguro de borrar el movimiento?',
            text: "¡Si no lo está puede cancelar la accíón!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Cancelar',
            confirmButtonText: 'Si, borrar movimiento!'
            }).then(function(result) {
            if (result.value) {

                console.log("Se elimino movimiento", idMovimientoEliminacion);

                var datos = new FormData();

                datos.append("idEliminarMovimiento", idMovimientoEliminacion);

                $.ajax({
                    url:"ajax/datable-inventario-detalle.ajax.php",
                    method: "POST",
                    data: datos,
                    cache: false,
                    contentType: false,
                    processData: false,
                    dataType:"json",
                    success:function(respuesta){
                    
                    if(respuesta.status === "ok"){
                        swal({
                            type: "success",
                            title: "¡El movimiento ha sido eliminado correctamente!",
                            showConfirmButton: true,
                            confirmButtonText: "Cerrar"
                        }).then((result) => {
                            if (result.value) {
                                
                                window.location.reload(); // Recarga completa para simplicidad
                            }
                        });
                    } else {
                        swal({
                            type: "error",
                            title: "Error al eliminar movimiento",
                            text: respuesta.message || "No se pudo eliminar el movimiento. Inténtalo de nuevo.",
                            showConfirmButton: true,
                            confirmButtonText: "Cerrar"
                        });
                    }
                    

                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error("Error en la petición AJAX:", textStatus, errorThrown);
                }
            });



        }


	})

})
	

    //#region Editar Movimiento


 $(document).on("click", ".btnEditarMovimiento", function(){
        var idMovimiento = $(this).attr("idMovimiento");
        console.log("Clic en Editar Movimiento ID:", idMovimiento);

        var datosMovimiento = new FormData();
        datosMovimiento.append("idMovimiento", idMovimiento);

        $.ajax({
            url:"ajax/datable-inventario-detalle.ajax.php",
            method: "POST",
            data: datosMovimiento,
            cache: false,
            contentType: false,
            processData: false,
            dataType:"json",
            success:function(respuestaMovimiento){
                console.log("Datos del movimiento para editar:", respuestaMovimiento);

                // Verificar si se obtuvo una respuesta válida del movimiento
                if(respuestaMovimiento){
                    // Rellenar los campos del modal de edición con los datos recibidos
                    $("#modalEditarMovimiento #fecha").val(respuestaMovimiento.fecha);
                    $("#modalEditarMovimiento #idVenta").val(respuestaMovimiento.idVenta);
                    $("#modalEditarMovimiento #cantidadMovimiento").val(respuestaMovimiento.cant_movimiento);
                    $("#modalEditarMovimiento #tipoMovimiento").val(respuestaMovimiento.tipo_movimiento);
                    $("#modalEditarMovimiento #facturacion").val(respuestaMovimiento.factura_or_boleta);
                    $("#modalEditarMovimiento #observacion").val(respuestaMovimiento.observacion);
                    
                
                     $("#modalEditarMovimiento #idMovimientoEditar").val(respuestaMovimiento.id);

                     $('#modalEditarMovimiento').modal('show');
                } else {
                    swal({
                        type: "error",
                        title: "Error al cargar movimiento",
                        text: "No se pudieron obtener los datos del movimiento.",
                        showConfirmButton: true,
                        confirmButtonText: "Cerrar"
                    });
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error("Error al cargar datos de movimiento para editar:", textStatus, errorThrown);
                swal({
                    type: "error",
                    title: "Error de conexión",
                    text: "Hubo un problema al intentar cargar los datos del movimiento.",
                    showConfirmButton: true,
                    confirmButtonText: "Cerrar"
                });
            }
        });
    });

    
    /*=============================================
    GUARDAR CAMBIOS DEL MOVIMIENTO EDITADO
    =============================================*/
    $("#modalEditarMovimiento form").on("submit", function(e){
        e.preventDefault();

        var idMovimientoEditar = $("#modalEditarMovimiento #idMovimientoEditar").val();
        var idVenta = $("#modalEditarMovimiento #idVenta").val();
        var fecha = $("#modalEditarMovimiento #fecha").val();
        var tipoMovimiento = $("#modalEditarMovimiento #tipoMovimiento").val();
        var cantidadMovimiento = $("#modalEditarMovimiento #cantidadMovimiento").val();
        var facturacion = $("#modalEditarMovimiento #facturacion").val();
        var observacion = $("#modalEditarMovimiento #observacion").val();
        var id_producto = localStorage.getItem("idProductoDetalle");


        if(tipoMovimiento === ""){ swal({
                type: "error",
                title: "ERROR SIS",
                text: "TIPO DE MOVIMIENTO NO RECONOCIDO.",
                showConfirmButton: true,
                confirmButtonText: "Cerrar"
            });
            return; }

        if(tipoMovimiento === "entrada"){

            if(fecha === "" || cantidadMovimiento === "" || facturacion === "" || observacion === "" || id_producto === ""
            ){
                swal({
                    type: "error",
                    title: "Campos vacíos",
                    text: "Por favor, complete todos los campos obligatorios para editar el movimiento.",
                    showConfirmButton: true,
                    confirmButtonText: "Cerrar"
                });
                return; // Detener la ejecución si hay campos vacíos
            }

        }else if(tipoMovimiento === "salida"){

                 // Validaciones básicas antes de enviar
            if(fecha === ""  || cantidadMovimiento === ""  || observacion === "" || id_producto === ""){
                swal({
                    type: "error",
                    title: "Campos vacíos",
                    text: "Por favor, complete todos los campos obligatorios para editar el movimiento.",
                    showConfirmButton: true,
                    confirmButtonText: "Cerrar"
                });
                return; // Detener la ejecución si hay campos vacíos
            }

        }

        

        var datos = new FormData();
        datos.append("idMovimientoEditarAjax", idMovimientoEditar); // Usaremos un nombre diferente para diferenciar en PHP
        datos.append("idVenta",idVenta);
        datos.append("fechaEditar", fecha);
        datos.append("tipoMovimientoEditar", tipoMovimiento);
        datos.append("cantidadMovimientoEditar", cantidadMovimiento);
        datos.append("facturacionEditar", facturacion);
        datos.append("observacionEditar", observacion);
        datos.append("id_producto",id_producto);

        console.log("Datos a enviar para editar movimiento:", idMovimientoEditar, fecha, tipoMovimiento, cantidadMovimiento, facturacion, observacion, id_producto);

        console.log("el valor de idProducto es",id_producto);

        $.ajax({
            url: "ajax/datable-inventario-detalle.ajax.php", // Apunta al mismo archivo AJAX que usamos para crear
            method: "POST",
            data: datos,
            cache: false,
            contentType: false,
            processData: false,
            dataType: "json", // Esperamos una respuesta JSON de vuelta
            success: function(respuesta){
                console.log("Respuesta del servidor al editar movimiento:", respuesta);

                if(respuesta.status === "ok"){
                        swal({
                            type: "success",
                            title: "¡El movimiento ha sido actualizado correctamente!",
                            showConfirmButton: true,
                            confirmButtonText: "Cerrar"
                        }).then((result) => {
                            if (result.value) {
                                $('#modalEditarMovimiento').modal('hide'); 

                                
                                window.location.reload(); // Recarga completa para simplicidad
                            }
                        });
                    } else {
                        swal({
                            type: "error",
                            title: "Error al actualizar movimiento",
                            text: respuesta.message || "No se pudo actualizar el movimiento. Consulte con su Inge.",
                            showConfirmButton: true,
                            confirmButtonText: "Cerrar"
                        });
                    }
            },
            error: function(jqXHR, textStatus, errorThrown){
                console.error("Error en la petición AJAX al editar movimiento:", textStatus, errorThrown, jqXHR.responseText);
                swal({
                    type: "error",
                    title: "Error de conexión",
                    text: "Hubo un problema al conectar con el servidor. Por favor, inténtalo de nuevo.",
                    showConfirmButton: true,
                    confirmButtonText: "Cerrar"
                });
            }
        });
    });



    //#region Crear Movimiento


    /*=============================================
    ABRIR MODAL CREAR MOVIMIENTO Y ASIGNAR ID PRODUCTO
    =============================================*/
    $(document).on("click", ".btnAgregarMovimiento", function(){

        
        var idProductoParaMovimiento = $(this).attr("idProducto");

        console.log("idproducto del metodo ia",idProductoParaMovimiento);
        console.log("idproducto del local host",idProducto);


        $("#modalCrearMovimiento #idProductoMovimiento").val(idProductoParaMovimiento);
        console.log("Preparando para agregar movimiento al Producto ID:", idProductoParaMovimiento);

        // Limpiar formularios y restablecer a la pestaña activa por defecto (Salidas)
        $("#formCrearMovimiento")[0].reset(); // Limpia todo el formulario del modal
        
        // Re-establecer la fecha actual para ambos tabs
        var today = new Date().toISOString().slice(0,10);
        $("#modalCrearMovimiento #fechaSalida").val(today);
        $("#modalCrearMovimiento #fechaEntrada").val(today);

        // Asegúrate de que la pestaña "Salidas" esté activa por defecto
        $('ul.nav-tabs a[href="#tabSalida"]').tab('show');
    });

    /*=============================================
    MANEJAR ENVÍO DEL FORMULARIO DE CREACIÓN DE MOVIMIENTOS
    =============================================*/
    $("#formCrearMovimiento").on("submit", function(e){
        e.preventDefault(); // Evitar el envío de formulario por defecto

        var idProducto = localStorage.getItem("idProductoDetalle");
        var datosMovimiento = new FormData();
        datosMovimiento.append("idProductoMovimiento", idProducto);

        // Determinar qué pestaña está activa y recolectar los datos
        var activeTab = $('ul.nav-tabs li.active a').attr('href');
        console.log("Pestaña activa al guardar:", activeTab);

        // Recolectar campos comunes
        var fecha, cantidad, observacion, facturaBoleta, proveedor;
        var tipoMovimiento;

        if (activeTab === "#tabSalida") {
            // Datos de la pestaña de Salida
            fecha = $("#modalCrearMovimiento #fechaSalida").val();
            cantidad = $("#modalCrearMovimiento #cantidadSalida").val();
            observacion = $("#modalCrearMovimiento #observacionSalida").val();
            facturaBoleta = ""; // No hay campo para factura/boleta en Salida en tu HTML
            proveedor = ""; // No hay campo para proveedor en Salida en tu HTML
            tipoMovimiento = "salida";

            // Validaciones específicas de Salida
            if (fecha === "" || cantidad === "" || observacion === "" || parseInt(cantidad) <= 0) {
                swal({
                    icon: "error",
                    title: "Campos Incompletos/Inválidos",
                    text: "Para registrar una salida, por favor completa la fecha, cantidad (mayor a cero) y observación.",
                    showConfirmButton: true,
                    confirmButtonText: "Cerrar"
                });
                return;
            }

        } else if (activeTab === "#tabEntrada") {
            // Datos de la pestaña de Entrada
            fecha = $("#modalCrearMovimiento #fechaEntrada").val();
            cantidad = $("#modalCrearMovimiento #cantidadEntrada").val();
            facturaBoleta = $("#modalCrearMovimiento #facturaBoletaEntrada").val();
            observacion = $("#modalCrearMovimiento #observacionEntrada").val();
            proveedor = $("#modalCrearMovimiento #proveedorEntrada").val();
            tipoMovimiento = "entrada";

            // Validaciones específicas de Entrada
            if (fecha === "" || cantidad === "" || observacion === "" || parseInt(cantidad) <= 0) {
                 swal({
                    icon: "error",
                    title: "Campos Incompletos/Inválidos",
                    text: "Para registrar una entrada, por favor completa la fecha, cantidad (mayor a cero) y observación.",
                    showConfirmButton: true,
                    confirmButtonText: "Cerrar"
                });
                return;
            }

        } else {
            // Esto no debería pasar si hay pestañas activas
            swal({
                icon: "error",
                title: "Error de Pestaña",
                text: "No se pudo determinar el tipo de movimiento. Por favor, selecciona una pestaña.",
                showConfirmButton: true,
                confirmButtonText: "Cerrar"
            });
            return;
        }

        // Añadir todos los datos al FormData
        datosMovimiento.append("fechaMovimiento", fecha);
        datosMovimiento.append("cantidadMovimiento", cantidad);
        datosMovimiento.append("tipoMovimiento", tipoMovimiento);
        datosMovimiento.append("facturaBoletaMovimiento", facturaBoleta);
        datosMovimiento.append("observacionMovimiento", observacion);
        datosMovimiento.append("proveedorMovimiento", proveedor); // Puede ser vacío para salidas

        // Esta variable le dice al PHP que queremos crear un movimiento
        datosMovimiento.append("accionCrearMovimiento", "true"); 

        console.log("Datos a enviar para crear movimiento:", Object.fromEntries(datosMovimiento.entries()));

        // Petición AJAX
        $.ajax({
            url: "ajax/datable-inventario-detalle.ajax.php", // Apunta a tu archivo AJAX centralizado
            method: "POST",
            data: datosMovimiento,
            cache: false,
            contentType: false,
            processData: false,
            dataType: "json", // Esperamos una respuesta JSON del servidor
            success: function(respuesta){
                console.log("Respuesta del servidor al crear movimiento:", respuesta);


                if(respuesta.status === "ok"){
                        swal({
                            type: "success",
                            title: "¡El movimiento ha sido creado correctamente!",
                            showConfirmButton: true,
                            confirmButtonText: "Cerrar"
                        }).then((result) => {
                            if (result.value) {
                                $('#modalCrearMovimiento').modal('hide');
                                window.location.reload(); // Recarga completa para simplicidad
                            }
                        });
                    } else {
                        swal({
                            type: "error",
                            title: "Error al crear el movimiento",
                            text: respuesta.message || "No se pudo crear el movimiento. consulte con su INGE.",
                            showConfirmButton: true,
                            confirmButtonText: "Cerrar"
                        });
                    }
            },
            error: function(jqXHR, textStatus, errorThrown){
                console.error("Error en la petición AJAX al crear movimiento:", textStatus, errorThrown, jqXHR.responseText);
                swal({
                    icon: "error",
                    title: "Error de conexión",
                    text: "Hubo un problema al conectar con el servidor. Por favor, inténtalo de nuevo.",
                    showConfirmButton: true,
                    confirmButtonText: "Cerrar"
                });
            }
        });
    });

    





});