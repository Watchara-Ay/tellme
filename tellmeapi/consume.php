<?php
require "connect.php"; 

$username = $_POST['username'];
$currentDate = date("Y-m-d");

$selectQuery = "SELECT uh.username, SUM(f.Energy) AS total_Energy, 
                    SUM(f.Calcium) AS total_Calcium, 
                    SUM(f.Magnesium) AS total_Magnesium, 
                    SUM(f.Sodium) AS total_Sodium, 
                    SUM(f.Potassium) AS total_Potassium, 
                    SUM(f.Iron) AS total_Iron
                FROM userhistory AS uh
                INNER JOIN foods AS f ON f.foodID = uh.foodID
                WHERE uh.username = '$username' AND DATE(uh.date) = '$currentDate'
                GROUP BY uh.username";

$result = mysqli_query($con, $selectQuery);

if ($result) {
    $consumedNutrients = mysqli_fetch_assoc($result);
    echo json_encode($consumedNutrients);
} else {
    echo json_encode("Failed to fetch consumed nutrient values");
}

mysqli_close($con);
?>
