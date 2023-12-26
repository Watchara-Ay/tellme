<?php
$servername = "localhost"; 
$username = "root"; 
$password = ""; 
$dbname = "tellme"; 

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$userHistoryQuery = "SELECT username FROM userHistory ORDER BY RAND() LIMIT 1";
$userHistoryResult = $conn->query($userHistoryQuery);
$userHistoryData = $userHistoryResult->fetch_assoc();

if ($userHistoryData) {
    $username = $userHistoryData['username'];

    $foodIDsQuery = "SELECT DISTINCT foodID FROM userHistory WHERE username = '$username' LIMIT 3";
    $foodIDsResult = $conn->query($foodIDsQuery);
    $foodIDsData = $foodIDsResult->fetch_all(MYSQLI_ASSOC);

    $foodDetails = array();

    foreach ($foodIDsData as $foodIDData) {
        $foodID = $foodIDData['foodID'];

        $foodQuery = "SELECT foodID, foodname, Energy FROM foods WHERE foodID = '$foodID'";
        $foodResult = $conn->query($foodQuery);
        $foodData = $foodResult->fetch_assoc();

        if ($foodData) {
            $foodDetails[] = array(
                'foodID' => $foodData['foodID'],
                'foodname' => $foodData['foodname'],
                'Energy' => $foodData['Energy']
            );
        }
    }

    $response = array(
        'username' => $username,
        'foodDetails' => $foodDetails
    );

    header('Content-Type: application/json');
    echo json_encode($response);
} else {
    echo json_encode(array('error' => 'Username not found in userHistory'));
}

$conn->close();
?>
