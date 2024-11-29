<?php 

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['email']) && isset($_POST['password']) ) 
{
    $email = $_POST['email'];
    $password = $_POST['password'];
    
    $machine = "localhost";
    $user = "root";
    $password_db = "";
    $db_name = "main";

    $connection = mysqli_connect($machine , $user , $password_db , $db_name);
    if (!$connection)
    {
	    echo "Could not connect to the server";
        exit;
    }

    $main_query = "select * from users where email = '$email';";
    $check_query_result = mysqli_query($connection , $main_query);

    if (mysqli_num_rows($check_query_result) == 0)
    {
        http_response_code(400); 
        echo json_encode(["error" => "Error : Email ID does not exist !"]);
        exit();
    }

    $current_row = mysqli_fetch_assoc($check_query_result);
    if (!password_verify($password , $current_row['password']))
    {
        http_response_code(401); 
        echo json_encode(["error" => "Error : Invalid password !"]);
        exit();
    }

    setcookie("web-cookie" , $current_row['name'] , time() + 3600 , "/");
    setcookie("uid" , $current_row['user_id'] , time() + 3600 , "/");
    if ($email == "admin@snapcart.com")
        setcookie("admin" , "true" , time() + 3600 , "/");

    http_response_code(200);
    echo json_encode(["ok" => "login successful"]);
}
?>