import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserData {
  final String username;
  final double weight;
  final double height;
  final String gender;
  final int age;
  final String goal;
  final String exerciseLevel;
  final double tdee;
  final double bmr;

  UserData({
    required this.username,
    required this.weight,
    required this.height,
    required this.gender,
    required this.age,
    required this.goal,
    required this.exerciseLevel,
    required this.tdee,
    required this.bmr,
  });

  // Function to fetch user data from the PHP backend
  Future<void> fetchUserData() async {
    final response = await http.get(
      Uri.parse('https://yourdomain.com/getUserData.php?username=JohnDoe'),
      // Replace 'JohnDoe' with the actual username or retrieve dynamically
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> userData = json.decode(response.body);
      // Save user data securely using flutter_secure_storage
      final secureStorage = FlutterSecureStorage();
      await secureStorage.write(
        key: 'userData',
        value: json.encode(userData),
      );
    } else {
      // Handle error
    }
  }

  // Function to retrieve user data from secure storage
  Future<Map<String, dynamic>> retrieveUserData() async {
    final secureStorage = FlutterSecureStorage();
    final userData = await secureStorage.read(key: 'userData');
    if (userData != null) {
      return json.decode(userData);
    }
    return {};
  }
}

// Usage:
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final userData = UserData(
      username: 'username',
      age: 18,
      bmr: 1990,
      exerciseLevel: '',
      gender: '',
      goal: '',
      height: 178,
      tdee: 2400,
      weight: 84);

  // Fetch user data from PHP backend and save to secure storage
  await userData.fetchUserData();

  // Retrieve user data from secure storage
  final storedData = await userData.retrieveUserData();
  print(storedData); // Use the retrieved data as needed in your app
}
