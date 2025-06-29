<?php

require_once "conexion.php";



class ModeloInventario{

    /*=============================================
	MOSTRAR PRODUCTOS 
    #region mostrarProduct
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


	/*=============================================
    MOSTRAR MOVIMIENTO
    #region MostarMovi
    =============================================*/

	static public function mdlMostrarMovimientoInventarioUnico($tabla, $item, $valor){
        if($item != null){
            $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");
            $stmt -> bindParam(":".$item, $valor, PDO::PARAM_INT);
            $stmt -> execute();
            return $stmt -> fetch();
        } else {
            return null;
        }

        $stmt -> close();
        $stmt = null;
    }



    /*=============================================
    EDITAR MOVIMIENTO DE INVENTARIO
    #region EditarMovimiento
    =============================================*/
    static public function mdlEditarMovimientoInventario($tabla, $datos){
        $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET idVenta = :idVenta, fecha = :fecha, cant_movimiento = :cant_movimiento, tipo_movimiento = :tipo_movimiento, factura_or_boleta = :factura_or_boleta, observacion = :observacion, idProducto = :idProducto WHERE id = :id");

    
        $stmt->bindParam(":idVenta", $datos["idVenta"], PDO::PARAM_INT);
        $stmt->bindParam(":fecha", $datos["fecha"], PDO::PARAM_STR);
        $stmt->bindParam(":cant_movimiento", $datos["cant_movimiento"], PDO::PARAM_INT);
        $stmt->bindParam(":tipo_movimiento", $datos["tipo_movimiento"], PDO::PARAM_STR);
        $stmt->bindParam(":factura_or_boleta", $datos["factura_or_boleta"], PDO::PARAM_STR);
        $stmt->bindParam(":observacion", $datos["observacion"], PDO::PARAM_STR);
        $stmt->bindParam(":idProducto", $datos["id_producto"], PDO::PARAM_INT);
        $stmt->bindParam(":id", $datos["id"], PDO::PARAM_INT);

        $tipo = 'edit';
        self::mdlCambiodeStock($datos, $tipo);

        if($stmt->execute()){

            
            


            return "ok";
        }else{
            return "error";
        }

        $stmt->close();
        $stmt = null;
    }


    /*=============================================
    ELIMINAR MOVIMIENTO DE INVENTARIO
    #region EliminarMovi
    =============================================*/
    static public function mdlEliminarMovimiento($tabla, $item, $valor){
        if($item !== null && $valor !== null){
            try{
                $stmt = Conexion::conectar()->prepare("DELETE FROM $tabla WHERE $item = :$item");
                $stmt->bindParam(":".$item, $valor, PDO::PARAM_INT);



                $tipo = 'delete';
            
                self::mdlCambiodeStock($valor, $tipo);

                if($stmt->execute()){

                    


                    return "ok"; 
                } else {
                    return "error";
                }
            } catch (PDOException $e) {
                error_log("Error al eliminar movimiento en la tabla $tabla: " . $e->getMessage());
                return "error";
            } finally {
                if ($stmt) {
                    $stmt->closeCursor();
                    $stmt = null;
                }
            }
        } else {
            return "error: datos incompletos"; 
        }
    }



    /*=============================================
    CREAR MOVIMIENTO DE INVENTARIO
    #region CrearMovimi
    =============================================*/
    static public function mdlIngresarMovimientoInventario($tabla, $datos){
        try {
            

            $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(idProducto, fecha, cant_movimiento, tipo_movimiento, factura_or_boleta, observacion) VALUES (:id_producto, :fecha, :cant_movimiento, :tipo_movimiento, :factura_or_boleta, :observacion)");

            $stmt->bindParam(":id_producto", $datos["id_producto"], PDO::PARAM_INT);
            $stmt->bindParam(":fecha", $datos["fecha"], PDO::PARAM_STR);
            $stmt->bindParam(":cant_movimiento", $datos["cant_movimiento"], PDO::PARAM_INT);
            $stmt->bindParam(":tipo_movimiento", $datos["tipo_movimiento"], PDO::PARAM_STR);
            $stmt->bindParam(":factura_or_boleta", $datos["factura_or_boleta"], PDO::PARAM_STR); // Puede ser vacío
            $stmt->bindParam(":observacion", $datos["observacion"], PDO::PARAM_STR);

            if($stmt->execute()){

                $tipo = 'store';
            
                self::mdlCambiodeStock($datos, $tipo);




                return "ok";
            }else{
                return "error";
            }
        } catch (PDOException $e) {
            error_log("Error PDO al insertar movimiento en la tabla '$tabla': " . $e->getMessage());
            return "error";
        } finally {
            if ($stmt) {
                $stmt->closeCursor();
                $stmt = null;
            }
        }
    }


    /*=============================================
    CAMBIO STOCK CON SWITCH
    #region modifStock
    =============================================*/

