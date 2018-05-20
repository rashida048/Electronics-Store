<?php
if(!isset($_SESSION['admin_email'])){
  echo "<script>window.open('login.php','_self')</script>";
} else {

?>
<!DOCTYPE html>
<html>
<head>
  <title>View categories</title>
  <style type="text/css">
  tr,th {border:3px groove #000;}
  </style>
</head>

<body>
  <table width="794" align="center" bgcolor="#FFCCCC">
    <tr align="center">
      <td colspan="4"><h2>View All Brands</h2></td>
    </tr>

    <tr align="center">
      <th>Brand ID</th>
      <th>Brand Title</th>
      <th>Delete</th>
      <th>Edit</th>
    </tr>

    <?php
    include("includes/db.php");

    $get_brands = "select * from brands";
    $run_brands = mysqli_query($con,$get_brands);

    while ($row_brands=mysqli_fetch_array($run_brands)){

      $brand_id = $row_brands['brand_id'];
      $brand_title = $row_brands['brand_title'];

    ?>

    <tr align="center">
      <td><?php echo $brand_id; ?></td>
      <td><?php echo $brand_title; ?></td>
      <td><a href="index.php?edit_brand=<?php echo $brand_id; ?>">Edit</a></td>
      <td><a href="delete_brand.php?delete_brand=<?php echo $brand_id; ?>">Delete</a></td>
    </tr>

    <?php } ?>

  </table>
</body>
</html>
<?php } ?>
