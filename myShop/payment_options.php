<!DOCTYPE html>
<html>
<head>
<title>Payment Options</title>

	</head>
	
	<body>


<?php

include("includes/db.php");

?>

<div align="center" style="padding:20px;">

<h2>Payment Options for you</h2>

<?php
	
	$ip = getRealIpAddr();
	
	$get_customer = "select * from customers where customer_ip='$ip'";
	
	$run_customer = mysqli_query($con, $get_customer);
	
	$customer = mysqli_fetch_array($run_customer);
	
	$customer_id = $customer['customer_id'];
	
?>
	
	<b> Pay with</b>&nbsp;<a href="http://www.paypal.com"><img src="customer/paypal.png" width="200" height="80"><b></a>Or <a href="order.php?c_id=<?php echo $customer_id;?>">Pay Offline</a></b><br><br><br>
	<b>If you select "Pay Offline" option then please check your email or account to find the invoice No. for your order</b>
	
</div>


	</body>
	
</html>