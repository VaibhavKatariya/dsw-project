<?php 
    if (!isset($_COOKIE['web-cookie']))
    {
        header("Location: /dsw/login.php");
        exit();
    }
    if (isset($_COOKIE['admin']))
    {
        header("Location: /dsw/admin.php");
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
<div id = "page-name"><a href="/dsw">SnapCart</a></div>
<div>
<!-- <span style = "font-weight : 600; margin-right : 1vh;"> Hello <?php echo $_COOKIE['web-cookie']; ?>😄</span> -->
<input type="text" id = "main-search" placeholder="What are you looking for 🔎" autocomplete = "off" oninput = "search();"></div>
<div id = "button-wrapper">
        <button onclick="window.location.href='http://localhost/dsw/checkout.php'" id = 'cart-button'>🛒</button>
        <button style="background-color: red;"   onclick="localStorage.removeItem('cart-data'); window.location.href='http://localhost/dsw/logout.php'" >Logout</button>
</div> 
<div id="suggestions-wrapper" style = "display : none;">

</div> 

</div>
    
<div class="category-wrapper">
    <div class="category-header">Electronics
        <div class="category-dropdown">
            <button class="dropdown-item" onclick = "handle_filter();" >Phone</button>
            <button class="dropdown-item" onclick = "handle_filter();" >Laptop</button>
        </div>
    </div>
    <div class="category-header">Clothing
        <div class="category-dropdown">
            <button class="dropdown-item" onclick = "handle_filter();" >Shirts</button>
            <button class="dropdown-item" onclick = "handle_filter();" >Jeans</button>
            <button class="dropdown-item" onclick = "handle_filter();" >Shoes</button>
        </div>
    </div>
    <div class="category-header">Books
        <div class="category-dropdown">
            <button class="dropdown-item" onclick = "handle_filter();" >Fiction</button>
            <button class="dropdown-item" onclick = "handle_filter();" >Sci Fi</button>
            <button class="dropdown-item" onclick = "handle_filter();" >Horror</button>
        </div>
    </div>
    <div class="category-header">Essentials
        <div class="category-dropdown">
            <button class="dropdown-item" onclick = "handle_filter();" >Shampoo</button>
            <button class="dropdown-item" onclick = "handle_filter();" >Trimmer</button>
        </div>
    </div>
</div>

    <div class = "ad-container" id = "0">
        <img src = "assets/advertisements/preview_21.jpeg"  id = "thumbnail-left" class = "thumbnail" onclick="window.location.href='http://localhost/dsw/showProduct.php?id=21'"/>
        <button onclick = "handle_ad_left()" id = "ad-left-button"> < </button>
        <video id = "video-src-wrapper" class = "video-player" autoplay muted loop onclick="window.location.href='http://localhost/dsw/showProduct.php?id=1'">
            <source class = "video-player" src="assets/advertisements/1.mp4" type="video/mp4" id = "video-src-main">
        </video>
        <button onclick = "handle_ad_right()" id = "ad-right-button"> > </button>
        <img src = "assets/advertisements/preview_5.jpeg"  id = "thumbnail-right"   class = 'thumbnail' onclick="window.location.href='http://localhost/dsw/showProduct.php?id=5'"/>

    </div>

    <main class="main">
        <div id = "filter-header">
            <div >Showing all <span id = "filter-header-main" style = "font-weight : 750;">Horror</span></div>
            <button id  = "filter-header-button" onclick = "remove_filter()"> Remove Filter </button>
        </div>

        <section class="product-list" id = "main-wrapper">

            
    <?php 
    $machine = "localhost";
    $user = "root";
    $password = "";
    $db_name = "main";
    $connection = mysqli_connect($machine , $user , $password , $db_name);
    if (!$connection)
	    echo "Could not connect";
    $main_query = 'select * from products;';
    $result = mysqli_query($connection , $main_query);
    $extensions = ['webp', 'jpeg', 'jpg', 'avif' , 'png'];
    if (mysqli_num_rows($result) > 0)
    {
    while ($current_row = mysqli_fetch_assoc($result))
    {
        echo "<div id = 'product-{$current_row['id']}' class=\"product-card\" onclick=\"window.location.href='http://localhost/dsw/showProduct.php?id={$current_row['id']}'\">";

        $imagePath = null;
        foreach ($extensions as $ext) 
        {
        if (file_exists("assets/images/{$current_row['id']}.$ext")) 
        {
        $imagePath = "assets/images/{$current_row['id']}.$ext";
        break;
        }
        }
        echo "<img src= \"$imagePath\" alt=\"Product 2\" style = \"height: 20vh;\">";
        echo "<h3>{$current_row['name']}</h3>";
        echo "<p>Rating {$current_row['ratings']}</p>";
        echo "<p>{$current_row['price']}$</p>";
        echo "<span style = 'display : none;'>{$current_row['category']}</span>";
        echo "<button onclick=\"add_to_cart()\">Add to Cart 🛒</button>";
        echo "</div>";
    }
    }
    ?>


        </section>
    </main>

    <script src="script.js"></script>
</body>
</html>