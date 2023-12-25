import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tellme/profilepage.dart';
import 'package:tellme/searchpage.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  final String username;
  final int selectedFood; // Additional parameter

  const Homepage({
    Key? key,
    required this.username,
    required this.selectedFood, // Include this parameter
  }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

enum MealType {
  breakfast,
  lunch,
  dinner,
}

class _HomepageState extends State<Homepage> {
  late String meals;
  late String username;
  List<dynamic> mealInfo = [];
  Map<String, dynamic>? missedValues;
  late final Function(String) onSelect;
  Map<String, dynamic>? nutrientData;

  @override
  void initState() {
    super.initState();
    fetchMealInfo();
    fetchNutrientData();
  }

  String getCurrentDate() {
    var date = DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    return formattedDate;
  }

  Future<void> fetchNutrientData() async {
    const url = 'http://127.0.0.1:8000/consume.php';
    final response = await http.post(Uri.parse(url), body: {
      'username': widget.username,
    });

    if (response.statusCode == 200) {
      setState(() {
        nutrientData = json.decode(response.body);
      });
    } else {
      print('Failed to fetch nutrient data');
    }
  }

  Future<void> fetchMealInfo() async {
    var url = 'http://127.0.0.1:8000/mealfooddetail.php';
    var response = await http.post(Uri.parse(url), body: {
      'username': widget.username,
    });

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        if (data is List) {
          mealInfo = List<Map<String, dynamic>>.from(data);
        } else {
          mealInfo = [];
        }
      });
    } else {
      print('Failed to fetch meal information');
    }
  }

  void insertData(String meal, String username) async {
    var url = 'http://127.0.0.1:8000/mealinsert.php';

    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          'meal': meal,
          'username': username,
        },
      );

      if (response.statusCode == 200) {
        print('Record inserted successfully');
      } else {
        print('Failed to insert record: ${response.body}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  void _navigateToSearchPage(MealType mealType) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Searchpage(
          username: widget.username,
          mealType: mealType,
        ),
      ),
    );
  }

  late Future<Map<String, dynamic>> userData = Future.value({});

  int calculateConsumedCalories(List<dynamic> meals) {
    int totalCalories = 0;
    for (var meal in meals) {
      if (meal['Energy'] is int) {
        totalCalories += meal['Energy'] as int;
      } else if (meal['Energy'] is String) {
        totalCalories += int.tryParse(meal['Energy'] as String) ?? 0;
      }
    }
    return totalCalories;
  }

  Map<String, double> calculateConsumedNutrientsPercentage(
      List<dynamic> meals) {
    const Map<String, int> dailyNutrientLimits = {
      'Energy': 2150,
      'Calcium': 2500,
      'Sodium': 2400,
      'Magnesium': 450,
      'Potassium': 4100,
      'Iron': 45,
    };

    Map<String, double> consumedPercentages = {};

    for (var nutrient in dailyNutrientLimits.keys) {
      int totalNutrient = 0;

      for (var meal in meals) {
        if (meal[nutrient] is int) {
          totalNutrient += meal[nutrient] as int;
        } else if (meal[nutrient] is String) {
          totalNutrient += int.tryParse(meal[nutrient] as String) ?? 0;
        }
      }

      double consumedPercentage =
          (totalNutrient / dailyNutrientLimits[nutrient]!) * 100;
      consumedPercentages[nutrient] = consumedPercentage;
    }

    return consumedPercentages;
  }

  late final Map<String, double> consumedPercentages;

  @override
  Widget build(BuildContext context) {
    int consumedCalories = calculateConsumedCalories(mealInfo);
    Map<String, double> consumedNutrients =
        calculateConsumedNutrientsPercentage(mealInfo);

    return Scaffold(
        body: Center(
            child: SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.2,
                child: Text(
                  'Welcome: ${widget.username}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.account_circle),
                      color: Colors.black,
                      padding: EdgeInsets.zero,
                      iconSize: 50,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profilepage(
                              username: widget.username,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    )),
                child: Column(children: [
                  const SizedBox(
                    height: 10, // <-- SEE HERE
                  ),
                  Text(
                    getCurrentDate(),
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6), fontSize: 24),
                  ),
                  const SizedBox(
                    height: 20, // <-- SEE HERE
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Order:',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  backgroundColor: Colors.transparent,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                14,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 174, 255, 255),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            textStyle: const TextStyle(
                                              fontSize: 20,
                                              color:
                                                  Color.fromRGBO(255, 0, 0, 1),
                                            ),
                                          ),
                                          onPressed: () {
                                            insertData(
                                                'breakfast', widget.username);
                                            _navigateToSearchPage(
                                                MealType.breakfast);
                                          },
                                          child: const Text('breakfast'),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                14,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 174, 255, 255),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            textStyle: const TextStyle(
                                              fontSize: 20,
                                              color:
                                                  Color.fromRGBO(255, 0, 0, 1),
                                            ),
                                          ),
                                          onPressed: () {
                                            insertData(
                                                'lunch', widget.username);
                                            _navigateToSearchPage(
                                                MealType.lunch);
                                          },
                                          child: const Text('lunch'),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                14,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 174, 255, 255),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            textStyle: const TextStyle(
                                              fontSize: 20,
                                              color:
                                                  Color.fromRGBO(255, 0, 0, 1),
                                            ),
                                          ),
                                          onPressed: () {
                                            insertData(
                                                'dinner', widget.username);
                                            _navigateToSearchPage(
                                                MealType.dinner);
                                          },
                                          child: const Text('dinner'),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: const Text('Select Meal'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: mealInfo.isEmpty
                        ? const Center(
                            child: Text('No meal information found for today'),
                          )
                        : ListView.builder(
                            itemCount: mealInfo.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              mealInfo[index]['meal'],
                                              style: const TextStyle(
                                                fontSize: 24,
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1),
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    255, 212, 212, 1),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    mealInfo[index]['foodname'],
                                                    style: const TextStyle(
                                                        fontSize: 24,
                                                        color: Colors.black),
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2.3,
                                                        child: Text(
                                                          'Energy: ${mealInfo[index]['Energy']}',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2.2,
                                                        child: Text(
                                                          'Carbohydrate: ${mealInfo[index]['Carbohydrate']}',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2.3,
                                                        child: Text(
                                                          'Protein: ${mealInfo[index]['Protein']}',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2.3,
                                                        child: Text(
                                                          'Fat: ${mealInfo[index]['Fat']}',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                ])),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    const Text(
                      "Consume: ",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "$consumedCalories Calories",
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var nutrient in consumedNutrients.keys
                                    .take(consumedNutrients.length ~/ 2))
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      Text(
                                        '$nutrient:',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '${consumedNutrients[nutrient]?.toStringAsFixed(2) ?? 'N/A'}%',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: consumedNutrients[nutrient] !=
                                                      null &&
                                                  consumedNutrients[nutrient]! >
                                                      60
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var nutrient in consumedNutrients.keys
                                    .skip(consumedNutrients.length ~/ 2))
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      Text(
                                        '$nutrient:',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '${consumedNutrients[nutrient]?.toStringAsFixed(2) ?? 'N/A'}%',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: consumedNutrients[nutrient] !=
                                                      null &&
                                                  consumedNutrients[nutrient]! >
                                                      60
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Miss: ',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.red,
                        ),
                      ),
                      nutrientData == null
                          ? const CircularProgressIndicator()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                if ((int.tryParse(
                                            nutrientData!['total_Energy'] ??
                                                '0') ??
                                        0) <
                                    1290)
                                  Row(
                                    children: const [
                                      Text(
                                        'Energy',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.red),
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                                if ((int.tryParse(
                                            nutrientData!['total_Calcium'] ??
                                                '0') ??
                                        0) <
                                    800)
                                  Row(
                                    children: const [
                                      Text(
                                        'Calcium',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.red),
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                                if ((int.tryParse(
                                            nutrientData!['total_Sodium'] ??
                                                '0') ??
                                        0) <
                                    500)
                                  Row(
                                    children: const [
                                      Text(
                                        'Sodium',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.red),
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                                if ((int.tryParse(
                                            nutrientData!['total_Magnesium'] ??
                                                '0') ??
                                        0) <
                                    270)
                                  Row(
                                    children: const [
                                      Text(
                                        'Magnesium',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.red),
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                                if ((int.tryParse(
                                            nutrientData!['total_Potassium'] ??
                                                '0') ??
                                        0) <
                                    2400)
                                  Row(
                                    children: const [
                                      Text(
                                        'Potassium',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.red),
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                                if ((int.tryParse(nutrientData!['total_Iron'] ??
                                            '0') ??
                                        0) <
                                    7)
                                  Row(
                                    children: const [
                                      Text(
                                        'Iron',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.red),
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                              ],
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 20,
            color: Colors.white,
          )
        ],
      ),
    )));
  }
}
