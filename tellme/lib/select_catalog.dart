import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tellme/homepage.dart';

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String imagePath;

  RadioModel(this.isSelected, this.buttonText, this.imagePath);
}

String? selectedCatalog;

class SelectCatalog extends StatefulWidget {
  final String username;

  const SelectCatalog({Key? key, required this.username}) : super(key: key);

  @override
  _SelectCatalogState createState() => _SelectCatalogState();
}

class _SelectCatalogState extends State<SelectCatalog> {
  late List<RadioModel> radioItems;
  String selectedPreference = '';

  Future selectPreference(String username, String preference) async {
    String url = "http://127.0.0.1:8000/selectedCat.php";
    final response = await http.post(Uri.parse(url), body: {
      'username': username,
      'preference': selectedPreference,
    });

    var data = json.decode(response.body);
    print(data); // Use the response data as needed in your app
  }

  @override
  void initState() {
    super.initState();
    radioItems = [
      RadioModel(false, 'Vegetables', 'assets/images/Veg.png'),
      RadioModel(false, 'Fruits', 'assets/images/Fruits.png'),
      RadioModel(false, 'Grains & Beans & Nuts', 'assets/images/Gain.png'),
      RadioModel(false, 'Meats & Poultry', 'assets/images/Meats.png'),
      RadioModel(false, 'Fish and Seafood', 'assets/images/Seafood.png'),
      RadioModel(false, 'Dairy', 'assets/images/Dairy.png'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Select catalog',
              style: TextStyle(
                fontSize: 34,
                color: Colors.deepPurple,
                fontWeight: FontWeight.w700,
              ),
            ),
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
              child: GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ),
                itemCount: radioItems.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        radioItems
                            .forEach((element) => element.isSelected = false);
                        radioItems[index].isSelected = true;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          radioItems[index].imagePath,
                          width: 180,
                          height: 180,
                        ),
                        Radio(
                          value: radioItems[index].buttonText,
                          groupValue: selectedPreference,
                          onChanged: (String? value) {
                            setState(() {
                              radioItems.forEach(
                                  (element) => element.isSelected = false);
                              radioItems[index].isSelected = true;
                              selectedPreference = radioItems[index].buttonText;
                            });

                            selectPreference(
                                widget.username, selectedPreference);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Homepage(
                                  username: widget.username,
                                  selectedFood: 1,
                                ),
                              ),
                            );

                            print("success");
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    'Welcome, ${widget.username}',
                    style: const TextStyle(
                        color: Colors.lightGreen, fontSize: 24.0),
                  ),
                  const BackButton(),
                ],
              )),
        ],
      ),
    );
  }
}
