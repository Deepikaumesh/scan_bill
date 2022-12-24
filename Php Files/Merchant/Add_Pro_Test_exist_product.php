
<?php
$servername = "localhost";
$username = "id18377801_intego";
$password = "r{Iv=4BN4tIBvZ9n";
$database = "id18377801_log";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);


  if( !empty($_POST["productid"]))
{

     $productid	 = $_POST['productid'];
     $productname = $_POST['productname'];
	   $productprice = $_POST['productprice'];
	   //  $productqty = $_POST['productqty'];
	     $stock = $_POST['stock'];
    
   
               
      
      $productid=mysqli_real_escape_string($connection,$productid);
       $productname=mysqli_real_escape_string($connection,$productname);
          $productprice=mysqli_real_escape_string($connection,  $productprice);
           $stock=mysqli_real_escape_string($connection,  $stock);
        
        
   $findexist="select * from merchant_add_product where productid='".$productid."'";


        $resultsearch=mysqli_query($connection,$findexist);
        
  
    if(mysqli_num_rows($resultsearch)>0)
    {
           while($row=mysqli_fetch_array($resultsearch))
           {
            //   $result["success"] = "3";
            //   $result["message"] = "Product Already Added";
			    $result["error"] = true;
               $result["message"] = "Product Already Exist!";

               echo json_encode($result);
              mysqli_close($connection);
           }}
  
else{

   $file_name1 = $_FILES['image']['name'];
 $file_tmp =$_FILES['image']['tmp_name'];
  move_uploaded_file($file_tmp,'image_uploaded/'.$file_name1);
 
 
 $file_name2="https://anthracitic-pecks.000webhostapp.com/scan_copy/Merchant/image_uploaded/".$file_name1;
 
  $sql = "INSERT INTO `merchant_add_product`( `productid`,`productname`,`productprice`,`stock`,`image`) VALUES ( '$productid',' $productname ','$productprice',
 '$stock','$file_name2')";
 
   


    if ( mysqli_query($connection, $sql) ) {
        
      
         
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

