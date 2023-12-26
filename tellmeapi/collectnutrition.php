<?php
$servername = "localhost"; 
$username = "root";
$password = "";
$dbname = "tellme";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$currentDate = date("Y-m-d");

$username = 'desired_username';

$nutritionQuery = "
SELECT uh.username, SUM(f.Energy) AS total_Energy, 
SUM(f.Calcium) AS total_Calcium, 
SUM(f.Magnesium) AS total_Magnesium, 
SUM(f.Sodium) AS total_Sodium, 
SUM(f.Potassium) AS total_Potassium, 
SUM(f.Iron) AS total_Iron
FROM userhistory AS uh
INNER JOIN foods AS f ON f.foodID = uh.foodID
WHERE uh.username = '$username' AND DATE(uh.date) = '$currentDate'
GROUP BY uh.username";

$result = $conn->query($nutritionQuery);

if ($result && $result->num_rows > 0) {
    $nutritionData = $result->fetch_assoc();
    header('Content-Type: application/json');
    echo json_encode($nutritionData);
} else {
    echo json_encode(array('error' => 'Nutritional data not found for the given username and date'));
}

$conn->close();
?>
