<?php
require "../config.php";
function addUser(
    $username, $password, 
    $name, $firstSurname, $secondSurname, 
    $dateOfBirth, $neighborhood, $street, $postalCode,
    $phone, $email, 
    $userType, $supervisor
){
    $db = connectdb();
    $query = "call sp_insertUSer(".
        "$username, $password,". 
        "$name, $firstSurname, $secondSurname, ".
        "$dateOfBirth,$neighborhood,$street, $postalCode,".
        "$phone,$email,$userType,$supervisor".
    ");";

    try {
        $response = mysqli_query($db, $query);
        return true;
    } catch (Exception $e) {
        return false;
    }
}

function getUserTypes(){
    $db = connectdb();
    $query = "SELECT code, name FROM user_type;";

    return mysqli_query($db, $query);
}
function getSupervisors(){
    $db = connectdb();
    $query = "SELECT num, name FROM user WHERE supervisor IS NULL;";

    return mysqli_query($db, $query);
}

