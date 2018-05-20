<?php
if(!isset($_SESSION['admin_email'])){
  echo "<script>window.open('login.php','_self')</script>";
} else {


?>

<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <title>View Products</title>

  <style type="text/css">
  th tr {border:3px groove #000;}
  table {border: 2px solid #000;}
  </style>

</head>
<body>

  <?php
  if(isset($_GET['view_products'])) {

   ?>

  <table align="center" width="794" bgcolor="#FFCC99">

    <tr align="center">

      <td colspan="8"><h2>View All Products</h2></td>
    </tr>

    <tr>
      <th>Product ID</th>
      <th>Title</th>
      <th>Image</th>
      <th>Price</th>
      <th>Total Sold</th>
      <th>Status</th>
      <th>Edit</th>
      <th>Delete</th>
    </tr>

    <?php

    include("includes/db.php");

    $i=0;

    $get_pro = "select * from products";

    $run_pro = mysqli_query($con, $get_pro);

    while ($row_pro=mysqli_fetch_array($run_pro)) {
      $p_id = $row_pro['product_id'];
      $p_title = $row_pro['product_title'];
      $p_img = $row_pro['product_img1'];
      $p_price = $row_pro['product_price'];
      $p_status = $row_pro['status'];

      $i++;

    ?>

    <tr align="center">
      <td><?php echo $i; ?></td>
      <td><?php echo $p_title; ?></td>
      <td><img src="product_images/<?php echo $p_img; ?>" width="50" height="50"></td>
      <td><?php echo $p_price; ?></td>
      <td>

        <?php
        $get_sold = "select * from pending_orders where product_id='$p_id'";
        $run_sold = mysqli_query($con,$get_sold);

        $count = mysqli_num_rows($run_sold);

        echo $count;

        ?>
      </td>
      <td><?php echo $p_status; ?></td>
      <td><a href="index.php?edit_pro=<?php echo $p_id; ?>">Edit</td>
      <td><a href="delete_pro.php?delete_pro=<?php echo $p_id; ?>">Delete</td>
    </tr>

    <?php } ?>
    </table>

    <?php } ?>


</body>

<?php } ?>
