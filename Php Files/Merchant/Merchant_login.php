<?php
$servername = "localhost";
$username = "id18377801_intego";
$password = "r{Iv=4BN4tIBvZ9n";
$database = "id18377801_log";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);
   
  if( !empty($_POST["username"])and !empty($_POST["password"]))
{

      $username = $_POST["username"];
    $password = $_POST["password"];
    
               
      
      $username=mysqli_real_escape_string($connection,$username);
       $password=mysqli_real_escape_string($connection,$password);
	   



$username = $_POST['username'];
 $password = $_POST['password'];
 $sql = "SELECT * FROM merchant_registration WHERE username = '".$username."' AND password = '".$password."'";
 $result = mysqli_query($connection,$sql);
 $count = mysqli_num_rows($result);
 if($count == 1){
    echo json_encode("Success");
 } 
 else{
    echo json_encode("Error");
}}
?>

