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
  
 
   
//$connection->query("DELETE FROM  cust_cart_product  WHERE(cust_cart_product.productid) IN (SELECT merchant_add_product.productid FROM merchant_add_product)");//original



// $connection->query("DELETE FROM  cust_cart_product  WHERE(cust_cart_product.productid) IN (SELECT merchant_add_product.productid FROM merchant_add_product

// WHERE `cust_cart_product`.`id`=`172`)");

//$connection->query("delete from `cust_cart_product` WHERE `productid` in (select `productid` FROM `merchant_add_product` WHERE `cust_cart_product`.`id` =172");


   

 //$connection->query("DELETE FROM cust_cart_product INNER JOIN (merchant_add_product) ON (merchant_add_product.productid=cust_cart_product.productid) WHERE cust_cart_product.id=".$id);
   //$connection->query("DELETE productid FROM  cust_cart_product IN (SELECT merchant_add_product.productid FROM merchant_add_product)WHERE cust_cart_product.id=".$id);
    //  $connection->query("DELETE productid FROM cust_cart_product INNER JOIN (merchant_add_product) ON (cust_cart_product.productid=merchant_add_product.productid)");
  //	$connection->query("DELETE FROM  merchant_add_product WHERE id=".$id);
   //	$connection->query("DELETE  `productid` FROM  cust_cart_product WHERE `cust_cart_product`.`productid` = `merchant_add_product`.`productid`");	

//	$connection->query("DELETE FROM `cust_cart_product` WHERE `productid` in (SELECT `productid` FROM `merchant_add_product` WHERE cust_cart_product.id=".$id);

//	$connection->query("DELETE  FROM  cust_cart_product WHERE `cust_cart_product`.`productid` = `merchant_add_product`.`productid`=".$id);

	//$sql = "SELECT * FROM `cust_cart_product` JOIN `merchant_add_product` ON `cust_cart_product`.`productid` = `merchant_add_product`.`productid`"; //original
	
	$connection->query("DELETE  FROM  cust_cart_product WHERE id=".$id) ;
 

$result=array("success"=>'Successfully Deleted');
echo json_encode($result);
?>