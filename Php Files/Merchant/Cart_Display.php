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
  $sql = "select * from merchant_add_product  ";
  
 //$sql="select * from cust_cart_product where username='sanvi'";
  
 // $sql = select * from cust_cart_product where cust_cart_product.username = customer_registration.username;
 
 //$sql = "SELECT * FROM `cust_cart_product` JOIN `customer_registration` ON `cust_cart_product`.`username` = `customer_registration`.`username`";
 
 // $sql = "SELECT * FROM `cust_cart_product` JOIN `merchant_add_product` ON `cust_cart_product`.`productid` = `merchant_add_product`.`productid`";
 
  //$sql = "SELECT * FROM `cust_cart_product` JOIN `merchant_add_product`";

  
    

   
    $result = mysqli_query($connection, $sql) or die("Error in Selecting " . mysqli_error($connection));
     
    
    $response = array();
    if($result->num_rows > 0){
        while($row = $result->fetch_assoc()){
            array_push($response,$row);
        }
    }
$connection->close();
header('Content-Type: application/json');
echo json_encode($response);
?>

