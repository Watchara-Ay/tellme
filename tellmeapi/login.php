<?php
require "connect.php"; // Include your database connection

if (!$con) {
    echo json_encode(['success' => false, 'error' => 'connection error']);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Validate received username and password (you might want to add more validations)
    if (empty($username) || empty($password)) {
        echo json_encode(['success' => false, 'error' => 'Please provide both username and password']);
    } else {
        // Fetch user from the database
        $query = "SELECT * FROM users WHERE username = '$username'";
        $result = mysqli_query($con, $query);

        if (mysqli_num_rows($result) > 0) {
            $user = mysqli_fetch_assoc($result);
            $hashedPassword = $user['password'];  // Assuming the password is stored as a hash
        
            // Verify the password
            if ($password == $hashedPassword) {
                // Passwords match, user authenticated
                echo json_encode(["success" => true, 'message' => 'Login successful']);
            } else {
                // Passwords don't match
                echo json_encode(["success" => false, 'error' => 'Incorrect password']);
                echo $username;
                echo $password;
            }
        } else {
            // User not found in the database
            echo json_encode(['success' => false, 'error' => 'User not found']);
        }
    }
} else {
    echo json_encode(['success' => false, 'error' => 'Invalid request method']);
}
?>
