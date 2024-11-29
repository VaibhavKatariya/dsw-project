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
    function handle_login()
    {
        event.preventDefault();
        const form_reference = document.forms.loginForm
        const email = form_reference.email.value;
        const password = form_reference.password.value;

        const data = {
            email , password
        }

        fetch('login_user.php', 
                {
                method: 'POST',
                headers: {
                'Content-Type': 'application/x-www-form-urlencoded' 
                },
                body: new URLSearchParams(data) 
                })
                .then(response => 
                {
                    console.log(response.status)
                    if (response.status == 400)
                        window.alert("Error : Email ID does not exist !")
                    else if (response.status == 401)
                        window.alert("Error : Invalid password !")
                    else
                        window.location.href = "/dsw"
                }).catch(err => 
                {
                    window.alert("there is some error ")
                }
                )
    }
    </script>
</head>
<body style="font-family: Poppins; ">
    <div class="login-container" >
        <h2>Login</h2>
        <form id="loginForm" onsubmit="handle_login()">
            <div class="input-group">
                <label for="email">Email ID</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" id = "page-button">Submit 🌐</button>
            <p id = "create-display" onclick = "window.location.href = '/dsw/signup.php'">Do not have an account ? Create one</p>
        </form>
    </div>
    <script src="script.js"></script>
</body>
</html>
