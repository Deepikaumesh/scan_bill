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
  $productid=$_POST['productid'];
   $product_qty=$_POST['product_qty'];

 print($id."-".$productid."-".$product_qty);

// 		$connection->query("DELETE  FROM  cust_cart_product WHERE id=".$id) ;

    $sql = "DELETE  FROM  cust_cart_product WHERE id=".$id ;


    if ( mysqli_query($connection, $sql) ) {

        $sql1 ="select stock from merchant_add_product WHERE productid = '".$productid."' ";

          $s = mysqli_query($connection, $sql1) ;
              $ss = mysqli_fetch_assoc($s);

              $sq = "select product_qty from cust_cart_product productid = '".$productid."' ";
               $sqq = mysqli_query($connection, $sq) ;
                $sss = mysqli_fetch_assoc($s);

         //$newqty =$ss["stock"] + $product_qty;

         $newqty =$ss["stock"] + $sss["product_qty"];

         $sql2 = "UPDATE merchant_add_product SET stock = '".$newqty."'  WHERE productid = '".$productid."'";

         mysqli_query($connection, $sql2);


          $result["error"] = false;
        $result["message"] = "Product deleted Successfully-".$ss["stock"]."-".$product_qty;
		 echo json_encode($result);
        mysqli_close($connection);
    }
    else{
          $result["error"] = true;
        $result["message"] = "Product not deleted";

}

// $result=array("success"=>'Successfully Deleted');
// echo json_encode($result);
?>