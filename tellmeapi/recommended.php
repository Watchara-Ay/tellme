<?php
require "connect.php";

if (!$con) {
    echo "connection error";
}

$username = $_GET['username'];
$queryGoalPoint = "SELECT goalPoint FROM goaltdee WHERE username=?";
$stmtGoalPoint = $con->prepare($queryGoalPoint);
$stmtGoalPoint->bind_param("s", $username);
$stmtGoalPoint->execute();
$goalPointResult = $stmtGoalPoint->get_result();
$goalPointRow = $goalPointResult->fetch_assoc();
$goalPoint = $goalPointRow['goalPoint']; 

$queryPreferences = "SELECT preference FROM users WHERE username=?";
$stmtPreferences = $con->prepare($queryPreferences);
$stmtPreferences->bind_param("s", $username);
$stmtPreferences->execute();
$preferencesResult = $stmtPreferences->get_result();
$preferencesRow = $preferencesResult->fetch_assoc();
$preferences = $preferencesRow['preference'];

$queryFoods = "SELECT foodname, Carbohydrate, Protein, Fat FROM foods";
$foodsResult = $con->query($queryFoods);

$foods = []; 
while ($row = $foodsResult->fetch_assoc()) {
    $foods[] = $row; 
}

foreach ($foods as &$food) {
    $food['calorie_carb'] = $food['Carbohydrate'] * 4;
    $food['calorie_protein'] = $food['Protein'] * 4;
    $food['calorie_fat'] = $food['Fat'] * 9;
}

$breakfastLimit = $goalPoint / 3; 

$mealPatterns = []; 

for ($i = 0; $i < 5; $i++) {
    $breakfast = [];
    $lunch = [];
    $dinner = [];
    $remainingGoalPoint = $goalPoint; 

    foreach ($foods as $food) {
        $totalCalories = $food['calorie_carb'] + $food['calorie_protein'] + $food['calorie_fat'];

        if ($totalCalories <= $breakfastLimit) {
            $breakfast[] = $food;
            $remainingGoalPoint -= $totalCalories; 

        }
    }

    $remainingPerMeal = $remainingGoalPoint / 2;

    foreach ($foods as $food) {
        $totalCalories = $food['calorie_carb'] + $food['calorie_protein'] + $food['calorie_fat'];

        if ($totalCalories <= $remainingPerMeal) {
            $lunch[] = $food;
            $dinner[] = $food;

            $remainingGoalPoint -= $totalCalories * 2; 
        }
    }

    $mealPatterns[] = [
        'breakfast' => $breakfast,
        'lunch' => $lunch,
        'dinner' => $dinner
    ];
}

?>
