<?php 
    if (!isset($_COOKIE['admin']))
    {
        header("Location: /dsw");
        exit();
    }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SnapCart</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="icon" href="assets/icons/main_icon.webp" type="image/webp">


    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<script src = "main.js"></script>
</head>
<body>


    <div class="search-wrapper">
        <div id = "page-name">SnapCart Admin Panel</div>
        <div id = "button-wrapper">
                <button style="background-color: red ; width : 20vh;"  onclick="localStorage.removeItem('cart-data'); window.location.href='http://localhost/dsw/logout.php'" >Logout</button>
        </div> 
        
    </div>
        
    <div>
        <h1>Orders Enque</h1>

        <?php 
        
        $machine = "localhost";
        $user = "root";
        $password = "";
        $db_name = "main";

        $connection = mysqli_connect($machine , $user , $password , $db_name);
        
        if (!$connection)
	        echo "Could not connect";
        $main_query = 'select * from orders order by order_date_time desc;';
        $result = mysqli_query($connection , $main_query);

        if (mysqli_num_rows($result) > 0)
        {
        while ($current_row = mysqli_fetch_assoc($result))
        {
            $user_details_query = "select * from users where user_id = {$current_row['user_id']};";
            $user_result = mysqli_query($connection , $user_details_query);
            $user_record = mysqli_fetch_assoc($user_result);

            $product_query = "select * from products where id in ( {$current_row['pid_list']} ) ;";
            $product_result = mysqli_query($connection , $product_query);


            
            echo "<div class='order-wrapper'>
            <div class='order-meta'>
                <div> Order ID : {$current_row['order_id']} </div> 
                <div> Order Date : {$current_row['order_date_time']} </div> 
                <div> Customer Name : {$user_record['name']}</div> 
                <div> Email : {$user_record['email']} </div> 
                <div> Phone Number : {$user_record['mobile']} </div> 
            </div>";
        
            $product_counter = 1;
            $extensions = ['webp', 'jpeg', 'jpg', 'avif' , 'png'];

            while ($current_product = mysqli_fetch_assoc($product_result))
            {

                $imagePath = null;
                foreach ($extensions as $ext) 
                {
                if (file_exists("assets/images/{$current_product['id']}.$ext")) 
                {
                    $imagePath = "assets/images/{$current_product['id']}.$ext";
                    break;
                }
                }
                echo "<div class='order-items'> 
                <div> $product_counter  </div>
                <div> {$current_product['name']} </div>
                <div> {$current_product['price']} </div>
                 <img src = '$imagePath'/>
                </div>";
                $product_counter++;
            }

        echo "</div>";



        }
        }

        ?>

        

    </div>
    

</body>
</html>