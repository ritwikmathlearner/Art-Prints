<?php
error_reporting(0);
session_start();
include 'connection.php';
$orderID = $_SESSION["order"];
$customer  = $_SESSION["customer"];
$email = $_SESSION["customer_email"];
$sql = "SELECT product.productID as productNo, name, artist, price, image, qnatity, po.cost as productCost, o.cost as orderCost, totalAmount  FROM product inner join productordered po on product.productID = po.productID inner join orders o on po.orderID = o.orderID where o.orderid = $orderID";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="./css/style.css">
    <title>Arts Print - Cart</title>
</head>
<body>
    <div class="navigation">
            <div class="nav-top">
                <ul>
                <?php 
                        if(isset($_SESSION["customer"])) {
                    ?>
                        <li><a href="logout.php">logout</a></li>
                        <li><span class="dot"></span></li>
                        <li><a href="#"><?php echo $_SESSION["customer"] ; ?></a></li>
                    <?php 
                        } else {
                    ?>
                        <li><a href="login.php">login</a></li>
                        <li><span class="dot"></span></li>
                        <li><a href="register.php">create account</a></li>
                    <?php } ?>
                </ul>
            </div>
            <div class="navbar">
                <div class="logo">
                    art print.
                </div>
                <ul>
                    <li><a href="index.php">Home</a></li>
                    <li><a href="artprints.php">Art Prints</a></li>
                    <li><a href="contact.php">Contact</a></li>
                    <li><a href="cart.php" class="active">Cart
                        <?php
                        $orderID = $_SESSION["order"];
                         $sql_check2 = "Select cost from orders Where orderID = $orderID";
                         $result_check2 = $conn->query($sql_check2);
                         if ($result_check2->num_rows > 0) {
                             while($row = $result_check2->fetch_assoc()) {
                                 $current_cost = $row["cost"];
                                 echo '(' . $current_cost .')';
                             }
                         }
                        ?>
                    </a></li>
                </ul>
            </div>
        </div>
        <div class="cart-container">
        <?php 
        if(isset($_SESSION["error"])) {
        echo '<h1 class="error" style="text-align: center;">';
        echo $_SESSION["error"]; 
        unset($_SESSION["error"]);
        echo '</h1>';
        header( "refresh:1;url=cart.php" );
        } else {
            
        }
        ?> 
        <div class="cart">
            <?php 
            while($row = $result->fetch_assoc()) {
                $productID = $row["productNo"];
                $name = $row["name"];
                $artist = $row["artist"];
                $price = $row["price"];
                $image = $row["image"];
                $quan = $row["qnatity"];
                $productCost = $row["productCost"];
                $orderCost = $row["orderCost"];
                $totalAmount = $row["totalAmount"];
               
            ?>
                <form class="cartForm" action="ordermanagement.php" method="post">
                    <img src="./img/<?php echo $image ?>" alt="product1">
                    <p><?php echo $name ?></p>
                    <p><?php echo $artist ?></p>
                    <p>$<?php echo $price ?> X <input type="text" name="quan" value="<?php echo $quan ?>">item(s)
                    <button type="submit" name="cartUpdate" class="remove" value="<?php echo $productID ?>" style="width: 80px;" >Update Cart</button>
                    </p>
                    <p>$<?php echo $productCost ?></p>
                    <button type="submit" value="<?php echo $productID ?>" class="remove" name="remove">Remove</button>
                </form>
                <?php } ?>
            </div>
            <form action="" method="post">
            <div class="summary">
                <p>Total amount: $<?php echo $orderCost ?></p>
                <p>Tax: 5%</p>
                <p>Amount to Pay: $<?php echo $totalAmount ?></p>
                <input type="submit" value="Checkout" class="checkout-button uppercase" name="checkout">
            </div>
            </form>
            <?php
                if(isset($_POST['checkout'])) {
                    echo '<div class="checkoutMessage">';
                    echo '<p>Order will be confirmed after payment is successful</p> <br>';
                    echo '<h3>Pay for the order using the link sent to your mail. Happy Buying!</h3>';
                    echo '</div>';
                    unset($_SESSION["order"]);
                }
            ?>
        </div>
        <div class="footer">
                <div class="section">
                    <h1>Customer Care</h1>
                    <div class="footer-link uppercase">
                        <a href="#">Contact US</a><br>
                        <a href="#">faqs</a><br>
                        <a href="#">the story</a><br>
                        <a href="#">store location</a><br>
                        <a href="#">blog</a><br>
                        <a href="#">careers</a><br>
                        <a href="#">terms of use</a><br>
                        <a href="#">shipping</a><br>
                        <a href="#">returns</a><br>
                        <a href="#">privacy policy</a><br>
                    </div>
                </div>
                <div class="section">
                    <h1>About</h1>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis veniam rem quod, quo aliquid culpa magni fugit ducimus et fugiat, vitae deserunt reiciendis, quisquam beatae at dolores sed? Temporibus nesciunt architecto autem, expedita esse facilis natus nostrum non distinctio incidunt. Numquam aspernatur dolorum possimus temporibus culpa esse! Perspiciatis eveniet voluptate totam officia deleniti quia molestiae fuga quam sapiente ratione quidem dolorem aspernatur quisquam repudiandae doloribus fugiat fugit, eaque earum ab.</p>
                </div>
                <div class="section">
                    <h1>Newsletter</h1>
                    <p>Join our mainling list</p>
                    <input type="text" name="email" id="email" placeholder="your@email.com">
                    <button class="uppercase">Subscribe</button>
                </div>
            </div>
            <script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="./js/script.js"></script>
</body>
</html>
<?php } else {
    header("Location: artprints.php");
} ?>