    static public function mdlCambiodeStock($dato,$tipo)
    {
        try{
        switch ($tipo) {
            case 'store':

                $cant_movi= $dato["cant_movimiento"];
                $idProducto = $dato["id_producto"];
                $tipo_movi = $dato["tipo_movimiento"];

                $tabla = "productos"; $item = "id"; 
                $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item ORDER BY id DESC");
			    $stmt -> bindParam(":".$item, $idProducto, PDO::PARAM_STR);
			    
                if($stmt -> execute()){
                
                    $producto = $stmt->fetch(PDO::FETCH_ASSOC);

                    if (!$producto) {
                        return "error_producto_no_encontrado";
                    }

                    $stockActual = $producto["stock"];


                }else{
                    return "error";
                }
                
                if($tipo_movi == 'salida'){

                    $stockOperado = $stockActual - $cant_movi;

                    if($stockOperado < 0){
                        return "error";
                    }else{
                        $updateStmt = Conexion::conectar()->prepare("UPDATE $tabla SET stock = :stock WHERE id = :id");
                        $updateStmt->bindParam(":stock", $stockOperado, PDO::PARAM_INT);
                        $updateStmt->bindParam(":id", $idProducto, PDO::PARAM_INT);


                        
                        if($updateStmt->execute()){
                            return "ok";
                        }else{
                            return "error";
                        }
                        
                    }


                }
                if ($tipo_movi == 'entrada') {
                    $stockOperado = $stockActual + $cant_movi;

                    if($stockOperado < 0){
                        return "error";
                    }else{
                        $updateStmt = Conexion::conectar()->prepare("UPDATE $tabla SET stock = :stock WHERE id = :id");
                        $updateStmt->bindParam(":stock", $stockOperado, PDO::PARAM_INT);
                        $updateStmt->bindParam(":id", $idProducto, PDO::PARAM_INT);

                        if($updateStmt->execute()){
                            return "ok";
                        }else{
                            return "error";
                        }
                        
                    }


                } else {
                   error_log("Error en tipo de movimietno [CREAR]: " . $e->getMessage());
                   return "error";
                }
                
                break;
            case 'edit':

                $id_inventario = $dato["id"];
                $cant_movi_UPDATE= $dato["cant_movimiento"];
                $idProducto = $dato["id_producto"];
                $tipo_movi = $dato["tipo_movimiento"];

                $tabla = "productos"; $item = "id"; 
                $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item ORDER BY id DESC");
			    $stmt -> bindParam(":".$item, $idProducto, PDO::PARAM_STR);

                $tablaInventario = "inventario";
                $stmtInventario = Conexion::conectar()->prepare("SELECT * FROM $tablaInventario WHERE $item = :$item ORDER BY id DESC");
			    $stmtInventario -> bindParam(":".$item, $id_inventario, PDO::PARAM_STR);

			    
                if($stmt -> execute() && $stmtInventario -> execute()){
                
                    $producto = $stmt->fetch(PDO::FETCH_ASSOC);

                    $inventario = $stmtInventario->fetch(PDO::FETCH_ASSOC);

                    if (!$producto) {
                        return "error_producto_no_encontrado";
                    }

                    if (!$inventario) {
                        return "error_inventario_no_encontrado";
                    }


                    $stockCant_movida_actual = $inventario["cant_movimiento"];
                    $stockActual = $producto["stock"];


                }else{
                    return "error";
                }
                
                if($tipo_movi == 'salida'){

                    $sobrate_faltate = $stockCant_movida_actual - $cant_movi_UPDATE;
                    $stockOperado = $stockActual +   $sobrate_faltate;

                    if($stockOperado < 0){
                        return "error";
                    }else{
                        $updateStmt = Conexion::conectar()->prepare("UPDATE $tabla SET stock = :stock WHERE id = :id");
                        $updateStmt->bindParam(":stock", $stockOperado, PDO::PARAM_INT);
                        $updateStmt->bindParam(":id", $idProducto, PDO::PARAM_INT);


                        
                        if($updateStmt->execute()){
                            return "ok";
                        }else{
                            return "error";
                        }
                        
                    }


                }
                if ($tipo_movi == 'entrada') {
                    $sobrate_faltate = $stockCant_movida_actual - $cant_movi_UPDATE;
                    $stockOperado = $stockActual - $sobrate_faltate;

                    if($stockOperado < 0){
                        return "error";
                    }else{
                        $updateStmt = Conexion::conectar()->prepare("UPDATE $tabla SET stock = :stock WHERE id = :id");
                        $updateStmt->bindParam(":stock", $stockOperado, PDO::PARAM_INT);
                        $updateStmt->bindParam(":id", $idProducto, PDO::PARAM_INT);
                        if($updateStmt->execute()){
                            return "ok";
                        }else{
                            return "error";
                        }
                        
                    }
                } else {
                   error_log("Error en tipo de movimietno [CREAR]: " . $e->getMessage());
                   return "error";
                }
                break;
            case 'delete':

                $tabla = 'inventario';
                $idInventario = $dato;
                $item = "id";

                $stmtdelete = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

                $stmtdelete -> bindParam(":".$item, $idInventario, PDO::PARAM_INT);
                
                
                if($stmtdelete -> execute()){

                    $objetoInventario = $stmtdelete->fetch(PDO::FETCH_ASSOC);

                    if (!$objetoInventario) {
                        return "error_producto_no_encontrado";
                    }

                    $cant_movida = $objetoInventario["cant_movimiento"];
                    $tipo_movi = $objetoInventario["tipo_movimiento"];
                    $idProducto = $objetoInventario["idProducto"];

                    $tablaProducto = "productos"; $itemTwo = "id"; 
                    $stmtProducto = Conexion::conectar()->prepare("SELECT * FROM $tablaProducto WHERE $itemTwo = :$itemTwo ORDER BY id DESC");
                    $stmtProducto -> bindParam(":".$itemTwo, $idProducto, PDO::PARAM_STR);

                    if($stmtProducto -> execute()){
                        
                        $stmtProducto = $stmtProducto->fetch(PDO::FETCH_ASSOC);


                        if(!$stmtProducto){
                            return "error";
                        }

                        $stockActual = $stmtProducto["stock"];

                    
                        if($tipo_movi == 'salida') {
                            
                            $stockOperado = $stockActual + $cant_movida;

                            if($stockOperado < 0){
                                return "error";
                            }else{
                                $tabla = "productos";

                                $deletestmtt = Conexion::conectar()->prepare("UPDATE $tabla SET stock = :stock WHERE id = :id");
                                $deletestmtt->bindParam(":stock", $stockOperado, PDO::PARAM_INT);
                                $deletestmtt->bindParam(":id", $idProducto, PDO::PARAM_INT);
                                
                                if($deletestmtt->execute()){
                                    return "ok";
                                }else{
                                    return "error";
                                }
                                
                            }
                        
                        }
                        elseif ($tipo_movi == 'entrada') {

                            $stockOperado = $stockActual - $cant_movida;

                            if($stockOperado < 0){
                                return "error";
                            }else{
                                $tabla = "productos";

                                $deletestmtt = Conexion::conectar()->prepare("UPDATE $tabla SET stock = :stock WHERE id = :id");
                                $deletestmtt->bindParam(":stock", $stockOperado, PDO::PARAM_INT);
                                $deletestmtt->bindParam(":id", $idProducto, PDO::PARAM_INT);
                                
                                if($deletestmtt->execute()){
                                    return "ok";
                                }else{
                                    return "error";
                                }
                            }
                        }
                        else {  
                            return "error";
                        }


                    }else{
                        return "error";
                    }

                    
                } else {
                    return "error";
                }

                break;
            default:
                throw new Exception("Tipo de cambio de stock no soportado: $tipo");
                break;
        }

        } catch(PDOException $e){
            error_log("Error en guardar cambios en Stock: " . $e->getMessage());
            return "error";
        }


    }


