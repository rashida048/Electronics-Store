<?php

if(!isset($_SESSION['admin_email'])){
  echo "<script>window.open('login.php','_self')</script>";
} else {


include("includes/db.php");
if(isset($_GET['delete_pro'])){
  $delete_id=$_GET['delete_pro'];

  $delete_pro = "delete from products where product_id='$delete_id'";

  $run_delete = mysqli_query($con,$delete_pro);

  if($run_delete){

    echo "<script>alert('One product has been deleted!')</script>";
    echo "<script>window.open('index.php?view_products','_self')</script>";
  }
}
} ?>
