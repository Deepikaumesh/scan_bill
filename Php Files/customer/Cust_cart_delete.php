<?php
$servername = "localhost";
$username = "id18377801_intego";
$password = "r{Iv=4BN4tIBvZ9n";
$database = "id18377801_log";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);
   
// Check connection
if ($connection->connect_error) {
  die("Connection failed: " . $connection->connect_error);
}
 $id=$_POST['id'];
 print($id);
  	$connection->query("DELETE FROM  cust_cart_product WHERE id=".$id);


 

$result=array("success"=>'Successfully Deleted');
echo json_encode($result);
?>