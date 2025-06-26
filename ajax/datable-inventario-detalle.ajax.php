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

}


/*=============================================
MOSTRAR PRODUCTO
=============================================*/ 

if(isset($_POST["idProducto"])){

  $editarProducto = new AjaxInventario();
  $editarProducto -> idProducto = $_POST["idProducto"];
  $editarProducto -> ajaxEditarProducto();

}






