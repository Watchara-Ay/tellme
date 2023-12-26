<?php
require "connect.php";

$username = $_POST['username']; 

$currentDate = date("Y-m-d");

$selectQuery = "SELECT f.foodname, f.Energy, f.Carbohydrate, f.Protein, f.Fat, f.Calcium, f.Sodium, f.Magnesium, f.Potassium, f.Iron, uh.meal
                FROM foods AS f
                INNER JOIN userhistory AS uh ON f.foodID = uh.foodID
                WHERE uh.username = '$username' AND DATE(uh.date) = '$currentDate'";

$result = mysqli_query($con, $selectQuery);

if ($result) {
    $mealInfo = array();

    while ($row = mysqli_fetch_assoc($result)) {
        $mealInfo[] = $row;
    }

    if (!empty($mealInfo)) {
        echo json_encode($mealInfo);
    } else {
        echo $currentDate; 
        echo json_encode("No meal information found for today");
    }
} else {
    echo json_encode("Query failed");
}

mysqli_close($con);
?>
