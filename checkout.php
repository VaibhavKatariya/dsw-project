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
    <link rel="stylesheet" href="styles.css">
    <link rel="icon" href="assets/icons/main_icon.webp" type="image/webp">


    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<script>


function handle_order_place()
{

    if (document.getElementById('cart-wrapper').childNodes.length ==  3)
    {
        window.alert("Cannot place order as the cart is empty!")
        return;
    } 

    var uid = "";
    const cookies = document.cookie.split(';');
    for (let cookie of cookies) 
    {
        let [key, value] = cookie.trim().split('=');
        if (key === "uid") uid = value;
    }
    
    console.log("this is the value of the uid " , uid);

    var pid_list = "";
    for (var i = 3 ; i < document.getElementById('cart-wrapper').childNodes.length ; i++ )
    {
        pid_list +=  document.getElementById('cart-wrapper').childNodes[i].id + ",";

    }
    
    pid_list = pid_list.slice(0 , -1);
    const data = 
    {
            uid,
            pid_list ,
    }
    
    fetch('add_order.php', 
        {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded' 
        },
        body: new URLSearchParams(data) 
        }).then(response => 
        {
                window.alert("Congratulations , The order has been placed ! ");
                window.alert("Routing back to the home page");
                localStorage.removeItem('cart-data');
                window.location.href = "/dsw";
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

        var cart_data = localStorage.getItem('cart-data');
        if (cart_data === null)
            console.log("The cart is empty !!")
        else
        {
            cart_data = JSON.parse(cart_data)
            if (cart_data.length == 0)
                console.log("The cart is empty !!")
            else
            {

                var compare_constraint_string = "(";
                for (var i = 0 ; i < cart_data.length ; i++)
                compare_constraint_string += " " + cart_data[i] + " ,";
                
                compare_constraint_string = compare_constraint_string.slice(0 , -1);
                compare_constraint_string += ")";


                const data = {
                    checkout_items : compare_constraint_string
                }

                fetch('checkout_helper.php', 
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

                var total_price = 0
                for (var i = 0 ; i < information.length ; i++)
                {
                    const cartItem = document.createElement('div');
                    cartItem.classList.add('cart-item');
                    cartItem.id = information[i].id;
                    const cartImage = document.createElement('img');
                    cartImage.classList.add('cart-image');
                    cartImage.src = information[i].img;  

                    const cartName = document.createElement('div');
                    cartName.classList.add('cart-name');
                    cartName.textContent = information[i].name;  

                    const wrapper_div = document.createElement('div')
                    wrapper_div.classList.add('cart-price-wrapper')



                    const cartPrice = document.createElement('div');
                    cartPrice.classList.add('cart-price');
                    cartPrice.textContent = information[i].price + " $";  
                    total_price += Number(information[i].price)

                    const button_wrapper = document.createElement('button');
                    button_wrapper.classList.add('delete-button')
                    button_wrapper.innerText = "🗑️";
                    button_wrapper.onclick = function()
                    {
                        const remove_id = event.target.parentNode.parentNode.id
                        var cart_data = localStorage.getItem('cart-data');
                        cart_data = JSON.parse(cart_data)

                        cart_data = cart_data.filter(item_id => item_id != remove_id)

                        if (cart_data.length == 0)
                            document.getElementById('payment-detail-wrapper').style.display = "none";
                        localStorage.setItem('cart-data' , JSON.stringify(cart_data))

                        var deleted_item_price = Number(document.getElementById(remove_id).childNodes[2].childNodes[0].innerText.split(' ')[0])
                        var prev_total_price = Number(document.getElementById('value-total').innerText) 

                        var new_price = Number((prev_total_price - deleted_item_price).toFixed(2));

                        document.getElementById('value-total').innerText = new_price;
                        document.getElementById('tax-total').innerText = ((15 / 100) * new_price).toFixed(2);
                        document.getElementById('payable-total').innerText = (new_price + (15 / 100) * new_price + 10).toFixed(2);
                        
                        document.getElementById(remove_id).remove();

                    }

                    wrapper_div.appendChild(cartPrice)
                    wrapper_div.appendChild(button_wrapper)

                    cartItem.appendChild(cartImage);
                    cartItem.appendChild(cartName);
                    cartItem.appendChild(wrapper_div);

                    document.getElementById('cart-wrapper').appendChild(cartItem);

                }

                if (information.length != 0)
                {
                    document.getElementById('payment-detail-wrapper').style.display = "flex";
                    document.getElementById('value-total').innerText = total_price.toFixed(2);
                    document.getElementById('tax-total').innerText = ((15 / 100) * total_price).toFixed(2);
                    document.getElementById('payable-total').innerText = (total_price + (15 / 100) * total_price + 10).toFixed(2);
                }

                })
            }
        }
    </script>
</head>
<body>
    
    <div class="search-wrapper">
    <div id = "page-name"><a href="/dsw">SnapCart</a></div>
        <div><input type="text" id = "main-search" placeholder="What are you looking for 🔎" autocomplete = "off" oninput = "search();"></div>
        <div id = "button-wrapper">
                <button style="background-color: black; color : white;" onclick="window.location.href='/dsw'">Home </button>
                <button style="background-color: red;"  onclick="localStorage.removeItem('cart-data'); window.location.href='/dsw/logout.php'" >Logout</button>
        </div> 
        <div id="suggestions-wrapper" style = "display : none;">

        </div> 

    </div>


    <div class="checkout-container" >
        <h2>Checkout Details</h2>
        <div id = 'cart-wrapper'>
            <div class = "cart-header-row">
                <div></div>
                <div>Item</div>
                <div>Price</div>
            </div>
        </div>
        <div id = "payment-detail-wrapper" style = "display : none;">
            <div class = "payment-internal"><span class = "payment-header">Total Price </span> : <span id = "value-total">  </span> $</div>
            <div class = "payment-internal"><span class = "payment-header">Tax (15%) </span> : <span id = "tax-total">   </span> $ </div>
            <div class = "payment-internal"><span class = "payment-header">Delivery Charges</span>  :  10 $ </div>
            <div class = "payment-internal"><span class = "payment-header">Payable</span>  : <span id = "payable-total">   </span> $ </div>
        </div>
        <button type="submit" id = "page-button" onclick=  "handle_order_place();">Place Order</button>

    </div>

    
   

    
    <script src="script.js"></script>
</body>
</html>