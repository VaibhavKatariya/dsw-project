<?php
setcookie("web-cookie", "", time() - 3600, "/");
setcookie("uid" , "" , time() - 3600 , "/");
setcookie("admin" , "" , time() - 3600 , "/");

header("Location: /dsw");
exit();
?>
