<?php

if(!isset($_SESSION['admin_email'])){
  echo "<script>window.open('login.php','_self')</script>";
} else {

?>

<!DOCTYPE html>
<html>
<head>
  <title>Insert Brands</title>
  <style type="text/css">
  form {margin:15%;}
  </style>
</head>

<body>

  <form action="" method="post">

    <b>Insert New Brand</b><input type="text" name="brand_title" />
    <input type="submit" name="insert_brands" value="Insert Brand" />

  </form>
</body>
</html>

<?php

if(isset($_POST['insert_brands'])){

  $brand_title = $_POST['brand_title'];

  $insert_brand = "insert into brands (brand_title) values ('$brand_title')";

  $run_brand = mysqli_query($con, $insert_brand);

  if($run_brand){

    echo "<script>alert('New Brand has been inserted!')</script>";
    echo "<script>window.open('index.php?view_brands','_self')</script>";
  }
}


} ?>
