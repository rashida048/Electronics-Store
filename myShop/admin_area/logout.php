<?php
session_start();

session_destroy();

echo "<script>window.open('login.php?logout=You successfully logged out, Come back soon!','_self')</script>";


?>
