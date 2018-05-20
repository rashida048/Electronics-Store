<?php

if(!isset($_SESSION['admin_email'])){
  echo "<script>window.open('login.php','_self')</script>";
} else {


?>

<!DOCTYPE html>
<html>
<head>
  <title>View Costomers</title>
  <style type="text/css">
  th,tr{border:3px groove #333;}
  </style>
</head>
<body>
<table width="794" align="center" bgcolor="#FFCC99">
<tr align="center">
  <td colspan="6"><h2>View All Orders</h2></td>
</tr>

<tr align="center">
<th>Order No.</th>
<th>Customer</th>
<th>Invoice No.</th>
<th>Product ID</th>
<th>Qty</th>
<th>Status</th>
<th>Delete</th>
</tr>

<?php
include("includes/db.php");

$get_orders = "select * from pending_orders";
$run_orders = mysqli_query($con,$get_orders);

$i=0;
while($row_orders=mysqli_fetch_array($run_orders)) {

$order_id = $row_orders['order_id'];
$c_id = $row_orders['customer_id'];
$invoice = $row_orders['invoice_no'];
$p_id = $row_orders['product_id'];
$qty = $row_orders['qty'];
$status = $row_orders['order_status'];

$i++;

?>
<tr align="center">
<td><?php echo $i; ?></td>
<td>
<?php
$get_customer = "select * from customers where customer_id = '$c_id'";

$run_customer = mysqli_query($con,$get_customer);

$row_customer=mysqli_fetch_array($run_customer);

$customer_email=$row_customer['customer_email'];

echo $customer_email;
?>
</td>
<td bgcolor="#FFCCCC"><?php echo $invoice; ?></td>
<td><?php echo $p_id; ?></td>
<td><?php echo $qty; ?></td>
<td><?php
if($status=='Pending'){
  echo $status = 'Pending';
}
else {
  echo $status = 'Complete';
}
?></td>
<td><a href="delete_order.php?delete_order=<?php echo $order_id; ?>">Delete</a></td>
</tr>
<?php } ?>

</table>

</body>
</html>

<?php } ?>
