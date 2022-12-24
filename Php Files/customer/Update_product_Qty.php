

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
// //	$productid = $_POST['productid'];
	$product_qty = $_POST['product_qty'];



  //$productid=mysqli_real_escape_string($connection,$productid);
     $product_qty=mysqli_real_escape_string($connection,$product_qty);

  
     
     	
// 		if($_FILES['image']['error'])
// 	{
// 	$file_name1 = $_FILES['image']['name'];
//  $file_tmp =$_FILES['image']['tmp_name'];
//   move_uploaded_file($file_tmp,"image_uploaded/".$file_name1);
 
//   $file_name2="https://anthracitic-pecks.000webhostapp.com/scan_copy/Merchant/image_uploaded/".$file_name1;
  
//  $connection->query("UPDATE `cust_cart_product` SET image= '$file_name2' WHERE id = '$id'");
 
//	}


// 		$connection->query("UPDATE  `cust_cart_product` SET productid='".$productid."', product_qty='".$product_qty."',  WHERE id=". $id);

	$connection->query("UPDATE  cust_cart_product SET product_qty='".$product_qty."' WHERE id=".$id);




	



    	
	$result = array();
	$result['msg'] = "Successfully Edited..";
	echo json_encode($result);

?>


