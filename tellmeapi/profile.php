<?php
require "connect.php";

if (!$con) {
    echo "Connection error";
    exit();
}

if (isset($_GET['username'])) {
    $username = $_GET['username'];

    $stmt = $con->prepare("SELECT u.username, DATE_FORMAT(FROM_DAYS(TO_DAYS(NOW()) - TO_DAYS(u.dateofbirth)), '%Y')+0 AS Age, u.dateofbirth, u.height, u.weight, u.gender, u.goal, u.exercise_level, IF(u.isPregnent = 1, 'Yes', 'No') AS isPregnent, u.preference, b.bmrPoint, t.tdeePoint, g.goalPoint FROM users u LEFT JOIN bmr b ON u.username = b.username LEFT JOIN tdee t ON u.username = t.username LEFT JOIN goaltdee g ON u.username = g.username WHERE u.username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo json_encode($row);
    } else {
        echo "User not found in the database.";
    }
} else {
    echo "Username parameter not provided.";
}
?>
