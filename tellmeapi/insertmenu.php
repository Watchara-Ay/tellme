<?php
require "connect.php"; // Include your database connection

if (!$con) {
    echo "Connection error";
    exit();
}

if (isset($_POST['username']) && isset($_POST['foodID']) && isset($_POST['meal'])) {
    $username = $_POST['username'];
    $foodID = $_POST['foodID'];
    $meal = $_POST['meal'];
    
    // Get current date
    $date = date("Y-m-d");

    // Using prepared statement to prevent SQL injection
    $stmt = $con->prepare("INSERT INTO userHistory (username, foodID, meal, date) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("siss", $username, $foodID, $meal, $date);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        echo "Data inserted successfully!";
    } else {
        echo "Error inserting data.";
    }
} else {
    echo "Incomplete data provided.";
}
?>
