

<?php

$servername = "localhost";
$username = "id18377801_intego";
$password = "r{Iv=4BN4tIBvZ9n";
$database = "id18377801_log";
// // Create connection
$connection = new mysqli($servername, $username, $password,$database);
    
   
// Check connection
if ($connection->connect_error) {
  die("Connection failed: " . $connection->connect_error);
}

            $connection->set_charset("utf8");
            
            
            



	
	$id = $_POST['id'];
	$productid = $_POST['productid'];
	$productname = $_POST['productname'];
	$productprice = $_POST['productprice'];
	$productqty = $_POST['productqty'];
	$stock = $_POST['stock'];


  $productid=mysqli_real_escape_string($connection,$productid);
     $productname=mysqli_real_escape_string($connection,$productname);
      $productprice=mysqli_real_escape_string($connection,$productprice);
     $productqty=mysqli_real_escape_string($connection,$productqty);
      $stock=mysqli_real_escape_string($connection,$stock);
  
     	
     	
     	
		if($_FILES['image']['error'])
	{
	$file_name1 = $_FILES['image']['name'];
 $file_tmp =$_FILES['image']['tmp_name'];
  move_uploaded_file($file_tmp,"image_uploaded/".$file_name1);
 
  $file_name2="https://anthracitic-pecks.000webhostapp.com/scan_copy/Merchant/image_uploaded/".$file_name1;
  
 $connection->query("UPDATE `merchant_add_product` SET image= '$file_name2' WHERE id = '$id'");
 
	}


		$connection->query("UPDATE  `merchant_add_product` SET productid='".$productid."',productname='".$productname."', 
 		productprice='".$productprice."', productqty='".$productqty."', stock='".$stock."' WHERE id=". $id);



	



    	
	$result = array();
	$result['msg'] = "Successfully Edited..";
	echo json_encode($result);

?>


