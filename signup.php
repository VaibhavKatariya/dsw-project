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
    function handle_signup()
    {
        event.preventDefault();
        const form_reference = document.forms.signupForm
        const name = form_reference.name.value;
        const mobile = form_reference.mobile.value;
        const email = form_reference.email.value;
        const password = form_reference.password.value;
        const confirm_password = form_reference.confirmPassword.value;

        if (password != confirm_password)
        {
            document.getElementById('warning').style.display = "block";
            document.getElementById('password').style.border = "1px solid red";
            document.getElementById('confirmPassword').style.border = "1px solid red";
            return;
        }

        console.log(name , mobile , email , password , confirm_password)

        const data = {
            name , mobile , email , password
        }

        fetch('create_user.php', 
                {
                method: 'POST',
                headers: {
                'Content-Type': 'application/x-www-form-urlencoded' 
                },
                body: new URLSearchParams(data) 
                })
                .then(response => 
                {
                    if (response.status != 200)
                        window.alert("Error : Email ID is already registered !")
                    else
                        window.location.href = "/dsw"
                })  
    }
    </script>

</head>
<body style="font-family: Poppins;">
    <div class="signup-container">
        <h2>Sign Up</h2>
        <form id="signupForm" onsubmit="handle_signup()">
            <div class="input-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="input-group">
                <label for="mobile">Mobile</label>
                <input type="text" id="mobile" name="mobile" required>
            </div>
            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="input-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>
            <span id = "warning" style = "color : red; display : none;"> The given passwords do not match ! </span>

            <button type="submit" id = "page-button">Submit 🌐</button>
        </form>
        <p id = "create-display" onclick = "window.location.href = '/dsw/login.php'">Already have an account ? Login</p>
    </div>
    <script src="script.js"></script>
</body>
</html>