    /*=============================================
    CREAR MOVIMIENTO DE INVENTARIO
    #region RegistrarVenta
    =============================================*/



    static public function mdlRegistrarInventario($CodigoVenta){
        if($CodigoVenta == null) return "error_codigo_venta_vacio";

        try {

            $stmt = Conexion::conectar()->prepare("SELECT * FROM ventas WHERE codigo = :codigo ORDER BY id DESC");
            $stmt->bindParam(":codigo", $CodigoVenta, PDO::PARAM_STR);

            if (!$stmt->execute()) {
                return "error_ejecucion_select";
            }

            $venta = $stmt->fetch(PDO::FETCH_ASSOC);
            if (!$venta) {
                return "venta_no_encontrada";
            }

            $productos = json_decode($venta["productos"], true);
            $fecha = $venta["fecha"];
            $idVenta = $venta["id"];
            $observacion = "VENTA N° " . $venta["codigo"];


            foreach ($productos as $producto) {

                $idProducto = $producto["id"];
                $cantidad = $producto["cantidad"];

                $stmtInventario = Conexion::conectar()->prepare("
                    INSERT INTO inventario 
                    (idProducto, cant_movimiento, tipo_movimiento, fecha, idVenta, observacion)
                    VALUES (:idProducto, :cant, 'salida', :fecha, :idVenta, :observacion)
                ");

                $stmtInventario->bindParam(":idProducto", $idProducto, PDO::PARAM_INT);
                $stmtInventario->bindParam(":cant", $cantidad, PDO::PARAM_INT);
                $stmtInventario->bindParam(":fecha", $fecha, PDO::PARAM_STR);
                $stmtInventario->bindParam(":idVenta", $idVenta, PDO::PARAM_INT);
                $stmtInventario->bindParam(":observacion", $observacion, PDO::PARAM_STR);

                if (!$stmtInventario->execute()) {
                    return "error_insert_inventario_producto_id_" . $idProducto;
                }
            }

            return "ok";

        } catch (Exception $e) {
            return "error_exception: " . $e->getMessage();
        }



    
    }



    



}