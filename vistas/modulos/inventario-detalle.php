<?php

    if($_SESSION["perfil"] == "Vendedor"){

    echo '<script>

        window.location = "inicio";

    </script>';

    return;

    }
?>


<div class="content-wrapper">

    <section class="content-header">
    
        <h1>
        
            Gestión Inventario - Kardex
        
        </h1>


        <ol class="breadcrumb">
        
            <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>

            <li><a href="inventario"><i class="fa fa-dashboard"></i> Inventario</a></li>
            
            <li class="active">Kardex</li>
            
        </ol>
        
    
    </section>


    <section class="content">

        <div class="box">
            
            <div class="box-header with-border">
                <h3 class="box-title">Detalles del Producto</h3>
            </div>

            <div class="box-body">
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4 text-center">
                                <img id="detalleImagenProducto" src="vistas/img/productos/default/anonymous.png" class="img-fluid rounded" alt="Imagen del Producto" style="max-width: 200px; border: 1px solid #ddd; padding: 5px;">
                            </div>
                            <div class="col-md-8">
                                <h4 class="card-title" id="detalleDescripcionProducto">Nombre del Producto</h4>
                                <p class="card-text"><strong>Código:</strong> <span id="detalleCodigoProducto">Cargando...</span></p>
                                <p class="card-text"><strong>Categoría ID:</strong> <span id="detalleIdCategoriaProducto">Cargando...</span></p>
                                <p class="card-text"><strong>Stock Actual:</strong> <span id="detalleStockProducto">Cargando...</span></p>
                                <p class="card-text"><strong>Precio Compra:</strong> <span id="detallePrecioCompraProducto">Cargando...</span></p>
                                <p class="card-text"><strong>Precio Venta:</strong> <span id="detallePrecioVentaProducto">Cargando...</span></p>
                                <p class="card-text"><strong>Ventas Acumuladas:</strong> <span id="detalleVentasProducto">Cargando...</span></p>
                            </div>
                        </div>
                    </div>
                </div>

                <hr>

                <div class="box-header with-border">
                    <button class="btn btn-primary pull-right" data-toggle="modal" data-target="#modalCrearMovimiento">
                        <i class="fa fa-plus"></i> Agregar Nuevo Movimiento
                    </button>
                </div>

                <div class="box-header with-border">
                    <h3 class="box-title">Historial de Movimientos de Inventario</h3>
                </div>

                <div class="table-responsive">
                    <table id="tablaInventario" class="table table-bordered table-striped dt-responsive tablas" width="100%">
                        <thead>
                            <tr>
                                <th>Fecha</th>
                                <th>Cantidad</th>
                                <th>Tipo</th>
                                <th>Factura/Boleta</th>
                                <th>Observación</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                    </table>
                </div>

            </div>
            </div>

    </section>





          <?php
              #region Modal EDITAR  
          ?>



