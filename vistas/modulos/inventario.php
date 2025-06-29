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
        
            Gestión Inventario
        
        </h1>


        <ol class="breadcrumb">
        
            <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>
            
            <li class="active">Gestión Inventario</li>
            
        </ol>
        
    
    </section>


    <section class="content">

        <div class="box">

        <div class="box-header with-border">
    
        </div>

        <div class="box-body">
            
        <table class="table table-bordered table-striped dt-responsive tablaProductosInventario" width="100%">
            
            <thead>
            
            <tr>
            
            <th style="width:10px">#</th>
            <th>Imagen</th>
            <th>Código</th>
            <th>Descripción</th>
            <th>Categoría</th>
            <th>Stock</th>
            <th>Agregado</th>
            <th>Kardex</th>
            
            </tr> 

            </thead>      

        </table>

        <input type="hidden" value="<?php echo $_SESSION['perfil']; ?>" id="perfilOcultoInventario">

        </div>

        </div>
    </section>
</div>