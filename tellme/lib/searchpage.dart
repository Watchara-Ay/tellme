import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tellme/homepage.dart';
import 'Components/button.dart';
import 'menudetail.dart';

class Searchpage extends StatefulWidget {
  final String username;
  final MealType mealType;

  const Searchpage({
    Key? key,
    required this.username,
    required this.mealType,
  }) : super(key: key);

  @override
  _Searchpage createState() => _Searchpage();
}

class _Searchpage extends State<Searchpage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> searchResults = [];

  Future<void> searchFoods(String query) async {
    final response = await http
        .get(Uri.parse('http://127.0.0.1:8000/search.php?query=$query'));
    if (response.statusCode == 200) {
      final List<dynamic> parsedData = json.decode(response.body);
      setState(() {
        searchResults = List<Map<String, dynamic>>.from(parsedData);
      });
    } else {
      throw Exception('Failed to perform search');
    }
  }

  String sortBy = 'Energy';
  bool ascendingOrder = true;

  // Function to sort search results based on selected criteria
  void sortResults(String criteria) {
    setState(() {
      sortBy = criteria;
      // Toggle between ascending and descending order
      ascendingOrder = !ascendingOrder;

      // Sort the search results based on the selected criteria and direction
      switch (criteria) {
        case 'Energy':
          searchResults.sort((a, b) => ascendingOrder
              ? double.parse(a['Energy']).compareTo(double.parse(b['Energy']))
              : double.parse(b['Energy']).compareTo(double.parse(a['Energy'])));
          break;
        case 'Fat':
          searchResults.sort((a, b) => ascendingOrder
              ? double.parse(a['Fat']).compareTo(double.parse(b['Fat']))
              : double.parse(b['Fat']).compareTo(double.parse(a['Fat'])));
          break;
        case 'Carbohydrate':
          searchResults.sort((a, b) => ascendingOrder
              ? double.parse(a['Carbohydrate'])
                  .compareTo(double.parse(b['Carbohydrate']))
              : double.parse(b['Carbohydrate'])
                  .compareTo(double.parse(a['Carbohydrate'])));
          break;
        case 'Protein':
          searchResults.sort((a, b) => ascendingOrder
              ? double.parse(a['Protein']).compareTo(double.parse(b['Protein']))
              : double.parse(b['Protein'])
                  .compareTo(double.parse(a['Protein'])));
          break;
        default:
          break;
      }
    });
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
            'Search menu',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 36,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'Meal: ${widget.mealType.toString().split('.').last}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
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
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search food...',
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              final query = _searchController.text;
                              if (query.isNotEmpty) {
                                searchFoods(query);
                              }
                            },
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Sort by: ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 30),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 156, 156),
                        ),
                        onPressed: () => sortResults('Energy'),
                        child: const Text('Energy'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(70, 30),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 156, 156),
                        ),
                        onPressed: () => sortResults('Fat'),
                        child: const Text('Fat'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(80, 30),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 156, 156),
                        ),
                        onPressed: () => sortResults('Carbohydrate'),
                        child: const Text('Carb'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 156, 156),
                        ),
                        onPressed: () => sortResults('Protein'),
                        child: const Text('Protein'),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: ButtonTheme(
                      height: 70,
                      child: Container(
                        padding: EdgeInsets.zero,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height / 1.6,
                          width: MediaQuery.of(context).size.width / 1.05,
                          child: searchResults.isNotEmpty
                              ? ListView.builder(
                                  itemCount: searchResults.length,
                                  itemBuilder: (context, index) {
                                    final food = searchResults[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Menudetail(
                                                foods: food,
                                                username: widget.username,
                                                mealType: widget.mealType,
                                              ),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(
                                              255, 178, 178, 178),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(children: [
                                                Text(
                                                  food['foodname'],
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ]),
                                              const SizedBox(height: 8),
                                              Text(
                                                'Energy: ${food['Energy']}, Fat: ${food['Fat']}, Carbohydrate: ${food['Carbohydrate']}, Protein: ${food['Protein']}',
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : const Center(
                                  child: Text('No results'),
                                ),
                        ),
                      ),
                    ),
                  ),
                  const backbutton(),
                ]),
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
