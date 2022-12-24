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
 

   $productid	 = $_POST['productid'];
     $productname = $_POST['productname'];
	   $productprice = $_POST['productprice'];
	   //  $productqty = $_POST['productqty'];
	     $stock = $_POST['stock'];

 $file_name1 = $_FILES['image']['name'];
 $file_tmp =$_FILES['image']['tmp_name'];
  move_uploaded_file($file_tmp,'image_uploaded/'.$file_name1);
 
 
 $file_name2="https://anthracitic-pecks.000webhostapp.com/scan_copy/Merchant/image_uploaded/".$file_name1;
 



 $sql = "INSERT INTO `merchant_add_product`( `productid`,`productname`,`productprice`,`stock`,`image`) VALUES ( '$productid',' $productname ','$productprice',
 '$stock','$file_name2')";

 if ($connection->query($sql) === TRUE)
{
  echo json_encode(array("statusCode=200","msg"=>"New record created successfully"));
} 
else 
{
  echo json_encode(array("statusCode=0","msg"=>$connection->error));
}
 
 
?>


