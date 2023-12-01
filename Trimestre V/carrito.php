<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Naila's Beuty</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="eCommerce HTML Template Free Download" name="keywords">
        <meta content="eCommerce HTML Template Free Download" name="description">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" rossorigin="anonymous" referrerpolicy="no-referrer"/>
    
        <link rel="stylesheet" href="css/estilos.css">
        <script src="js/app.js" async></script>
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap" rel="stylesheet">

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/slick/slick.css" rel="stylesheet">
        <link href="lib/slick/slick-theme.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
    <?php include ("index/header.php");?>
        
    <!-- Breadcrumb Start -->
    <div class="breadcrumb-wrap">
        <div class="container-fluid">
            <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.php">Home</a></li>
            <li class="breadcrumb-item"><a href="lista_productos_php">Products</a></li>
            <li class="breadcrumb-item active">Cart</li>
        </ul>
        </div>
    </div>
    <!-- Breadcrumb End -->
    <section class="contenedor">
        <?php include ("carrito/items.php");?>   
        <?php include ("carrito/carro.php");?>   
    </section> 
    
    <?php include ("index/subscripcion.php");?>   
    <?php include ("index/footer.php");?>  
     
    </body>
</html>
