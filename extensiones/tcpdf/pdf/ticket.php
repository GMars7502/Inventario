<?php

require_once "../../../controladores/ventas.controlador.php";
require_once "../../../modelos/ventas.modelo.php";

require_once "../../../controladores/clientes.controlador.php";
require_once "../../../modelos/clientes.modelo.php";

require_once "../../../controladores/usuarios.controlador.php";
require_once "../../../modelos/usuarios.modelo.php";

require_once "../../../controladores/productos.controlador.php";
require_once "../../../modelos/productos.modelo.php";

class imprimirFactura {

  public $codigo;

  public function traerImpresionFactura() {

    $itemVenta = "codigo";
    $valorVenta = $this->codigo;
    $respuestaVenta = ControladorVentas::ctrMostrarVentas($itemVenta, $valorVenta);

    $fecha = substr($respuestaVenta["fecha"], 0, -8);
    $productos = json_decode($respuestaVenta["productos"], true);
    $neto = number_format($respuestaVenta["neto"], 2);
    $impuesto = number_format($respuestaVenta["impuesto"], 2);
    $total = number_format($respuestaVenta["total"], 2);

    $delivery = isset($respuestaVenta["delivery"]) && !empty($respuestaVenta["delivery"])
                ? json_decode($respuestaVenta["delivery"], true)
                : null;

    $costoDelivery = number_format($delivery["costo"] ?? 0, 2);

    $respuestaCliente = ControladorClientes::ctrMostrarClientes("id", $respuestaVenta["id_cliente"]);
    $respuestaVendedor = ControladorUsuarios::ctrMostrarUsuarios("id", $respuestaVenta["id_vendedor"]);

    require_once('tcpdf_include.php');
    $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
    $pdf->setPrintHeader(false);
    $pdf->setPrintFooter(false);
    $pdf->AddPage('P', 'A7');

    $bloque1 = <<<EOF
<table style="font-size:9px; text-align:center">
  <tr>
    <td style="width:160px;">
      <div>
        Fecha: $fecha<br><br>
        <strong>Inventory System</strong><br>
        RUC: 71.759.963-9<br>
        Dirección: Samanez Ocampo Nro. 747<br>
        Teléfono: 937-585-959<br>
        <strong>FACTURA N.º $valorVenta</strong><br><br>					
        Cliente: {$respuestaCliente['nombre']}<br>
        Vendedor: {$respuestaVendedor['nombre']}<br>
      </div>
    </td>
  </tr>
</table>
EOF;
    $pdf->writeHTML($bloque1, false, false, false, false, '');

    foreach ($productos as $item) {
      $valorUnitario = number_format($item["precio"], 2);
      $precioTotal = number_format($item["total"], 2);

      $bloque2 = <<<EOF
<table style="font-size:9px;">
  <tr>
    <td style="width:160px; text-align:left">{$item['descripcion']}</td>
  </tr>
  <tr>
    <td style="width:160px; text-align:right">
      S/ $valorUnitario Und x {$item['cantidad']} = S/ $precioTotal<br>
    </td>
  </tr>
</table>
EOF;
      $pdf->writeHTML($bloque2, false, false, false, false, '');
    }

    if ($delivery) {
      $nombreDelivery = $delivery["nombre"] ?? '---';
      $direccionDelivery = $delivery["direccion"] ?? '---';
      $referencias = $delivery["referencias"] ?? '---';
      $telefonoDelivery = $delivery["telefono"] ?? '---';

      $bloqueDelivery = <<<EOF
<table style="font-size:9px; margin-top:10px;">
  <tr><td colspan="2"><strong>Información de Delivery:</strong></td></tr>
  <tr><td>Nombre:</td><td>$nombreDelivery</td></tr>
  <tr><td>Dirección:</td><td>$direccionDelivery</td></tr>
  <tr><td>Referencias:</td><td>$referencias</td></tr>
  <tr><td>Teléfono:</td><td>$telefonoDelivery</td></tr>
</table>
EOF;
      $pdf->writeHTML($bloqueDelivery, false, false, false, false, '');
    }

    $bloque3 = <<<EOF
<table style="font-size:9px; text-align:right; margin-top:10px;">
  <tr><td style="width:80px;">NETO:</td><td style="width:80px;">S/ $neto</td></tr>
  <tr><td>IMPUESTO:</td><td>S/ $impuesto</td></tr>
  <tr><td>DELIVERY:</td><td>S/ $costoDelivery</td></tr>
  <tr><td colspan="2">--------------------------</td></tr>
  <tr><td><strong>TOTAL:</strong></td><td><strong>S/ $total</strong></td></tr>
  <tr><td colspan="2"><br><br>Muchas gracias por su compra</td></tr>
</table>
EOF;
    $pdf->writeHTML($bloque3, false, false, false, false, '');

    ob_end_clean();
    $pdf->Output('factura.pdf');
  }
}

$factura = new imprimirFactura();
$factura->codigo = $_GET["codigo"];
$factura->traerImpresionFactura();

?>
