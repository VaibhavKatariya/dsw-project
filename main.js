
    const ad_id = [1 , 5 ,31 , 22 , 21];

    function add_to_cart()
    {
        event.stopPropagation();
        console.log("here");
        const cart_button = document.getElementById('cart-button');
        cart_button.classList.add("active");
        setTimeout(() => {
            cart_button.classList.remove("active");
            console.log("removing")
        } , 1000);

        var cart_data = localStorage.getItem('cart-data');
        if (cart_data === null)
        {
            localStorage.setItem('cart-data' , JSON.stringify([]))
            cart_data = localStorage.getItem('cart-data');
        }
        cart_data = JSON.parse(cart_data)
        cart_data.push(event.target.parentNode.id.split('-')[1])
        
        localStorage.setItem('cart-data' , JSON.stringify(cart_data))
    }

    function handle_filter()
    {
        document.getElementById('filter-header').style.display = "flex";
        document.getElementById('filter-header-main').innerText = event.target.innerText;
        
        const filter_criteria = event.target.innerText.toLowerCase();
        const main_wrapper = document.getElementById('main-wrapper')

        for (var i = 1 ; i < main_wrapper.childNodes.length - 1 ; i++)
        {
            var current_item = main_wrapper.childNodes[i];
            var current_item_category = current_item.childNodes[4].innerText;
            if (filter_criteria != current_item_category)
                current_item.style.display = "none";
            else
                current_item.style.display = "block";
        }

    }

    function remove_filter()
    {
        document.getElementById('filter-header').style.display = "none";
        const main_wrapper = document.getElementById('main-wrapper')

        for (var i = 1 ; i < main_wrapper.childNodes.length - 1 ; i++)
        {
            var current_item = main_wrapper.childNodes[i];
            current_item.style.display = "block";
        }

    }

    function handle_ad_left()
    {
        const container_ref = document.getElementById(event.target.parentNode.id);
        var next_id;
        if (event.target.parentNode.id == 0)
            next_id = ad_id.length - 1;
        else
            next_id = Number(event.target.parentNode.id) - 1;

        const left_thumbnail = document.getElementById("thumbnail-left")
        const right_thumbnail = document.getElementById("thumbnail-right")

        var left_thumbnail_id , right_thumbnail_id;
        right_thumbnail_id = container_ref.id;
        
        container_ref.id = next_id; 

        if (container_ref.id == 0)
            left_thumbnail_id = ad_id.length - 1;
        else
            left_thumbnail_id = Number(event.target.parentNode.id) - 1;  


        console.log(left_thumbnail_id)

        left_thumbnail.src = "http://localhost/dsw//assets/advertisements/preview_" + ad_id[left_thumbnail_id] + ".jpeg";
        right_thumbnail.src = "http://localhost/dsw//assets/advertisements/preview_" + ad_id[right_thumbnail_id] + ".jpeg";
        
        left_thumbnail.onclick = function()
        {
            window.location.href='http://localhost/dsw/showProduct.php?id=' + ad_id[left_thumbnail_id]
        }
        right_thumbnail.onclick = function()
        {
            window.location.href='http://localhost/dsw/showProduct.php?id=' + ad_id[right_thumbnail_id]
        }

        var video_ref = document.getElementById('video-src-wrapper');
        var video_source_ref = document.getElementById('video-src-main');
        

        const new_ad_video_source = "assets/advertisements/" + ad_id[next_id] + ".mp4";
        const new_page_source = "http://localhost/dsw/showProduct.php?id=" + ad_id[next_id];

        video_ref.onclick = function ()
        {
            window.location.href = new_page_source; 
        }
        video_source_ref.src = new_ad_video_source
        video_ref.load();
        
    }

    function handle_ad_right()
    {
        const container_ref = document.getElementById(event.target.parentNode.id);
        console.log(container_ref)
        var next_id;
        if (event.target.parentNode.id == ad_id.length - 1)
            next_id = 0;
        else
            next_id = Number(event.target.parentNode.id) + 1;
        
        const left_thumbnail = document.getElementById("thumbnail-left")
        const right_thumbnail = document.getElementById("thumbnail-right")

        var left_thumbnail_id , right_thumbnail_id;
        left_thumbnail_id = container_ref.id;
        
        container_ref.id = next_id; 
        
        if (container_ref.id == ad_id.length - 1)
            right_thumbnail_id = 0;
        else
            right_thumbnail_id = Number(event.target.parentNode.id) + 1;            


        left_thumbnail.src = "http://localhost/dsw//assets/advertisements/preview_" + ad_id[left_thumbnail_id] + ".jpeg";
        right_thumbnail.src = "http://localhost/dsw//assets/advertisements/preview_" + ad_id[right_thumbnail_id] + ".jpeg";
        
        left_thumbnail.onclick = function()
        {
            window.location.href='http://localhost/dsw/showProduct.php?id=' + ad_id[left_thumbnail_id]
        }
        right_thumbnail.onclick = function()
        {
            window.location.href='http://localhost/dsw/showProduct.php?id=' + ad_id[right_thumbnail_id]
        }
        

        var video_ref = document.getElementById('video-src-wrapper');
        var video_source_ref = document.getElementById('video-src-main');
        
        const new_ad_video_source = "assets/advertisements/" + ad_id[next_id] + ".mp4";
        const new_page_source = "http://localhost/dsw/showProduct.php?id=" + ad_id[next_id];

        video_ref.onclick = function ()
        {
            window.location.href = new_page_source; 
        }
        video_source_ref.src = new_ad_video_source
        video_ref.load();
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