<?php
require "connect.php";

$username = $_POST['username'];
$foodID = $_POST['foodID'];
$meal = $_POST['meal'];

$today = date("Y-m-d");

$updateQuery = "UPDATE userHistory SET foodID='$foodID' WHERE username='$username' AND meal='$meal' AND date='$today'";
$result = mysqli_query($con, $updateQuery);

if ($result) {
    echo json_encode("Update successful");
} else {
    echo json_encode("Update failed");
}

mysqli_close($con);
?>