<div id="modalEditarMovimiento" class="modal fade" role="dialog">
  
  <div class="modal-dialog">

    <div class="modal-content">

      <form role="form" method="post" enctype="multipart/form-data">

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:#3c8dbc; color:white">

          <button type="button" class="close" data-dismiss="modal">&times;</button>

          <h4 class="modal-title">Editar Movimiento</h4>

        </div>

        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

        <div class="modal-body">

          <div class="box-body">

            <input type="hidden" id="idMovimientoEditar" name="idMovimientoEditar">


            <!-- ENTRADA PARA SELECCIONAR FECHA -->

            <div class="form-group">
              Fecha
              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
                <input type="date" class="form-control input-lg" name="fecha" id="fecha" required>
              </div>
            </div>

            <!-- ENTRADA PARA TIPO DE MOVIMIENTO -->
            
            <div class="form-group">
              <label>Tipo de movimiento</label>

              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-code"></i></span>

                <select class="form-control input-lg" id="tipoMovimiento" name="tipoMovimiento" required disabled>
                  <option value="">Seleccione tipo</option>
                  <option value="entrada">Entrada</option>
                  <option value="salida">Salida</option>
                </select>
              </div>

            </div>

             <!-- ENTRADA CANTIDAD DE MOVIMIENTO -->

             <div class="form-group">

                <div class="input-group">
                  
                  <input type="hidden" class="form-control input-lg" 
                        id="idVenta" name="idVenta" 
                        maxlength="50">
                </div>
              </div>


            <!-- ENTRADA CANTIDAD DE MOVIMIENTO -->

             <div class="form-group">
                <label for="cantidadMovimiento">Cantidad de movimiento</label>

                <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-product-hunt"></i></span> 

                  <input type="number" class="form-control input-lg" 
                        id="cantidadMovimiento" name="cantidadMovimiento" 
                        min="1" step="1" required>
                </div>
              </div>

             <!-- ENTRADA PARA FACTURACION -->

             <div class="form-group">
                <label for="facturacion">Facturación</label>

                <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-check"></i></span> 

                  <input type="text" class="form-control input-lg" 
                        id="facturacion" name="facturacion" 
                        maxlength="50">
                </div>
              </div>

             <!-- ENTRADA PARA OBSERVACION -->

             <div class="form-group"> 
                <label for="observacion">Observación</label>

                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-arrow-up"></i></span> 

                    <input type="text" class="form-control input-lg" 
                          id="observacion" name="observacion" 
                          maxlength="50" required>
                  </div>
              </div>

            
          </div>

        </div>

        <!--=====================================
        PIE DEL MODAL
        ======================================-->

        <div class="modal-footer">

          <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

          <button type="submit" class="btn btn-primary">Guardar cambios</button>

        </div>

      </form>


    </div>

    </div>

    </div>

            <?php
        #region Modal CREAR 
    ?>

<div id="modalCrearMovimiento" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <form role="form" method="post" enctype="multipart/form-data" id="formCrearMovimiento">

                <div class="modal-header" style="background:#3c8dbc; color:white">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Crear Nuevo Movimiento de Inventario</h4>
                </div>

                <div class="modal-body">
                    <div class="box-body">

                        <input type="hidden" id="idProductoMovimiento" name="idProductoMovimiento">

                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#tabSalida">Salidas</a></li>
                            <li><a data-toggle="tab" href="#tabEntrada">Entradas</a></li>
                        </ul>

                        <div class="tab-content">

                            <div id="tabSalida" class="tab-pane fade in active">
                                <h5 class="text-center">Registrar una salida</h5>
                                <hr>

                                <div class="form-group">
                                    <label for="fechaSalida">Fecha:</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input type="date" class="form-control input-lg" name="fechaSalida" id="fechaSalida" data-requerido="true">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="cantidadSalida">Cantidad Salida:</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-minus"></i></span>
                                        <input type="number" class="form-control input-lg" name="cantidadSalida" id="cantidadSalida" min="1" step="1" data-requerido="true">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="observacionSalida">Observación:</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-comment"></i></span>
                                        <input type="text" class="form-control input-lg" name="observacionSalida" id="observacionSalida" maxlength="255" data-requerido="true">
                                    </div>
                                </div>

                            </div>

                            <div id="tabEntrada" class="tab-pane fade">
                                <h5 class="text-center">Registrar una entrada</h5>
                                <hr>
                                <div class="form-group">
                                    <label for="fechaEntrada">Fecha:</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
                                        <input type="date" class="form-control input-lg" name="fechaEntrada" id="fechaEntrada" data-requerido="true">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="cantidadEntrada">Cantidad Entrada:</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-sort-numeric-asc"></i></span> 
                                        <input type="number" class="form-control input-lg" 
                                               id="cantidadEntrada" name="cantidadEntrada" min="1" step="1" data-requerido="true">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="facturaBoletaEntrada">Factura/Boleta:</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-file-text"></i></span> 
                                        <input type="text" class="form-control input-lg" 
                                               id="facturaBoletaEntrada" name="facturaBoletaEntrada" maxlength="50">
                                    </div>
                                </div>

                                <div class="form-group"> 
                                    <label for="observacionEntrada">Observación:</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-comment"></i></span> 
                                        <input type="text" class="form-control input-lg" 
                                               id="observacionEntrada" name="observacionEntrada" maxlength="255" data-requerido="true">
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>
                    <button type="submit" class="btn btn-primary" id="btnGuardarMovimiento">Guardar Movimiento</button>
                </div>

            </form>

        </div>
    </div>
    </div>
</div>