<?php
require "connect.php";

if (!$con) {
    echo "connection error";
}

$username = $_POST['username'];
$password = $_POST['password'];
$dateofbirth = $_POST['dateofbirth'];
$height = $_POST['height'];
$weight = $_POST['weight'];
$gender = $_POST['gender'];
$isPregnent = $_POST['isPregnent'];
$goal = $_POST['goal'];
$exercise_level = $_POST['exercise_level'];

$sql = "SELECT * FROM users WHERE username = '$username'";
$result = mysqli_query($con, $sql);
$count = mysqli_num_rows($result);

if ($count != 1) {
    echo json_encode('User not found');
} else {
    $update = "UPDATE users SET password='$password', dateofbirth='$dateofbirth', height='$height', weight='$weight', gender='$gender', isPregnent='$isPregnent', goal='$goal', exercise_level='$exercise_level' WHERE username='$username'";
    $updateQuery = mysqli_query($con, $update);

    if ($updateQuery) {
        $dob = new DateTime($dateofbirth);
        $today = new DateTime('today');
        $age = $dob->diff($today)->y;

        if ($gender === 'Male') {
            $bmr = (10 * $weight) + (6.25 * $height) - (5 * $age) + 5;
        } else if ($gender === 'Female') {
            $bmr = (10 * $weight) + (6.25 * $height) - (5 * $age) - 161;
        } else {
            $bmr = 0;
        }

        $exercise_levels = [
            'Sedentary' => 1.2,
            'Light activity' => 1.375,
            'Moderate activity' => 1.55,
            'Very active' => 1.725,
            'Extremely activity' => 1.9
        ];

        if (array_key_exists($exercise_level, $exercise_levels)) {
            $tdeePoint = $bmr * $exercise_levels[$exercise_level];
        } else {
            $tdeePoint = $bmr * 1.2;
        }

        $goalPercentages = [
            'Fit' => 1.0,
            'Lose weight' => 0.8,
            'Muscle gain' => 1.0
        ];

        if (array_key_exists($goal, $goalPercentages)) {
            $goalPoint = $tdeePoint * $goalPercentages[$goal];
        } else {
            $goalPoint = 0;
        }

        $updateBMR = "UPDATE bmr SET bmrPoint='$bmr' WHERE username='$username'";
        $updateTDEE = "UPDATE tdee SET tdeePoint='$tdeePoint' WHERE username='$username'";
        $updateGoal = "UPDATE goaltdee SET goalPoint='$goalPoint' WHERE username='$username'";

        $queryBMR = mysqli_query($con, $updateBMR);
        $queryTDEE = mysqli_query($con, $updateTDEE);
        $queryGoal = mysqli_query($con, $updateGoal);

        if ($queryBMR && $queryTDEE && $queryGoal) {
            echo json_encode('Update successful');
        } else {
            echo json_encode('Error updating metrics');
        }
    } else {
        echo json_encode('Error updating user details');
    }
}

mysqli_close($con);

?>
