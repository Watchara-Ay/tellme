<?php
require "connect.php";

if (!$con) {
    echo "connection error";
}

$searchQuery = $_GET['query']; 

$sql = "SELECT * FROM foods WHERE foodname LIKE '%$searchQuery%'"; 

$result = mysqli_query($con, $sql);

if ($result) {
    if (mysqli_num_rows($result) > 0) {
        $response = array();

        while ($row = mysqli_fetch_assoc($result)) {
            $response[] = $row;
        }

        header('Content-Type: application/json');
        echo json_encode($response);
    } else {
        echo "No data found.";
    }
} else {
    echo "SQL query error: " . mysqli_error($con);
}

mysqli_close($con);
?>
