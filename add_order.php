<?php 

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['uid']) && isset($_POST['pid_list'])) 
{
    $uid = $_POST['uid'];
    $pid_list = $_POST['pid_list'];

    $machine = "localhost";
    $user = "root";
    $password_db = "";
    $db_name = "main";

    $connection = mysqli_connect($machine , $user , $password_db , $db_name);
    if (!$connection)
	    echo "Could not connect";

    $main_query = "insert into orders (user_id , pid_list , order_date_time) values ($uid , '$pid_list' , NOW());";

    mysqli_query($connection , $main_query);

    http_response_code(200);
    echo json_encode(["ok" => "order was placed"]);
}
?>