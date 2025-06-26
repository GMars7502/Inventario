<?php

require_once "conexion.php";



class ModeloInventario{

    /*=============================================
	MOSTRAR PRODUCTOS
	=============================================*/

	static public function mdlMostrarProductos($tabla, $item, $valor, $orden){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item ORDER BY id DESC");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla ORDER BY $orden DESC");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}

		$stmt -> close();

		$stmt = null;

	}

	/*=============================================
    MOSTRAR MOVIMIENTOS DE INVENTARIO
    =============================================*/
    static public function mdlMostrarMovimientosInventario($idProducto){

        $stmt = Conexion::conectar()->prepare("SELECT * FROM inventario WHERE idProducto = :idProducto ORDER BY fecha DESC");

        $stmt -> bindParam(":idProducto", $idProducto, PDO::PARAM_INT);

        $stmt -> execute();

        return $stmt -> fetchAll();

        $stmt -> close();
        $stmt = null;
    }

}