<?php

$server='localhost';
$user='root';
$pass='';
$db_name='jquery';


try {
    $db= new PDO('mysql:host=localhost;dbname=jquery', $user, $pass);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo 'ERROR: ' . $e->getMessage();
}
