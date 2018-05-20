<?php
session_start();
include("includes/db.php");
include("functions/functions.php");

?>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>My Shop</title>
<link rel="stylesheet" href="style/style.css" media="all" />
</head>

<body>

<div class="main_wrapper">
<div class="header_wrapper">
<a href="index.php"><img src="images/techshop-madison-logo.gif" style="float:left"></a>
<img src="images/logo.jpg" style="float:right">
<!--<img src="images/paypal-logo.png">-->


</div>

	<div id="navbar">

		<ul id="menu">
			<li><a href="index.php">Home</a></li>
			<li><a href="all_products.php">All Products</a></li>
			<li><a href="my_account.php">My Account</a></li>
			<li><a href="user_registration.php">Sign Up</a></li>
			<li><a href="cart.php">Shopping Cart</a></li>
			<li><a href="contact.php">Contact Us</a></li>
		</ul>

	<div id="form">
		<form method="get" action="results.php" enctype="multipart/form-data">
			<input type="text" name="user_query" placholder="Search a Product"/>
			<input type="submit" name="search" value="Search" />

		</form>
	</div>


	</div>
	<div class="content_wrapper">
		<div id="left_sidebar">
			<div id="sidebar_title">Categories</div>
				<ul id = "cats">

				<?php getCats(); ?>

				</ul>
			<div id="sidebar_title">Brands</div>

			<ul id = "cats">
					<?php getBrands(); ?>

				</ul>

		</div>

		<div id="right_content">
		<?php
			cart(); 						
		?>
			<div id="headline">
				<div id="headline_content">

					<?php
					if(!isset($_SESSION['customer_email']))
					{
						echo "<b> Welcome Guest!<b> <b style='color:yellow'>Shopping Cart </b>";
					}
					else {
						echo "<b>Welcome:" . "<span style='color:sky blue'>" . $_SESSION['customer_email'] . "</span>". "</b>" . "<b style='color:yellow'>Your Shopping Cart </b>";
					}
					?>

					<span>- Total Items: <?php items(); ?> - Total Price: <?php total_price(); ?> - <a href="index.php" style="color:#FF0;">Continue Shopping</a>&nbsp;

					<?php

						if(!isset($_SESSION['customer_email'])){

							echo "<a href='checkout.php' style='color:#F93;'>Login</a>";
						}

						else {
							echo "<a href='logout.php' style='color:#F93;'>Logout</a>";
						}

					?>
					</span>
				</div>
			</div>


			<div id="products_box">
			<form action="cart.php" method="post" enctype="multipart/form-data">

				<table width="740" align="center" bgcolor="#0099CC">

					<tr align="center">
						<td><b>Remove</b></td>
						<td><b>Product(s)</b></td>
						<td><b>Quantity</b></td>
						<td><b>Total Price</b></td>
					</tr>

					<?php


//getting the total price of the items from the cart

	$ip_add = getRealIpAddr();

	$total = 0;

	$sel_price = "select * from cart where ip_add='ip_add'";

	$run_price = mysqli_query($con, $sel_price);

	while ($record = mysqli_fetch_array($run_price)){

		$pro_id = $record['p_id'];

		$pro_price = "select * from products where product_id = '$pro_id'";

		$run_pro_price = mysqli_query($con, $pro_price);

		while ($p_price = mysqli_fetch_array($run_pro_price)){

			$product_price = array($p_price['product_price']);
			$product_title = $p_price['product_title'];
			$product_image = $p_price['product_img1'];
			$only_price = $p_price['product_price'];

			$values = array_sum($product_price);

			$total +=$values;


?>

					<tr>
						<td><input type="checkbox" name="remove[]" value="<?php echo $pro_id; ?>"></td>
						<td><?php echo $product_title; ?><br><img src="admin_area/product_images/<?php echo $product_image; ?>" height="80" width="80"></td>
						<td><input type="text" name="qty" value="" size="3"/></td>

						<?php

						if(isset($_POST['update'])){
							$qty = $_POST['qty'];

							$insert_qty = "update cart set qty='$qty' where ip_add='$ip_add'";

							$run_qty = mysqli_query($con, $insert_qty);

							$total = $total*$qty;
						}

							?>

						<td><?php echo "$" . $only_price; ?></td>
					</tr>
					<?php }} ?>

					<tr>

						<td colspan="3" align="right"><b>Sub Total:</b></td>
						<td><b><?php echo "$" . $total; ?></b></td>
					</tr>
					<tr></tr>
					<tr>
						<td colspan="2"><input type="submit" name="update" value="Update Cart"/></td>
						<td><input type="submit" name="continue" value="Continue Shopping"/></td>
						<td><button><a href="checkout.php" style="text-decoration:none; color:#000;">Checkout</a></button></td>
					</tr>

				</table>

			</form>
			<?php

				function updatecart() {

					global $con;

				if(isset($_POST['update'])){

					foreach($_POST['remove'] as $remove_id)
					{
						$delete_products = "delete from cart where p_id='$remove_id'";

						$run_delete = mysqli_query($con, $delete_products);

						if($run_delete)
						{
							echo "<script>window.open('cart.php','_self')</script>";
						}

					}


				}

				if(isset($_POST['continue'])){
						echo "<script>window.open('index.php','_self')</script>";
					}
				}
				echo @$up_cart = updatecart();

				?>

	</div>
		</div>
		</div>




</div>

</body>
</html>
