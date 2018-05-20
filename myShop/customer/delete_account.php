<form action="" method="post">

  <table width="600" align="center">

    <tr align="center">
      <td colspan="2"><h2>Do you really want to delete your account?</h2></td>
    </tr><br>

    <tr align="center">
      <td><input type="submit" name="yes" value="Yes, I want to Delete">
      <input type="submit" name="no" value="No, I Do Not Want to Delete">
      </td>

    </tr>

  </table>
</form>

<?php

include("includes/db.php");

$c = $_SESSION['customer_email'];

if(isset($_POST['yes'])){

  $delete_customer = "delete from customers where customer_email='$c'";
  $run_delete = mysqli_query($con, $delete_customer);

  if($run_delete){
    session_destroy();
    echo "<script>alert('Your Account has been deleted, We are sorry to see you go!')</script>";
    echo "<script>window.open('../index.php','_self')</script>";
  }
}

if(isset($_POST['no'])){
  echo "<script>window.open('my_account.php','_self')</script>";
}


?>
