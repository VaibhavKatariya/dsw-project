<?php 

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['name']) && isset($_POST['mobile']) && isset($_POST['email']) && isset($_POST['password']) ) 
{
    $name = $_POST['name'];
    $mobile = $_POST['mobile'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    
    $machine = "localhost";
    $user = "root";
    $password_db = "";
    $db_name = "main";

    $connection = mysqli_connect($machine , $user , $password_db , $db_name);
    if (!$connection)
	    echo "Could not connect";

    $email_taken_check_query = "select * from users where email = '$email';";
    $check_query_result = mysqli_query($connection , $email_taken_check_query);

    if (mysqli_num_rows($check_query_result) != 0)
    {
        http_response_code(400); 
        echo json_encode(["error" => "Error : Email ID is already registered !"]);
        exit();
    }

    $hashed_password = password_hash($password , PASSWORD_DEFAULT);
    $main_query = "insert into users (name , mobile , email , password) values ('$name' , $mobile , '$email' , '$hashed_password');";

    mysqli_query($connection , $main_query);

    setcookie("web-cookie" , $name , time() + 3600 , "/");

    http_response_code(200);
    echo json_encode(["ok" => "user was created"]);
}
?>