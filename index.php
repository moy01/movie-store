<!DOCTYPE html>
<html>
<head>
    <title>Movie-Store</title>
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>


<div class="container">
    <br>
    <br>
    <div class="row" id="ads">

 <?php 
 include("CatalogoP.php");
 while ($res = mysqli_fetch_array($catalogo) ) 
    {
 ?>        
    <div class="col-md-4">
        <div class="card rounded">
            <div class="card-image">
                <span class="card-notify-badge"><?php echo $res['Titulo'] ?> </span>
                <span class="card-notify-year"><?php echo $res['Ano'] ?></span>
                <img class="img-fluid" src="https://imageonthefly.autodatadirect.com/images/?USER=eDealer&PW=edealer872&IMG=USC80HOC011A021001.jpg&width=440&height=262" alt="Alternate Text" />
            </div>
            <div class="card-image-overlay m-auto">
                <span class="card-detail-badge"><?php echo $res['Director'] ?></span>
                <span class="card-detail-badge"><?php echo $res['Genero'] ?></span>
                <span class="card-detail-badge"><?php echo $res['Clasificacion'] ?></span>
            </div>
            <div class="card-body text-center">
                <div class="ad-title m-auto">
                    <h5><?php echo $res['Detalles'] ?></h5>
                </div>
                <a class="ad-btn" href="#">View</a>
            </div>
        </div>
    </div>
<?php 
    } 
?>   

</div>
</div>
</body>
</html>