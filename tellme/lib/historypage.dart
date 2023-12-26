import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tellme/monthpage.dart';
import 'package:http/http.dart' as http;

enum MealType {
  breakfast,
  lunch,
  dinner,
}

class Historypage extends StatefulWidget {
  final String username;

  const Historypage({Key? key, required this.username}) : super(key: key);

  @override
  HistoryPageState createState() => HistoryPageState();
}

class HistoryPageState extends State<Historypage> {
  late final String username;
  List<dynamic> mealInfo = [];
  Map<String, dynamic>? nutrientData;
  String getCurrentDate() {
    var date = DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    return formattedDate;
  }

  @override
  void initState() {
    super.initState();
    fetchMealInfo();
    fetchNutrientData();
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
              const Text(
                'History',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        )),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10, // <-- SEE HERE
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(255, 0, 0, 1),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Monthpage(
                                        title: '',
                                      )),
                            );
                          },
                          child: Text(getCurrentDate()),
                        ),
                        const SizedBox(
                          height: 10, // <-- SEE HERE
                        ),
                        Expanded(
                          child: mealInfo.isEmpty
                              ? const Center(
                                  child: Text(
                                      'No meal information found for today'),
                                )
                              : ListView.builder(
                                  itemCount: mealInfo.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  mealInfo[index]['meal'],
                                                  style: const TextStyle(
                                                    fontSize: 24,
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                        255, 212, 212, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        mealInfo[index]
                                                            ['foodname'],
                                                        style: const TextStyle(
                                                            fontSize: 24,
                                                            color:
                                                                Colors.black),
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
                                                              style: const TextStyle(
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
                                                              style: const TextStyle(
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
                                                              style: const TextStyle(
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
                                                              style: const TextStyle(
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
                                        ],
                                      ),
                                    );
                                  },
                                ),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              for (var nutrient
                                                  in consumedNutrients
                                                      .keys
                                                      .take(consumedNutrients
                                                              .length ~/
                                                          2))
                                                Row(
                                                  children: [
                                                    const SizedBox(
                                                      width: 25,
                                                    ),
                                                    Text(
                                                      '$nutrient:',
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      '${consumedNutrients[nutrient]?.toStringAsFixed(2) ?? 'N/A'}%',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        color: consumedNutrients[
                                                                        nutrient] !=
                                                                    null &&
                                                                consumedNutrients[
                                                                        nutrient]! >
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              for (var nutrient
                                                  in consumedNutrients
                                                      .keys
                                                      .skip(consumedNutrients
                                                              .length ~/
                                                          2))
                                                Row(
                                                  children: [
                                                    const SizedBox(
                                                      width: 25,
                                                    ),
                                                    Text(
                                                      '$nutrient:',
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      '${consumedNutrients[nutrient]?.toStringAsFixed(2) ?? 'N/A'}%',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        color: consumedNutrients[
                                                                        nutrient] !=
                                                                    null &&
                                                                consumedNutrients[
                                                                        nutrient]! >
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              if ((int.tryParse(nutrientData![
                                                              'total_Energy'] ??
                                                          '0') ??
                                                      0) <
                                                  1290)
                                                const Row(
                                                  children: [
                                                    Text(
                                                      'Energy',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.red),
                                                    ),
                                                    SizedBox(width: 10),
                                                  ],
                                                ),
                                              if ((int.tryParse(nutrientData![
                                                              'total_Calcium'] ??
                                                          '0') ??
                                                      0) <
                                                  800)
                                                const Row(
                                                  children: [
                                                    Text(
                                                      'Calcium',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.red),
                                                    ),
                                                    SizedBox(width: 10),
                                                  ],
                                                ),
                                              if ((int.tryParse(nutrientData![
                                                              'total_Sodium'] ??
                                                          '0') ??
                                                      0) <
                                                  500)
                                                const Row(
                                                  children: [
                                                    Text(
                                                      'Sodium',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.red),
                                                    ),
                                                    SizedBox(width: 10),
                                                  ],
                                                ),
                                              if ((int.tryParse(nutrientData![
                                                              'total_Magnesium'] ??
                                                          '0') ??
                                                      0) <
                                                  270)
                                                const Row(
                                                  children: [
                                                    Text(
                                                      'Magnesium',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.red),
                                                    ),
                                                    SizedBox(width: 10),
                                                  ],
                                                ),
                                              if ((int.tryParse(nutrientData![
                                                              'total_Potassium'] ??
                                                          '0') ??
                                                      0) <
                                                  2400)
                                                const Row(
                                                  children: [
                                                    Text(
                                                      'Potassium',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.red),
                                                    ),
                                                    SizedBox(width: 10),
                                                  ],
                                                ),
                                              if ((int.tryParse(nutrientData![
                                                              'total_Iron'] ??
                                                          '0') ??
                                                      0) <
                                                  7)
                                                const Row(
                                                  children: [
                                                    Text(
                                                      'Iron',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.red),
                                                    ),
                                                    SizedBox(width: 10),
                                                  ],
                                                ),
                                            ],
                                          ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: ButtonTheme(
                                  height: 70,
                                  child: Container(
                                    padding: EdgeInsets.zero, // ADD THIS LINE
                                    child: SizedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            margin: const EdgeInsets.all(10),
                                            height: 50.0,
                                            // ignore: deprecated_member_use
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.black),
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18.0),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Back",
                                                  style:
                                                      TextStyle(fontSize: 15)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ))
            ])),
      ),
    );
  }
}
