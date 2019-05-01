<?php

$con=conexion();
	$nom=$_POST['nombre'];
	$dir=$_POST['direccion'];
	$tel=$_POST['telefono'];
	$peli=$_POST['id_pelicula'];
	$modo=$_POST['modo'];
	$total=$_POST['total'];

	$insertarC="INSERT into cliente values('$nom','$dir','$tel','$peli','$modo','$total')";
	$resultado=mysqli_query($con,$insertarC) or die("Error al insertar el cliente");
	mysqli_close($con);
	echo "Cliente insertado";
?>