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
// $encrypted_pwd = md5($password);
$sql = "SELECT * FROM users WHERE username = '$username'";

$result = mysqli_query($con, $sql);
$count = mysqli_num_rows($result);


if ($count == 1) {
    echo json_encode('Errors');
} else {

    $insert = "INSERT INTO users(username,password,dateofbirth,height,weight,gender,isPregnent,goal,exercise_level)VALUES('$username','$password','$dateofbirth','$height','$weight','$gender','$isPregnent','$goal','$exercise_level')";
    $query = mysqli_query($con, $insert);
    if ($query) {
        echo json_encode('Success');

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

        echo ($tdeePoint);
        echo ("     ");
        echo ($bmr);
        if ($count == 1) {
            echo json_encode('Errors');
        } else {
            $insertUser = mysqli_query($con, $sql);
            if ($insertUser) {
                $userID = mysqli_insert_id($con);
            }
            $insertBMR = "INSERT INTO bmr ( username, bmrPoint) VALUES ('$username', '$bmr')";
            $queryBMR = mysqli_query($con, $insertBMR);

            if (!$queryBMR) {
                echo "Error: " . mysqli_error($con);
            } else {
                echo "BMR data inserted successfully!";
            }
            $insert = "INSERT INTO tdee ( username, tdeePoint) VALUES ('$username', '$tdeePoint')";
            $query = mysqli_query($con, $insert);
            $insertgoal = "INSERT INTO goaltdee ( username, goalPoint) VALUES ( '$username', '$goalPoint')";
            $querygoal = mysqli_query($con, $insertgoal);
        }
    }
    mysqli_close($con);
}
