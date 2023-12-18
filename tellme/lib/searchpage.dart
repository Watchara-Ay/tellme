import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Components/button.dart';
import 'menudetail.dart';

class Searchpage extends StatefulWidget {
  @override
  _Searchpage createState() => _Searchpage();
}

class _Searchpage extends State<Searchpage> {
  TextEditingController _searchController = TextEditingController();
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

  String sortBy = 'Energy'; // Default sort by Energy

  // Function to sort search results based on selected criteria
  void sortResults(String criteria) {
    setState(() {
      sortBy = criteria;
      // Sort the search results based on the selected criteria
      switch (criteria) {
        case 'Energy':
          searchResults.sort((a, b) => a['Energy'].compareTo(b['Energy']));
          break;
        case 'Fat':
          searchResults.sort((a, b) => a['Fat'].compareTo(b['Fat']));
          break;
        case 'Carbohydrate':
          searchResults
              .sort((a, b) => a['Carbohydrate'].compareTo(b['Carbohydrate']));
          break;
        case 'Protein':
          searchResults.sort((a, b) => a['Protein'].compareTo(b['Protein']));
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
          Container(
            padding: const EdgeInsets.all(30.0),
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
                      "Sort by:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(255, 229, 229, 100),
                      ),
                      onPressed: () => sortResults('Energy'),
                      child: const Text('Energy'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(255, 229, 229, 100),
                      ),
                      onPressed: () => sortResults('Fat'),
                      child: const Text('Fat'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(255, 229, 229, 100),
                      ),
                      onPressed: () => sortResults('Carbohydrate'),
                      child: const Text('Carbohydrate'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(255, 229, 229, 100),
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
                        child: searchResults != null && searchResults.isNotEmpty
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
                                            builder: (context) =>
                                                Menudetail(foods: food),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.greenAccent,
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
        ],
      ),
    )));
  }
}
