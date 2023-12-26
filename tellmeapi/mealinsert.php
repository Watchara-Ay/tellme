<?php
require "connect.php";

if (!$con) {
    echo json_encode(['success' => false, 'error' => 'connection error']);
    exit();
}

if (!isset($_POST['meal']) || !isset($_POST['username']) || empty($_POST['meal']) || empty($_POST['username'])) {
    echo json_encode(['success' => false, 'error' => 'missing or empty data']);
    exit();
}

$meal = mysqli_real_escape_string($con, $_POST['meal']);
$username = mysqli_real_escape_string($con, $_POST['username']);


$allowedMeals = ['breakfast', 'lunch', 'dinner'];
if (!in_array($meal, $allowedMeals)) {
    echo json_encode(['success' => false, 'error' => 'invalid meal']);
    exit();
}

$today = date("Y-m-d");
$checkQuery = "SELECT * FROM userHistory WHERE meal = '$meal' AND username = '$username' AND date = '$today'";
$checkResult = mysqli_query($con, $checkQuery);

if (mysqli_num_rows($checkResult) > 0) {
    echo json_encode(['success' => false, 'error' => 'meal for today already exists']);
    exit();
}

$sql = "INSERT INTO userHistory (meal, username, date) VALUES (?, ?, ?)";

$stmt = $con->prepare($sql);

if (!$stmt) {
    echo json_encode(['success' => false, 'error' => 'prepare statement failed: ' . $con->error]);
    exit();
}

$stmt->bind_param("sss", $meal, $username, $today);

if ($stmt->execute()) {
    echo json_encode(['success' => true, 'message' => 'Record inserted successfully']);
} else {
    echo json_encode(['success' => false, 'error' => 'Error inserting record: ' . $stmt->error]);
}

$stmt->close();
$con->close();
?>
