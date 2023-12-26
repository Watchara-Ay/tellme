import 'package:flutter/material.dart';
import 'package:tellme/homepage.dart';
import 'package:http/http.dart' as http;

class Menudetail extends StatefulWidget {
  final Map<String, dynamic> foods;
  final String username;
  final MealType mealType;

  const Menudetail({
    Key? key,
    required this.foods,
    required this.username,
    required this.mealType,
  }) : super(key: key);

  @override
  _MenudetailState createState() => _MenudetailState();
}

class _MenudetailState extends State<Menudetail> {
  Future<void> _updateFoodInfo() async {
    const String apiUrl = 'http://127.0.0.1:8000/updatemenu.php';

    Map<String, dynamic> requestData = {
      'username': widget.username,
      'foodID': widget.foods['foodID'],
      'meal': widget.mealType.toString().split('.').last,
    };

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        body: requestData,
      );

      if (response.statusCode == 200) {
        print('Food info updated successfully');
        print(widget.foods['foodID']);
      } else {
        print('Failed to update food info: ${response.statusCode}');
      }
    } catch (error) {
      print('Error updating food info: $error');
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
            'Menu detail ',
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
                  Row(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 70,
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  widget.foods['foodname'],
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Dish Information",
                                  style: TextStyle(
                                    fontSize: 24.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(children: [
                                  Container(
                                    width: 20,
                                  ),
                                  const Text(
                                    'Energy: ',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  const Expanded(
                                    child: Row(
                                      children: [Text("")],
                                    ),
                                  ),
                                  Text(
                                    '${widget.foods['Energy']}  mg',
                                    style: const TextStyle(fontSize: 24.0),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  )
                                ]),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(children: [
                                  Container(
                                    width: 20,
                                  ),
                                  const Text(
                                    'Fat: ',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  const Expanded(
                                    child: Row(
                                      children: [Text("")],
                                    ),
                                  ),
                                  Text(
                                    '${widget.foods['Fat']}  mg',
                                    style: const TextStyle(fontSize: 24.0),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  )
                                ]),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(children: [
                                  Container(
                                    width: 20,
                                  ),
                                  const Text(
                                    'Carbohydrate: ',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  const Expanded(
                                    child: Row(
                                      children: [Text("")],
                                    ),
                                  ),
                                  Text(
                                    '${widget.foods['Carbohydrate']}  mg',
                                    style: const TextStyle(fontSize: 24.0),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  )
                                ]),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(children: [
                                  Container(
                                    width: 20,
                                  ),
                                  const Text(
                                    'Protein:',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  const Expanded(
                                    child: Row(
                                      children: [Text("")],
                                    ),
                                  ),
                                  Text(
                                    '${widget.foods['Protein']}  mg',
                                    style: const TextStyle(fontSize: 24.0),
                                  ),
                                  Container(
                                    width: 20,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(children: [
                                  Container(
                                    width: 20,
                                  ),
                                  const Text(
                                    'Calcium:',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  const Expanded(
                                    child: Row(
                                      children: [Text("")],
                                    ),
                                  ),
                                  Text(
                                    '${widget.foods['Calcium']}  mg',
                                    style: const TextStyle(fontSize: 24.0),
                                  ),
                                  Container(
                                    width: 20,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(children: [
                                  Container(
                                    width: 20,
                                  ),
                                  const Text(
                                    'Magnesium:',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  const Expanded(
                                    child: Row(
                                      children: [Text("")],
                                    ),
                                  ),
                                  Text(
                                    '${widget.foods['Magnesium']}  mg',
                                    style: const TextStyle(fontSize: 24.0),
                                  ),
                                  Container(
                                    width: 20,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(children: [
                                  Container(
                                    width: 20,
                                  ),
                                  const Text(
                                    'Sodium:',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  const Expanded(
                                    child: Row(
                                      children: [Text("")],
                                    ),
                                  ),
                                  Text(
                                    '${widget.foods['Sodium']}  mg',
                                    style: const TextStyle(fontSize: 24.0),
                                  ),
                                  Container(
                                    width: 20,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(children: [
                                  Container(
                                    width: 20,
                                  ),
                                  const Text(
                                    'Potassium:',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  const Expanded(
                                    child: Row(
                                      children: [Text("")],
                                    ),
                                  ),
                                  Text(
                                    '${widget.foods['Potassium']}  mg',
                                    style: const TextStyle(fontSize: 24.0),
                                  ),
                                  Container(
                                    width: 20,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(children: [
                                  Container(
                                    width: 20,
                                  ),
                                  const Text(
                                    'Iron:',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  const Expanded(
                                    child: Row(
                                      children: [Text("")],
                                    ),
                                  ),
                                  Text(
                                    '${widget.foods['Iron']}  mg',
                                    style: const TextStyle(fontSize: 24.0),
                                  ),
                                  Container(
                                    width: 20,
                                  ),
                                ]),
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ]),
                  SizedBox(
                    child: ButtonTheme(
                      height: 70,
                      child: Container(
                        padding: EdgeInsets.zero, // ADD THIS LINE
                        child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.all(10),
                                height: 50.0,
                                // ignore: deprecated_member_use
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ))),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Back",
                                      style: TextStyle(fontSize: 15)),
                                ),
                              ),
                              const Expanded(
                                  child: Column(
                                children: [Text('')],
                              )),
                              Container(
                                margin: const EdgeInsets.all(10),
                                height: 50.0,
                                // ignore: deprecated_member_use
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ))),
                                  onPressed: () {
                                    _updateFoodInfo();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Homepage(
                                          username: widget.username,
                                          selectedFood: int.parse(
                                              '${widget.foods['foodID']}'),
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text("Confirm",
                                      style: TextStyle(fontSize: 15)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ])),
          ))
        ]))));
  }
}
