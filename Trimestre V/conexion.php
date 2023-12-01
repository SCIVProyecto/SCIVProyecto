<?php

function connection(){
    $host = "localhost";
    $user = "root";
    $pass = "";

    $bd = "proyecto";

    $connect=mysqli_connect($host, $user, $pass);

    mysqli_select_db($connect, $bd);

    return $connect;

}

$conexion= new mysqli("localhost", "root", "", "proyecto");
//Comproprobar conexion
if(mysqli_connect_errno())
{
    printf("fallo la conexion");
}
else{
    //printf("Estas conectado");
}


?>