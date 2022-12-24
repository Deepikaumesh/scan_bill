<?php
$servername = "localhost";
$username = "id18377801_intego";
$password = "r{Iv=4BN4tIBvZ9n";
$database = "id18377801_log";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);

// Check connection
// if ($connection->connect_error) {
//     die("Connection failed: " . $connection->connect_error);
// }
// echo "connected";
//       //checking if there is POST data

//       if( !empty($_POST["name"])and !empty($_POST["email"])and !empty($_POST["phone"])and !empty($_POST["password"]))
// {

//       $name = $_POST["name"];
//     $email= $_POST["email"];
//     $phone= $_POST["phone"];
//     $password = $_POST["password"];
    
               
      
//       $name=mysqli_real_escape_string($connection,$name);
//      $email=mysqli_real_escape_string($connection,$email);
//       $phone=mysqli_real_escape_string($connection,$phone);
//       $password=mysqli_real_escape_string($connection,$password);

      

 
 

// $findexist="select * from registered where name='".$name."'";


//         $resultsearch=mysqli_query($connection,$findexist);
        
  
//     if(mysqli_num_rows($resultsearch)>0)
//     {
//           while($row=mysqli_fetch_array($resultsearch))
//           {
//               $result["error"] = true;
//               $result["message"] = "user Already exist";
//               //  $result["success"] = "3";
//              // $result["message"] = "user Already exist";

//               echo json_encode($result);
//               //mysqli_close($connection);
//           }}
  
// else{

//     $sql = "INSERT INTO registered (name,email,phone,password) VALUES ('".$name."','".$email."','".$phone."','".$password."');";


//     if ( mysqli_query($connection, $sql) ) {
//         $result["error"] =false;
//         $result["message"] = "Registration success";

//         echo json_encode($result);
//         mysqli_close($connection);

//     }
//     // else {
//     //     $result["error"] = true;
//     //     $result["message"] = "error in Registration";
//     //     echo json_encode($result);
    
//       //  mysqli_close($connection);
// //    }
    
// }

// }
  if( !empty($_POST["username"])and !empty($_POST["email"])and !empty($_POST["phone"])and !empty($_POST["password"]))
{

      $username = $_POST["username"];
    $email= $_POST["email"];
    $phone= $_POST["phone"];
    $password = $_POST["password"];
    
               
      
      $username=mysqli_real_escape_string($connection,$username);
     $email=mysqli_real_escape_string($connection,$email);
      $phone=mysqli_real_escape_string($connection,$phone);
       $password=mysqli_real_escape_string($connection,$password);

      

 
 

$findexist="select * from registered where username='".$username."'";


        $resultsearch=mysqli_query($connection,$findexist);
        
  
    if(mysqli_num_rows($resultsearch)>0)
    {
          while($row=mysqli_fetch_array($resultsearch))
          {
              // $result["success"] = "3";
              // $result["message"] = "user Already exist";
			    $result["error"] = true;
              $result["message"] = "username Already exist try another!";

              echo json_encode($result);
              //mysqli_close($connection);
          }}
  
else{

    $sql = "INSERT INTO customer_registration (username,email,phone,password) VALUES ('".$username."','".$email."','".$phone."','".$password."')";


    if ( mysqli_query($connection, $sql) ) {
        $result["error"] = false;
        $result["message"] = "Registration success";

        echo json_encode($result);
        mysqli_close($connection);

    }
	// else {
        // $result["error"] = "true";
        // $result["message"] = "error in Registration";
        // echo json_encode($result);
    
     //  mysqli_close($connection);
    // }
	}
}
?>