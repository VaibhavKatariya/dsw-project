<?php 
    if (!isset($_COOKIE['web-cookie']))
    {
        header("Location: /dsw/login.php");
        exit();
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SnapCart</title>
    <link rel="stylesheet" href="show.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<script>


    function add_to_cart()
    {
        const cart_button = document.getElementById('cart-button');
        cart_button.classList.add("active");
        setTimeout(() => {
            cart_button.classList.remove("active");

        } , 1000);


        event.stopPropagation();
        console.log("add")
        var cart_data = localStorage.getItem('cart-data');
        if (cart_data === null)
        {
            localStorage.setItem('cart-data' , JSON.stringify([]))
            cart_data = localStorage.getItem('cart-data');
        }
        cart_data = JSON.parse(cart_data)
        const url = new URL(window.location.href)

        cart_data.push(url.searchParams.get('id'))
        
        localStorage.setItem('cart-data' , JSON.stringify(cart_data))
    }

    function get_cookie_value() 
    {
    const cookies = document.cookie.split(';');
    for (let cookie of cookies) 
    {
        let [key, value] = cookie.trim().split('=');
        if (key === "web-cookie") return decodeURIComponent(value.trim());
    }
    }

    function add_review()
    {
        const user_name = get_cookie_value(); // this is temporary , when using the session cookie , get the name of the person who is logged in
        const new_review = document.getElementById("review-box").value;
        document.getElementById("review-box").value = "";

        const url = new URL(window.location.href);
        const data = {
            product_id : url.searchParams.get('id'),
            author_name : user_name,
            review_content : new_review
        }

        console.log(data)

        fetch('add_review.php', 
        {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded' 
        },
        body: new URLSearchParams(data) 
        })
        .then(response => response.text())  
        .then(data => {
        var information = JSON.parse(data);
        console.log(information[information.length - 1])

        const new_review_object = information[information.length - 1];

        const reviewWrapper = document.createElement('div');
        reviewWrapper.classList.add('review-wrapper');

        const reviewAuthor = document.createElement('div');
        reviewAuthor.classList.add('review-author');

        const userImage = document.createElement('img');
        userImage.classList.add('review-user-image');
        userImage.src = 'assets/background/user.jpg'; 

        const authorNameDiv = document.createElement('div');
        authorNameDiv.textContent = new_review_object.author_name;

        reviewAuthor.appendChild(userImage);
        reviewAuthor.appendChild(authorNameDiv);

        const reviewContent = document.createElement('div');
        reviewContent.classList.add('review-content');
        reviewContent.textContent = new_review_object.review_content; 

        reviewWrapper.appendChild(reviewAuthor);
        reviewWrapper.appendChild(reviewContent);

        const review_parent_element = document.getElementById("review-span-wrapper")

        review_parent_element.insertBefore(reviewWrapper , review_parent_element.firstChild);

        })
    }

    function search() {
    var d = event.target.value;
    if (d.trim() == "")
    {
        const container = document.getElementById('suggestions-wrapper');
        container.style.display = "none";
        return;
    }
    console.log(event.target.value);
    const data = 
    {
        squery: event.target.value
    };

    fetch('search.php', 
    {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded' 
        },
        body: new URLSearchParams(data) 
    })
    .then(response => response.text())  
    .then(data => {
        var information = JSON.parse(data);
        const container = document.getElementById('suggestions-wrapper');
        if (information.length == 0)
        {
            container.style.display = "none";
            return;
        }
            container.style.display = "block";

        container.innerHTML = "";
        for (let i = 0 ; i < information.length; i++)
        {
            var item = document.createElement("div");
            item.onclick = function()
            {
                window.location.href='http://localhost/dsw/showProduct.php?id='+ information[i].id;
            }
            var image_tag = document.createElement("img");
            var item_name = document.createElement("span");
            var item_category = document.createElement("span");
            var buffer = document.createElement("span");

            item_name.className = "bold-text";
            item_category.className = "bold-text";
            
            image_tag.src = information[i].img;
            image_tag.className = "search-image";
            item_name.innerText = information[i].name;
            buffer.innerText = " in ";
            var category_name = information[i].category;
            category_name =  category_name.charAt(0).toUpperCase() + category_name.slice(1);
            item_category.innerText = category_name ;

            item.appendChild(image_tag);
            item.appendChild(item_name);
            item.appendChild(buffer);
            item.appendChild(item_category);

            item.className = "suggestion-item";
            container.appendChild(item);
            console.log(information[i]);
        }   

    })
    .catch(error => {
        console.error('Fetch error:', error);
        const container = document.getElementById('suggestions-wrapper');
            container.style.display = "none";
    });
}


