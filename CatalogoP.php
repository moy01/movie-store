<?php  

$con=conexion();

	$idp=$_POST['id_pelicula'];
	$catalogo=mysqli_query($con,"SELECT Titulo,Director,Ano,Detalles,Clasificacion,Genero from pelicula where Disponible=si") or die "Error al extraer los datos";

	echo '<table border=1>';
	echo '<tr>';
	echo '<th id="Tp">Titulo</th>';
	echo '<th id="Dp">Director</th>';
	echo '<th id="Ap">Año</th>';
	echo '<th id="Datap">Detalles</th>';
	echo '<th id="Cp">Clasificación</th>';
	echo '<th id="Gp">Genero</th>';
	echo '</tr>';

	while ($res=mysqli_fetch_array($catalogo)) {
		echo '<tr>';
		echo '<td>'.$res['Titulo'].'</td>';
		echo '<td>'.$res['Director'].'</td>';
		echo '<td>'.$res['Ano'].'</td>';
		echo '<td>'.$res['Detalles'].'</td>';
		echo '<td>'.$res['Clasificacion'].'</td>';
		echo '<td>'.$res['Genero'].'</td>';
		echo '</tr>';
	}

	mysqli_close($con);
	echo '</table>';
?>