<?php

require_once "../controladores/inventario.controlador.php";
require_once "../modelos/inventario.modelo.php";

class AjaxInventario{



  /*=============================================
  MOSTRAR PRODUCTO
  =============================================*/ 

  public $idProducto;
  public $traerProductos;
  public $nombreProducto;
  public $idMovimiento;

  public function ajaxEditarProducto(){

    if($this->traerProductos == "ok"){

      


    }else if($this->nombreProducto != ""){

      
    }else{

      $item = "id";
      $valor = $this->idProducto;
      $orden = "id";

      $respuestaProducto = ControladorInventario::ctrMostrarProductos($item, $valor,
        $orden);

      $respuestaInventario = ControladorInventario::ctrMostrarMovimientosInventario($this->idProducto);


      $respuesta = [
        "producto" => $respuestaProducto,
        "inventario" => $respuestaInventario
      ];
      


      echo json_encode($respuesta);

    }

  }

  /*=============================================
  MOSTRAR MOVIMIENTO
  =============================================*/ 

  public function ajaxTraerMovimientoInventario(){
        if($this->idMovimiento != ""){
            $respuesta = ControladorInventario::ctrMostrarMovimientoInventarioUnico($this->idMovimiento);
            echo json_encode($respuesta);
        } else {
            echo json_encode(null);
        }
    }



    /*=============================================
    EDITAR MOVIMIENTO DE INVENTARIO 
    =============================================*/

    public $idMovimientoEditarAjax;
    public $fechaEditar;
    public $idVenta;
    public $tipoMovimientoEditar;
    public $cantidadMovimientoEditar;
    public $facturacionEditar;
    public $observacionEditar;
    public $idProductoEditar;

    
    public function ajaxEditarMovimientoInventario(){
        $datos = array(
            "id" => $this->idMovimientoEditarAjax,
            "idVenta" => !empty($this->idVenta)? $this->idVenta : null,
            "fecha" => $this->fechaEditar,
            "cant_movimiento" => $this->cantidadMovimientoEditar,
            "tipo_movimiento" => $this->tipoMovimientoEditar,
            "factura_or_boleta" => $this->facturacionEditar,
            "observacion" => $this->observacionEditar,
            "id_producto" => $this->idProductoEditar
        );

        $respuesta = ControladorInventario::ctrEditarMovimientoInventario($datos); // Un nuevo método en el controlador

        echo json_encode($respuesta); // Responder en JSON
    }

    /*=============================================
    ELIMINAR MOVIMIENTO DE INVENTARIO 
    =============================================*/

    public $idEliminarMovimiento;

    public function eliminarMovimientoInventario(){

      if($this->idEliminarMovimiento != ""){
            $respuesta = ControladorInventario::ctrEliminarInventario($this->idEliminarMovimiento);
            echo json_encode($respuesta);
        } else {
            echo json_encode(["status" => "error", "message" => "ID de movimiento no proporcionado."]);
        }



    }



    /*=============================================
    CREAR MOVIMIENTO 
    =============================================*/

    // NUEVAS PROPIEDADES PARA LA CREACIÓN DE MOVIMIENTOS
    public $idProductoMovimiento;
    public $fechaMovimiento;
    public $cantidadMovimiento;
    public $tipoMovimiento;
    public $facturaBoletaMovimiento;
    public $observacionMovimiento;
    public $proveedorMovimiento;
    public $accionCrearMovimiento; // Para diferenciar esta acción

    /*=============================================
    CREAR NUEVO MOVIMIENTO DE INVENTARIO (MÉTODO AJAX)
    =============================================*/
    public function ajaxCrearMovimientoInventario(){
        $datos = array(
            "id_producto"       => $this->idProductoMovimiento,
            "fecha"             => $this->fechaMovimiento,
            "cant_movimiento"   => $this->cantidadMovimiento,
            "tipo_movimiento"   => $this->tipoMovimiento,
            "factura_or_boleta" => $this->facturaBoletaMovimiento,
            "observacion"       => $this->observacionMovimiento,
            "proveedor"         => $this->proveedorMovimiento
        );

        $respuesta = ControladorInventario::ctrCrearMovimientoInventario($datos); // Llama al método del controlador

        echo json_encode($respuesta); // Responder en JSON
    }




  }



  

if(isset($_POST["idEliminarMovimiento"])){
    $eliminarMovimiento = new AjaxInventario();
    $eliminarMovimiento -> idEliminarMovimiento = $_POST["idEliminarMovimiento"];
    $eliminarMovimiento -> eliminarMovimientoInventario();
}


/*=============================================
MOSTRAR PRODUCTO
=============================================*/ 

if(isset($_POST["idProducto"])){

  $editarProducto = new AjaxInventario();
  $editarProducto -> idProducto = $_POST["idProducto"];
  $editarProducto -> ajaxEditarProducto();

}

/*=============================================
MOSTRAR MOVIMIENTO
=============================================*/
if(isset($_POST["idMovimiento"])){
    $traerMovimiento = new AjaxInventario();
    $traerMovimiento -> idMovimiento = $_POST["idMovimiento"];
    $traerMovimiento -> ajaxTraerMovimientoInventario();
}





/*=============================================
EDITAR MOVIMIENTO DE INVENTARIO (NUEVA INSTANCIA AJAX)
=============================================*/
if(isset($_POST["idMovimientoEditarAjax"])){ // Detectar si viene la petición de edición por AJAX
    $editarMovimiento = new AjaxInventario();
    $editarMovimiento -> idMovimientoEditarAjax = $_POST["idMovimientoEditarAjax"];
    $editarMovimiento -> idVenta = $_POST["idVenta"];
    $editarMovimiento -> fechaEditar = $_POST["fechaEditar"];
    $editarMovimiento -> tipoMovimientoEditar = $_POST["tipoMovimientoEditar"];
    $editarMovimiento -> cantidadMovimientoEditar = $_POST["cantidadMovimientoEditar"];
    $editarMovimiento -> facturacionEditar = $_POST["facturacionEditar"];
    $editarMovimiento -> observacionEditar = $_POST["observacionEditar"];
    $editarMovimiento -> idProductoEditar = $_POST["id_producto"];

    $editarMovimiento -> ajaxEditarMovimientoInventario();
}





if(isset($_POST["accionCrearMovimiento"]) && $_POST["accionCrearMovimiento"] === "true"){
    $crearMovimiento = new AjaxInventario();
    $crearMovimiento->idProductoMovimiento = $_POST["idProductoMovimiento"];
    $crearMovimiento->fechaMovimiento = $_POST["fechaMovimiento"];
    $crearMovimiento->cantidadMovimiento = $_POST["cantidadMovimiento"];
    $crearMovimiento->tipoMovimiento = $_POST["tipoMovimiento"];
    $crearMovimiento->facturaBoletaMovimiento = $_POST["facturaBoletaMovimiento"];
    $crearMovimiento->observacionMovimiento = $_POST["observacionMovimiento"];
    $crearMovimiento->proveedorMovimiento = $_POST["proveedorMovimiento"];

    $crearMovimiento->ajaxCrearMovimientoInventario();
}