function generate_prompt(main_prompt)
{
    var run_prompt = "product name : " + document.getElementById('pname').innerText;
    run_prompt += " ; product description : " + document.getElementById('product-description').innerText;
    run_prompt +=" ; " + main_prompt;
    
    return run_prompt;
}

function pretty_text(response_text)
{
    response_text = response_text.replace(/\n/g, "<br>");

    const opening_span = "<span style = 'font-weight : 700;'/>";
    const closing_span = "</span>";

    var tag_status = true;
    
    var string_construct = "";
    for (var i = 0 ; i < response_text.length - 1 ; i++)
    {
        if (response_text[i] == '*' && response_text[i+1] == '*')
        {
            if (tag_status)
                string_construct += opening_span;
            else
                string_construct += closing_span;
            tag_status = !tag_status;
            i++;
        }
        else
            string_construct += response_text[i];
    }

    return string_construct;
}
function handle_fetch()
{
    document.getElementById('loading-wrapper').style.display = "flex";
    document.getElementById('response-box').style.display = "none";

    if (document.getElementById('ai-input').value == "")
        return;
    const API_KEY = "your_api_key here"
    const main_prompt = generate_prompt(document.getElementById('ai-input').value);
    const apiUrl = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key="+API_KEY+"";

    const requestBody = {
    contents: [
        {
            parts: [
                { text: main_prompt }
            ]
        }
    ]
    };

    fetch(apiUrl, {
    method: "POST",
    headers: {
        "Content-Type": "application/json"
    },
    body: JSON.stringify(requestBody)
    })
    .then(response => response.json())
    .then(data => {
        console.log("Response from API:", data);
        console.log(data.candidates[0].content.parts[0].text)

        document.getElementById('loading-wrapper').style.display = "none";
        document.getElementById('response-box').innerHTML = pretty_text(data.candidates[0].content.parts[0].text);
        document.getElementById('response-box').style.display = "block";
    
    })
    .catch(error => {
        console.error("Error:", error);
        document.getElementById('loading-wrapper').style.display = "none";
        document.getElementById('response-box').innerHTML = pretty_text("Our AI Model is overloaded :( please try again later...");
        document.getElementById('response-box').style.display = "block";

    });


}

    </script>
