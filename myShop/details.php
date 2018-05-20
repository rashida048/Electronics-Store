<?php
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
			<div id="headline">
				<div id="headline_content">
					<b>Welcome Guest!</b>
					<b style="color:yellow;">Shopping Cart:</b>
					<span>- Items: - Price:</span>
				</div>
			</div>
			
			<div id="products_box">
			<?php
				
				if(isset($_GET['pro_id'])){
					
					$product_id = $_GET['pro_id'];
	
				$get_products = "select * from products where product_id = '$product_id'";
				
				$run_products = mysqli_query($db, $get_products);
				
				while ($row_products=mysqli_fetch_array($run_products)){
					$pro_id = $row_products['product_id'];
					$pro_title = $row_products['product_title'];
					
					$pro_desc = $row_products['product_desc'];
					$pro_price = $row_products['product_price'];
					$pro_image1 = $row_products['product_img1'];
					$pro_image2 = $row_products['product_img2'];
					$pro_image3 = $row_products['product_img3'];
					
					echo "
					<div id='single_product'>
					<h3>$pro_title</h3>
					<img src='admin_area/product_images/$pro_image1' width='180' height = '180'/>
					<img src='admin_area/product_images/$pro_image2' width='250' height = '250'/>
					<img src='admin_area/product_images/$pro_image3'
					width='250' height = '250'/><br>
					
					<p><b>Price: $ $pro_price<b></p>
					
					<p>$pro_desc</p>
					
					<a href='index.php?pro_id=$pro_id' style='float:left;'>Go Back</a>
					
					<a href='index.php?add_cart=$pro_id' <button style='float:right;'>Add to Cart</button></a>
					
					
					</div>
					";
					
				}
				}

?>
				
			</div>
			
		</div>
		
	</div>
	
		
	
</div>

</body>
</html>