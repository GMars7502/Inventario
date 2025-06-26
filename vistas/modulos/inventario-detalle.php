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
                    <table class="table table-bordered table-striped dt-responsive tablas" width="100%">
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
                        <tbody id="tablaMovimientosInventario">
                            <tr>
                                <td colspan="6" class="text-center">Cargando movimientos...</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>
            </div>

    </section>








<div id="modalEditarProducto" class="modal fade" role="dialog">
  
  <div class="modal-dialog">

    <div class="modal-content">

      <form role="form" method="post" enctype="multipart/form-data">

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:#3c8dbc; color:white">

          <button type="button" class="close" data-dismiss="modal">&times;</button>

          <h4 class="modal-title">Editar producto</h4>

        </div>

        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

        <div class="modal-body">

          <div class="box-body">


            <!-- ENTRADA PARA SELECCIONAR CATEGORÍA -->

            <div class="form-group">
              
              <div class="input-group">
              
                <span class="input-group-addon"><i class="fa fa-th"></i></span> 

                <select class="form-control input-lg"  name="editarCategoria" readonly required>
                  
                  <option id="editarCategoria"></option>

                </select>

              </div>

            </div>

            <!-- ENTRADA PARA EL CÓDIGO -->
            
            <div class="form-group">
              
              <div class="input-group">
              
                <span class="input-group-addon"><i class="fa fa-code"></i></span> 

                <input type="text" class="form-control input-lg" id="editarCodigo" name="editarCodigo" readonly required>

              </div>

            </div>

            <!-- ENTRADA PARA LA DESCRIPCIÓN -->

             <div class="form-group">
              
              <div class="input-group">
              
                <span class="input-group-addon"><i class="fa fa-product-hunt"></i></span> 

                <input type="text" class="form-control input-lg" id="editarDescripcion" name="editarDescripcion" required>

              </div>

            </div>

             <!-- ENTRADA PARA STOCK -->

             <div class="form-group">
              
              <div class="input-group">
              
                <span class="input-group-addon"><i class="fa fa-check"></i></span> 

                <input type="number" class="form-control input-lg" id="editarStock" name="editarStock" min="0" required>

              </div>

            </div>

             <!-- ENTRADA PARA PRECIO COMPRA -->

             <div class="form-group row">

                <div class="col-xs-6">
                
                  <div class="input-group">
                  
                    <span class="input-group-addon"><i class="fa fa-arrow-up"></i></span> 

                    <input type="number" class="form-control input-lg" id="editarPrecioCompra" name="editarPrecioCompra" step="any" min="0" required>

                  </div>

                </div>

                <!-- ENTRADA PARA PRECIO VENTA -->

                <div class="col-xs-6">
                
                  <div class="input-group">
                  
                    <span class="input-group-addon"><i class="fa fa-arrow-down"></i></span> 

                    <input type="number" class="form-control input-lg" id="editarPrecioVenta" name="editarPrecioVenta" step="any" min="0" readonly required>

                  </div>
                
                  <br>

                  <!-- CHECKBOX PARA PORCENTAJE -->

                  <div class="col-xs-6">
                    
                    <div class="form-group">
                      
                      <label>
                        
                        <input type="checkbox" class="minimal porcentaje" checked>
                        Utilizar procentaje
                      </label>

                    </div>

                  </div>

                  <!-- ENTRADA PARA PORCENTAJE -->

                  <div class="col-xs-6" style="padding:0">
                    
                    <div class="input-group">
                      
                      <input type="number" class="form-control input-lg nuevoPorcentaje" min="0" value="40" required>

                      <span class="input-group-addon"><i class="fa fa-percent"></i></span>

                    </div>

                  </div>

                </div>

            </div>

            <!-- ENTRADA PARA SUBIR FOTO -->

             <div class="form-group">
              
              <div class="panel">SUBIR IMAGEN</div>

              <input type="file" class="nuevaImagen" name="editarImagen">

              <p class="help-block">Peso máximo de la imagen 2MB</p>

              <img src="vistas/img/productos/default/anonymous.png" class="img-thumbnail previsualizar" width="100px">

              <input type="hidden" name="imagenActual" id="imagenActual">

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

        <?php

          $editarProducto = new ControladorProductos();
          $editarProducto -> ctrEditarProducto();

        ?>      

    </div>

  </div>

</div>

</div>