</head>
<body>
    

    <div class="search-wrapper">
        <div id = "page-name"><a href="/dsw">SnapCart</a></div>
        <div>
        <!-- <span style = "font-weight : 600; margin-right : 1vh;"> Hello <?php echo $_COOKIE['web-cookie']; ?>😄</span>     -->
        <input type="text" id = "main-search" placeholder="What are you looking for 🔎" autocomplete = "off" oninput = "search();"></div>
        <div id = "button-wrapper">
                <button onclick="window.location.href='/dsw/checkout.php'" id = 'cart-button'>🛒</button>
                <button style="background-color: red;" onclick="localStorage.removeItem('cart-data'); window.location.href='/dsw/logout.php'" id = 'logout-button' >Logout</button>
        </div> 
        <div id="suggestions-wrapper" style = "display : none;">

        </div> 

    </div>


    <main>
        <section class="product-list" id = "main-wrapper">

     

        <?php 

    if (isset($_GET['id'])) 
    {
    $id = $_GET['id'];

    $machine = "localhost";
    $user = "root";
    $password = "";
    $db_name = "main";
    $connection = mysqli_connect($machine , $user , $password , $db_name);
    if (!$connection)
	    echo "Could not connect";

    $main_query = "select * from products where id = $id;";
    $result = mysqli_query($connection , $main_query);

    $extensions = ['webp', 'jpeg', 'jpg', 'avif' , 'png'];


    if (mysqli_num_rows($result) > 0)
    {
    while ($current_row = mysqli_fetch_assoc($result))
    {
        echo "<div id = \"show-main-wrapper\">";
        echo "<div id = \"show-image-wrapper\">";

        $imagePath = null;
        foreach ($extensions as $ext) 
        {
        if (file_exists("assets/images/{$current_row['id']}.$ext")) 
        {
        $imagePath = "assets/images/{$current_row['id']}.$ext";
        break;
        }
        }

        echo "<img src =\"$imagePath\" id = \"main-image\"/>"; 
        echo "<div id = \"color-wrapper\">";

        echo "<div id = 'ai-main-wrapper'>";

        echo "<div id = 'ai-wrapper'>";
        echo "<input type = 'text' id = 'ai-input' placeholder = 'Issues Regarding Product ? Ask Joey !' />";
        echo "<button id = 'ai-button' onclick ='handle_fetch();'>  🐶 </button>";
        echo "</div>";

        echo "<div id = 'loading-wrapper'> <div> Fetching Response </div>";
        echo "<img src = 'assets/icons/joey.gif' id = 'ai-loading' /> </div>";

        echo " <div id = 'response-box' style = 'display : none;'></div>";

        


        echo "</div>";


        echo "</div>";
        echo "</div>";
        echo "<div id = \"show-details-wrapper\">";
        echo "<div id = \"pname\">{$current_row['name']}</div>";
        echo "<div class = \"details\"> {$current_row['price']}$ </div>";
        echo "<div class = \"details\"> Rating : ⭐⭐⭐⭐</div>";
        echo "<div class = \"desc\" id = 'product-description'> {$current_row['description']} </div>";
        echo "<div  id = 'add-button'> <button id ='add-to-cart-button' onclick = 'add_to_cart();'> Add To Cart 🛒 </button> <button id ='back-button' onclick=\"window.location.href='http://localhost/dsw'\"> Back To Home </button> </div>";
        
        echo "
        <div class = 'review-meta'>
            <div class = 'meta-header'> Reviews </div>
            <div>
            <button id = 'add-review-button' onclick = 'document.getElementById(\"new-review-wrapper\").style.display = \"flex\"; document.getElementById(\"add-review-button\").style.display = \"none\"; '> Add Review </button>
        </div>
        </div>
        ";
        

        echo "<div id = 'new-review-wrapper'> 
        <textarea placeholder = 'Add your review here ' id = 'review-box'></textarea>
        <button onclick = 'add_review(); document.getElementById(\"new-review-wrapper\").style.display = \"none\"; document.getElementById(\"add-review-button\").style.display = \"block\"; ' >Add </button>
        </div>";
        
        $review_query = "select * from reviews where product_id = ".$current_row['id'].";";
        $review_result = mysqli_query($connection , $review_query);



        $review_container = array();
        if (mysqli_num_rows($review_result) > 0)
        {
        while ($current_review = mysqli_fetch_assoc($review_result))
            {
            $review_container[] = $current_review;
            }
        }
        $review_container = array_reverse($review_container , true);

        echo "<span id = 'review-span-wrapper'>";
        foreach ($review_container as $current_review)
        {
                echo "<div class='review-wrapper'>
                <div class='review-author'>" .
                "<img class = 'review-user-image' src = 'assets/background/user.jpg'/>".
                "<div>". $current_review['author_name']."</div>" .
                "</div>
                
                <div class='review-content'>" . $current_review['review_content'] . "</div>
                </div>";
        }
        echo "</span>";

        

        echo "</div>";
        echo "</div>";  
    }
    }

    } 
    
?> 


        </section>
    </main>

</body>
</html>

