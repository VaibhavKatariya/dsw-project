<?php 

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['product_id'])  && isset($_POST['author_name']) && isset($_POST['review_content'])) 
{
    $product_id = $_POST['product_id'];
    $author_name = $_POST['author_name'];
    $review_content = $_POST['review_content'];

    $machine = "localhost";
    $user = "root";
    $password = "";
    $db_name = "main";

    $connection = mysqli_connect($machine , $user , $password , $db_name);
    if (!$connection)
	    echo "Could not connect";
    
    $insert_query = "insert into reviews (product_id , author_name , review_content) values ('$product_id' , '$author_name' , '$review_content')";

    mysqli_query($connection , $insert_query);

    $select_query = "select * from reviews where product_id = ".$product_id;

    $result = mysqli_query($connection , $select_query);

    $search_result = [];
    if (mysqli_num_rows($result) > 0)
    {
    while ($current_row = mysqli_fetch_assoc($result))
    {
        $search_result[] = [
            'author_name' => $current_row['author_name'],
            'review_content' => $current_row['review_content'],
        ];
    }
    echo json_encode($search_result);
    }
}
?>