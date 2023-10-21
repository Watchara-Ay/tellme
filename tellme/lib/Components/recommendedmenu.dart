// class Menu {
//   String name;
//   Map<String, double> nutrients; // Nutrient information for the menu

//   Menu(this.name, this.nutrients);
// }

// class MenuRecommendationSystem {
//   List<Menu> menuList;
//   List<Menu> previousMenus = [];

//   MenuRecommendationSystem(this.menuList);

//   // Function to recommend menus based on nutrient preferences and exercise level
//   List<Menu> recommendMenus(
//       Map<String, double> nutrientPreferences, String exerciseLevel) {
//     List<Menu> recommendedMenus = [];
//     List<Menu> filteredMenus = [];

//     for (var menu in menuList) {
//       // Check if the menu is not in the previousMenus list
//       if (!previousMenus.contains(menu)) {
//         double score = calculateMenuScore(menu, nutrientPreferences);
//         if (exerciseLevel == "Very active") {
//           if (score > 1.0) {
//             filteredMenus.add(menu);
//           }
//         } else if (exerciseLevel == "Moderate activity") {
//           if (score > 0.5) {
//             filteredMenus.add(menu);
//           }
//         } else if (exerciseLevel == "Light activity") {
//           if (score > 0.2) {
//             filteredMenus.add(menu);
//           }
//         } else {
//           if (score > 0.0) {
//             filteredMenus.add(menu);
//           }
//         }
//       }
//     }

//     // Sort the filtered menus by score and select the top 5
//     filteredMenus.sort((a, b) {
//       double scoreA = calculateMenuScore(a, nutrientPreferences);
//       double scoreB = calculateMenuScore(b, nutrientPreferences);
//       return scoreB.compareTo(scoreA);
//     });

//     recommendedMenus = filteredMenus.take(5).toList();

//     // Update the previousMenus list with the newly recommended menus
//     previousMenus.addAll(recommendedMenus);

//     return recommendedMenus;
//   }

//   // Calculate the score of a menu based on nutrient preferences
//   double calculateMenuScore(
//       Menu menu, Map<String, double> nutrientPreferences) {
//     double score = 0.0;

//     for (var nutrient in nutrientPreferences.keys) {
//       if (menu.nutrients.containsKey(nutrient)) {
//         score += (menu.nutrients[nutrient] / nutrientPreferences[nutrient]);
//       }
//     }

//     return score;
//   }
// }

// void main() {
//   // Create a list of menus with their nutrient information
//   List<Menu> menuList = [
//     Menu("Menu 1", {
//       "Cholesterol": 5.0,
//       "Sodium": 500.0,
//       "Calcium": 200.0,
//       "Magnesium": 100.0,
//       "Potassium": 300.0,
//       "Iron": 10.0,
//     }),
//     Menu("Menu 2", {
//       "Cholesterol": 10.0,
//       "Sodium": 800.0,
//       "Calcium": 150.0,
//       "Magnesium": 120.0,
//       "Potassium": 400.0,
//       "Iron": 8.0,
//     }),
//     Menu("Menu 3", {
//       "Cholesterol": 2.0,
//       "Sodium": 300.0,
//       "Calcium": 250.0,
//       "Magnesium": 80.0,
//       "Potassium": 350.0,
//       "Iron": 12.0,
//     }),
//     Menu("Menu 4", {
//       "Cholesterol": 2.0,
//       "Sodium": 300.0,
//       "Calcium": 250.0,
//       "Magnesium": 80.0,
//       "Potassium": 350.0,
//       "Iron": 8.0,
//     }),
//     Menu("Menu 5", {
//       "Cholesterol": 2.0,
//       "Sodium": 300.0,
//       "Calcium": 250.0,
//       "Magnesium": 80.0,
//       "Potassium": 350.0,
//       "Iron": 2.0,
//     }),
//     // Add more menus here
//   ];

//   // Create a recommendation system
//   MenuRecommendationSystem recommendationSystem =
//       MenuRecommendationSystem(menuList);

//   // Set the user's nutrient preferences and exercise level
//   Map<String, double> nutrientPreferences = {
//     "Cholesterol": 300.0,
//     "Sodium": 2300.0,
//     "Calcium": 1300.0,
//     "Magnesium": 410.0,
//     "Potassium": 3400.0,
//     "Iron": 10.0,
//   };
//   String exerciseLevel =
//       "Moderate activity"; // Change this based on the user's exercise level

//   // Recommend five menus
//   List<Menu> recommendedMenus =
//       recommendationSystem.recommendMenus(nutrientPreferences, exerciseLevel);

//   // Print the recommended menus
//   print("Recommended Menus:");
//   for (var menu in recommendedMenus) {
//     print(menu.name);
//   }
// }
