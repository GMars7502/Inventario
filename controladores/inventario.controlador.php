<?php

class ControladorInventario{



    /*=============================================
	MOSTRAR PRODUCTO
	=============================================*/

	static public function ctrMostrarProductos($item, $valor, $orden){

		$tabla = "productos";

		$respuesta = ModeloInventario::mdlMostrarProductos($tabla, $item, $valor, $orden);

		return $respuesta;

	}



	/*=============================================
	MOSTRAR inventario
	=============================================*/
	static public function ctrMostrarMovimientosInventario($idProducto){
        $respuesta = ModeloInventario::mdlMostrarMovimientosInventario($idProducto);
        return $respuesta;
    }





	/*=============================================
	BORRAR Inventario or movimiento
	=============================================*/
	static public function ctrEliminarInventario(){

		if(isset($_GET["idProducto"])){

			$tabla ="productos";
			$datos = $_GET["idProducto"];

			if($_GET["imagen"] != "" && $_GET["imagen"] != "vistas/img/productos/default/anonymous.png"){

				unlink($_GET["imagen"]);
				rmdir('vistas/img/productos/'.$_GET["codigo"]);

			}

			$respuesta = ModeloProductos::mdlEliminarProducto($tabla, $datos);

			if($respuesta == "ok"){

				echo'<script>

				swal({
					  type: "success",
					  title: "El producto ha sido borrado correctamente",
					  showConfirmButton: true,
					  confirmButtonText: "Cerrar"
					  }).then(function(result){
								if (result.value) {

								window.location = "productos";

								}
							})

				</script>';

			}		
		}


	}




}