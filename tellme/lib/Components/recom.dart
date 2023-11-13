class Person {
  String gender;
  int age;
  double height; // in cm
  double weight; // in kg
  String exerciseLevel;
  String goal;

  Person(this.gender, this.age, this.height, this.weight, this.exerciseLevel,
      this.goal);

  double calculateBMR() {
    if (gender == 'Male') {
      return 10 * weight + 6.25 * height - 5 * age + 5;
    } else {
      return 10 * weight + 6.25 * height - 5 * age - 161;
    }
  }

  double calculateTDEE() {
    double bmr = calculateBMR();
    switch (exerciseLevel) {
      case 'Sedentary':
        return bmr * 1.2;
      case 'Light Activity':
        return bmr * 1.375;
      case 'Moderate Activity':
        return bmr * 1.55;
      case 'Very Active':
        return bmr * 1.725;
      case 'Extremely Active':
        return bmr * 1.9;
      default:
        return bmr;
    }
  }

  double calculateGoalTDEE() {
    double tdee = calculateTDEE();
    switch (goal) {
      case 'Fit':
        return tdee;
      case 'Weight loss':
        return tdee = tdee - ((20 / 100) * 1000);
      case 'Muscle gain':
        return tdee = tdee + ((20 / 100) * 1000);
      default:
        return tdee;
    }
  }
}

class Menu {
  String name;
  double energy; // in kcal
  double carbohydrate;
  double protein;
  double fat;
  double sodium; // in mg
  double calcium; // in mg
  double magnesium; // in mg
  double potassium; // in mg
  double iron; // in mg
  double? tdee = calculateTDEE;

  Menu(
      this.name,
      this.energy,
      this.carbohydrate,
      this.protein,
      this.fat,
      this.sodium,
      this.calcium,
      this.magnesium,
      this.potassium,
      this.iron,
      this.tdee);

  static double? get calculateTDEE => null;
}

List<Menu> recommendMenu(Person person, List<Menu> previousMenus) {
  double targetEnergy = person.gender == 'Male'
      ? (person.age <= 30 ? 2150 : 2100)
      : (person.age <= 30 ? 1750 : 1750);
  double targetSodium = 2400;
  double targetCalcium = 2500;
  double targetMagnesium = person.gender == 'Male'
      ? (person.age <= 30 ? 310 : 320)
      : (person.age <= 30 ? 250 : 260);
  double targetPotassium = person.gender == 'Male'
      ? (person.age <= 30 ? 4100 : 4100)
      : (person.age <= 30 ? 3400 : 3400);
  double targetIron = person.gender == 'Male'
      ? (person.age <= 30 ? 10.4 : 10.4)
      : (person.age <= 30 ? 24.7 : 24.7);

  List<Menu> recommendedMenus = [];

  for (var menu in previousMenus) {
    var tdee;
    if (menu.energy < targetEnergy &&
            menu.carbohydrate < tdee / ((30 / 100) * 1000) &&
            menu.protein < tdee / ((35 / 100) * 1000) &&
            menu.fat < tdee / ((35 / 100) * 1000) &&
            menu.sodium < targetSodium &&
            menu.calcium < targetCalcium &&
            menu.magnesium < targetMagnesium &&
            menu.potassium < targetPotassium ||
        menu.iron < targetIron) {
      recommendedMenus.add(menu);
    }

    if (recommendedMenus.length >= 5) {
      break; // Recommend a maximum of 5 menus
    }
  }

  return recommendedMenus;
}

void main() {
  Person person = Person('Male', 25, 171, 70, 'Moderate Activity', 'Fit');

  List<Menu> previousMenus = [];

  List<Menu> recommendedMenus = recommendMenu(person, previousMenus);
  print('Recommended Menus:');
  for (var menu in recommendedMenus) {
    print(menu.name);
  }
}
