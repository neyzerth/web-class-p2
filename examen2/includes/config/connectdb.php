<?php 
function connectdb(){

    try {
        $db = mysqli_connect("localhost", "root", "", "bienesraices2");
        //echo "<p>Conectado<p>";
        return $db;
    } catch (Exception $e) {
        echo "<p>Error Conexion: {$e->getMessage()}<p>";
        return false;
    }
}
