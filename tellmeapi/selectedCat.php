<?php
require "connect.php";

if (!$con) {
    echo "connection error";
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $preference = $_POST['preference']; 

    $query = "SELECT * FROM users WHERE username = '$username'";
    $result = mysqli_query($con, $query);

    if (mysqli_num_rows($result) > 0) {
        $updateQuery = "UPDATE users SET preference = '$preference' WHERE username = '$username'";
        $updateResult = mysqli_query($con, $updateQuery);

        if ($updateResult) {
            echo json_encode('Preference updated');
        } else {
            echo json_encode('Failed to update preference');
        }
    } else {
        echo json_encode('User not found');
    }
} else {
    echo json_encode('Invalid request method');
}
?>
