
<?php
$servername = "localhost";
$username = "id18377801_intego";
$password = "r{Iv=4BN4tIBvZ9n";
$database = "id18377801_log";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);


  if( !empty($_POST["productid"]))
{

      $productid = $_POST["productid"];
         $product_qty = $_POST["product_qty"];
     $uid = $_POST["uid"];
    
   
               
      
      $productid=mysqli_real_escape_string($connection,$productid);
       $product_qty=mysqli_real_escape_string($connection,$product_qty);
        $uid=mysqli_real_escape_string($connection,$uid);
   
   

      

 
 

$findexist="select * from cust_cart_product where productid='".$productid."'";


        $resultsearch=mysqli_query($connection,$findexist);
        
  
    if(mysqli_num_rows($resultsearch)>0)
    {
           while($row=mysqli_fetch_array($resultsearch))
           {
            //   $result["success"] = "3";
            //   $result["message"] = "Product Already Added";
			    $result["error"] = true;
               $result["message"] = "Product Already Added, Go to cart and change qty!";

               echo json_encode($result);
              mysqli_close($connection);
           }}
  
else{

    $sql = "INSERT INTO cust_cart_product (productid,product_qty,uid) VALUES ('".$productid."','".$product_qty."','".$uid."')";


    if ( mysqli_query($connection, $sql) ) {
        
        // $sql1 ="select `stock` from `merchant_add_product` WHERE productid = '".$productid."' ";
        
        // $s=$sql1;
        
        //  $newqty =$s -'".$product_qty."';
         
        //  $sql2 = "UPDATE `merchant_add_product` SET $stock = $newqty WHERE productid = '".$productid."'";
         
         
           $result["error"] = false;
        $result["message"] = "Product Added Successfully";
		 echo json_encode($result);
        mysqli_close($connection);
    }
    else{
          $result["error"] = true;
        $result["message"] = "Product not Added";
      
    }
      
  

       

    }
	}

?>

