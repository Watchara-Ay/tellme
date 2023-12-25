import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:tellme/Components/button.dart';

class Dashboard extends StatefulWidget {
  final String username;

  const Dashboard({Key? key, required this.username}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<dynamic> nutritionDetails = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/collectnutrition.php'));

    if (response.statusCode == 200) {
      setState(() {
        nutritionDetails = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Dashboard',
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
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Today Intake",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                      if (nutritionDetails.isNotEmpty)
                        Container(
                          height: 300,
                          padding: const EdgeInsets.all(16),
                          child: BarChart(
                            BarChartData(
                              alignment: BarChartAlignment.center,
                              maxY: 5000, // Set maximum Y value for the graph
                              groupsSpace: 20,
                              titlesData: FlTitlesData(
                                bottomTitles: SideTitles(
                                  showTitles: true,
                                  margin: 10,
                                  getTitles: (double value) {
                                    // Return X-axis labels
                                    // Customize as per your data
                                    switch (value.toInt()) {
                                      case 0:
                                        return 'Energy';
                                      case 1:
                                        return 'Carbohydrate';
                                      // Add more cases for other nutrients
                                      default:
                                        return '';
                                    }
                                  },
                                ),
                                leftTitles: SideTitles(
                                  showTitles: true,
                                  margin: 10,
                                  reservedSize: 30,
                                  interval:
                                      1000, // Set interval for Y-axis labels
                                ),
                              ),
                              borderData: FlBorderData(
                                border: const Border(
                                  bottom: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                  left: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                              ),
                              barGroups: [
                                BarChartGroupData(
                                  x: 0,
                                  barRods: [
                                    BarChartRodData(
                                      y: nutritionDetails[0]['Energy'] ?? 0,
                                      colors: [Colors.blue],
                                    ),
                                  ],
                                ),
                                BarChartGroupData(
                                  x: 1,
                                  barRods: [
                                    BarChartRodData(
                                      y: nutritionDetails[0]['Carbohydrate'] ??
                                          0,
                                      colors: [Colors.red],
                                    ),
                                  ],
                                ),
                                // Add more BarChartGroupData for other nutrients
                              ],
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Other user intake",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                      Column(
                        children: const [
                          SizedBox(
                            height: 10,
                          ),
                          backbutton(),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
