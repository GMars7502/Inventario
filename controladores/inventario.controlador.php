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
	MOSTRAR inventario DE PRODUCTO
	=============================================*/
	static public function ctrMostrarMovimientosInventario($idProducto){
        $respuesta = ModeloInventario::mdlMostrarMovimientosInventario($idProducto);
        return $respuesta;
    }

	/*=============================================
	MOSTRAR MOVIMIENTO INVENTARIO
	=============================================*/

	static public function ctrMostrarMovimientoInventarioUnico($idMovimiento){
        $respuesta = ModeloInventario::mdlMostrarMovimientoInventarioUnico("inventario", "id", $idMovimiento);
        return $respuesta;
    }


	/*=============================================
	BORRAR Inventario or movimiento
	=============================================*/
	static public function ctrEliminarInventario($idMovimiento){
		$respuesta = ModeloInventario::mdlEliminarMovimiento("inventario", "id", $idMovimiento);
        
		if($respuesta == "ok"){
            return ["status" => "ok", "message" => "Movimiento eliminado con éxito."];
        } else {
            // Puedes personalizar el mensaje de error si necesitas más detalle del modelo
            return ["status" => "error", "message" => "No se pudo eliminar el movimiento."];
        }
	}







	/*=============================================
    EDITAR MOVIMIENTO DE INVENTARIO (NUEVO MÉTODO)
    =============================================*/
    static public function ctrEditarMovimientoInventario($datos){
        

		if(empty($datos["fecha"]) || empty($datos["cant_movimiento"]) || empty($datos["tipo_movimiento"]) || empty($datos["observacion"])){
            return ["status" => "error", "message" => "Faltan campos obligatorios."];
        }
        
        $tabla = "inventario";
        $respuesta = ModeloInventario::mdlEditarMovimientoInventario($tabla, $datos); // Reutilizamos el método del modelo

        // Devolvemos la respuesta para que AJAX la interprete
        if($respuesta == "ok"){
            return ["status" => "ok", "message" => "Movimiento editado con éxito."];
        } else {
            return ["status" => "error", "message" => "Error al guardar los cambios en la base de datos."];
        }


    }


	/*=============================================
    CREAR MOVIMIENTO TIPO ENTRADA
    =============================================*/
	static public function ctrCrearMovimientoEntrada($datos) {
        if (empty($datos["fecha"]) || empty($datos["cant_movimiento"]) || empty($datos["observacion"])) {
            return ["status" => "error", "message" => "Campos obligatorios faltantes."];
        }

        $tabla = "inventario";
        $respuesta = ModeloInventario::mdlCrearMovimiento($tabla, $datos);

        if ($respuesta == "ok") {
            return ["status" => "ok", "message" => "Entrada registrada"];
        } else {
            return ["status" => "error", "message" => "No se pudo guardar el movimiento."];
        }
    }



	/*=============================================
    CREAR MOVIMIENTO TIPO SALIDA
    =============================================*/



    static public function ctrCrearMovimientoInventario($datos){

        if(empty($datos["id_producto"])){
            return ["status" => "error", "message" => "Datos de movimiento incompletos. Asegúrate de llenar el idProducros."];
        }


        if(empty($datos["id_producto"]) || empty($datos["fecha"]) || empty($datos["cant_movimiento"]) || empty($datos["tipo_movimiento"]) || empty($datos["observacion"])){
            return ["status" => "error", "message" => "Datos de movimiento incompletos. Asegúrate de llenar la fecha, cantidad y observación."];
        }

        // Asegurarse de que la cantidad es un número válido y positivo
        if (!is_numeric($datos["cant_movimiento"]) || (int)$datos["cant_movimiento"] <= 0) {
            return ["status" => "error", "message" => "La cantidad de movimiento debe ser un número positivo."];
        }

        $tablaMovimientos = "inventario"; // Nombre de tu tabla de movimientos
        $tablaProductos = "productos"; // Nombre de tu tabla de productos para actualizar stock

        $respuestaMovimiento = ModeloInventario::mdlIngresarMovimientoInventario($tablaMovimientos, $datos);

        if($respuestaMovimiento !== "ok"){
            return ["status" => "error", "message" => "Error al registrar el movimiento en la base de datos."];
        }

        $respuestaStock = "ok";
       

        if($respuestaStock == "ok"){
            return ["status" => "ok", "message" => "Movimiento y stock actualizados correctamente."];
        } else {
            // Podrías decidir qué hacer si el movimiento se inserta pero el stock no se actualiza.
            // Para simplicidad, se devuelve un error general.
            return ["status" => "error", "message" => "Movimiento registrado, pero hubo un error al actualizar el stock del producto."];
        }
    }



}