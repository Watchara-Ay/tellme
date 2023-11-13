void main() {
  // Input data
  String gender = 'Male'; // 'Male' or 'Female'
  double height = 171; // in cm
  double weight = 70; // in kg
  int age = 30; // in years
  String exerciseLevel =
      'Moderate'; // 'Sedentary', 'Light', 'Moderate', 'Very Active', or 'Extremely Active'

  // Calculate BMR based on gender
  double bmr;
  if (gender == 'Male') {
    bmr = 10 * weight + 6.25 * height - 5 * age + 5;
  } else {
    bmr = 10 * weight + 6.25 * height - 5 * age - 161;
  }

  // Adjust BMR based on exercise level
  double activityMultiplier;
  if (exerciseLevel == 'Sedentary') {
    activityMultiplier = 1.2;
    double tdee = bmr * activityMultiplier;
  } else if (exerciseLevel == 'Light') {
    activityMultiplier = 1.375;
    double tdee = bmr * activityMultiplier;
  } else if (exerciseLevel == 'Moderate') {
    activityMultiplier = 1.55;
    double tdee = bmr * activityMultiplier;
  } else if (exerciseLevel == 'Very Active') {
    activityMultiplier = 1.725;
    double tdee = bmr * activityMultiplier;
  } else if (exerciseLevel == 'Extremely Active') {
    activityMultiplier = 1.9;
    double tdee = bmr * activityMultiplier;
  }

  // Define nutritional requirements
  Map<String, double> nutritionalRequirements = {
    'Energy': gender == 'Male' ? 2100 : 1750, // Modify for age
    'Sodium': 2400,
    'Calcium': 2500,
    'Magnesium': 350,
    'Potassium': gender == 'Male' ? 2450 : 2050, // Modify for age
    'Iron': gender == 'Male' ? 10.4 : 24.7, // Modify for age
  };

  // Create a list of menu items with their nutritional information
  List<Map<String, dynamic>> menuItems = [
    {
      'Name': 'Menu Item 1',
      'Calories': 500,
      'Sodium': 1200,
      'Calcium': 300,
      'Magnesium': 50,
      'Potassium': 1000,
      'Iron': 5,
    },
    // Add more menu items here
  ];

  // Filter menu items that lack in nutrition the most
  List<Map<String, dynamic>> lackingMenuItems = menuItems.where((item) {
    return item.keys.every((key) {
      if (key != 'Name' && nutritionalRequirements.containsKey(key)) {
        return item[key] < nutritionalRequirements[key];
      }
      return true;
    });
  }).toList();

  // Recommend the top 5 lacking menu items
  List<Map<String, dynamic>> recommendedMenu =
      lackingMenuItems.take(5).toList();

  // Display the recommended menu
  for (var item in recommendedMenu) {
    print('Recommended Menu: ${item['Name']}');
  }
}
