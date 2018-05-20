<?php
session_start();
include("includes/db.php");
?>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Login</title>
  <link rel="stylesheet" href="login.css" media="all" />
</head>

<div class="login">
  <h1>Admin Login</h1>
  <form method="post">
    <input type="text" name="admin_eamil" placeholder="Username" id="username" required>
  <input type="password" name="admin_name" placeholder="Password" id="password" required>
  <button type="submit" name="login">Admin Login</button>
  </form>
</div>
<div class="shadow"></div>

</body>
</html>

<?php
if(isset($_POST['login'])){

  $user_email = $_POST['admin_eamil'];
  $user_pass = $_POST['admin_name'];

  $sel_admin = "select * from admins where admin_email='$user_email' and admin_pass='$user_pass'";
  $run_admin = mysqli_query($con,$sel_admin);

  $check_admin = mysqli_num_rows($run_admin);

  if($check_admin==1){

    $_SESSION['admin_email'] = $user_email;

    echo "<script>window.open('index.php?logged_in=You are successfully logged in','_self')</script>";
  } else {
    echo "<script>alert('Admin Email or Password is incorrect, try again')</script>";
  }
}

?>
