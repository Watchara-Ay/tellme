import 'dart:async';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:tellme/profilepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> listGen = <String>['Male', 'Female'];
const List<String> listGoal = <String>['Fit', 'Lose weight', 'Muscle gain'];
const List<String> listGoalPrag = <String>['Fit', 'Muscle gain'];
const List<String> listEL = <String>[
  'Sedentary',
  'Light activity',
  'Moderate activity',
  'Very active',
  'Extremely activity'
];

class Person {
  String _username = '';
  String get uname => _username;
  set uname(String value) {
    if (value.isNotEmpty) {
      _username = value;
    }
  }
}

class Modifypage extends StatefulWidget {
  const Modifypage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Modifypage> createState() => _Modifypage();
}

class _Modifypage extends State<Modifypage> {
  final formKey = GlobalKey<FormState>();
  final Person person = Person();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  TextEditingController dateofbirth = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController goals = TextEditingController();
  TextEditingController exercise_level = TextEditingController();
  TextEditingController isP = TextEditingController();

  Map<int, String> mappedGender = listGen.asMap();
  String selectedGender = '';
  bool isPregnant = false;
  DateTime date = DateTime.now();
  String? selectedDate;
  String gen = listGen.first;
  String goal = listGoal.first;
  String eL = listEL.first;
  String selectedGoal = 'Fit';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1950, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != date) {
      setState(() {
        dateofbirth.text = date.toLocal().toString().split(' ')[0];
      });
    }
  }

  Future update() async {
    String url = "http://127.0.0.1:8000/modify.php";
    final respone = await http.post(Uri.parse(url), body: {
      'username': username.text,
      'password': password.text,
      'comfirm_password': confirm_password.text,
      'dateofbirth': selectedDate.toString(),
      'height': height.text,
      'weight': weight.text,
      'gender': selectedGender,
      'goal': selectedGoal,
      'exercise_level': eL,
      'isPregnent': isPregnant ? "1" : "0",
    });

    var data = json.decode(respone.body);
    if (data == "Error") {
      Navigator.pushNamed(context, 'register');
    } else {
      Navigator.pushNamed(context, 'loginpage');
    }
  }

  void clearFormFields() {
    username.clear();
    password.clear();
    confirm_password.clear();
    dateofbirth.clear();
    height.clear();
    weight.clear();
    exercise_level.clear();
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    List<String> goals = ['Fit', 'Lose weight', 'Muscle gain'];
    List<String> goalspreg = ['Fit', 'Muscle gain'];
    List<String> selectedList =
        selectedGender == 'Female' && isPregnant == true ? goalspreg : goals;
    List<String> eLs = [
      'Sedentary',
      'Light activity',
      'Moderate activity',
      'Very active',
      'Extremely activity'
    ];

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 12,
              width: MediaQuery.of(context).size.width,
              child: const Text(
                'Modify page',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      )),
                  child: Form(
                    key: formKey,
                    child: Column(children: [
                      Form(
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Username", //
                                    style: TextStyle(fontSize: 20)),
                                TextFormField(
                                  validator: RequiredValidator(
                                      errorText: "Please fill something!!!"),
                                  onSaved: (username) {
                                    print(username);
                                    person.uname = username.toString();
                                  },
                                  controller: username,
                                  maxLength: 15,
                                ),
                                TextField(
                                  controller: dateofbirth,
                                  decoration: const InputDecoration(
                                      labelText: "Date of birth",
                                      floatingLabelStyle:
                                          TextStyle(fontSize: 10)),
                                  readOnly:
                                      true, //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now());
                                    if (pickedDate != null) {
                                      print(pickedDate);
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      print(formattedDate);
                                      setState(() {
                                        selectedDate = formattedDate;
                                        dateofbirth.text = formattedDate;
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
                                ),
                                const Text("Height", //
                                    style: TextStyle(fontSize: 20)),
                                TextFormField(
                                  validator: RequiredValidator(
                                      errorText: "Please fill something!!!"),
                                  onSaved: (height) {
                                    // profile.lastname = lastname!;
                                  },
                                  controller: height,
                                ),
                                const Text("Weight", //
                                    style: TextStyle(fontSize: 20)),
                                TextFormField(
                                  validator: RequiredValidator(
                                      errorText: "Please fill something!!!"),
                                  onSaved: (weight) {
                                    // profile.lastname = lastname!;
                                  },
                                  controller: weight,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        const Text('Selected gender',
                                            style: TextStyle(fontSize: 20)),
                                        Radio(
                                          value: 'Male',
                                          groupValue: selectedGender,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedGender = value.toString();
                                              print(selectedGender);
                                            });
                                          },
                                        ),
                                        const Text('Male'),
                                        Radio(
                                          value: 'Female',
                                          groupValue: selectedGender,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedGender = value.toString();
                                              print(selectedGender);
                                            });
                                          },
                                        ),
                                        const Text('Female'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Are you pregnant?',
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                        Checkbox(
                                          checkColor: Colors.white,
                                          fillColor:
                                              MaterialStateProperty.resolveWith(
                                                  getColor),
                                          value: isPregnant,
                                          onChanged: (bool? value) {
                                            if (selectedGender == 'Female') {
                                              setState(() {
                                                isPregnant = true;
                                              });
                                            } else {
                                              isPregnant = false;
                                            }
                                            print(isPregnant);
                                          },
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 20.0),
                                    DropdownButtonFormField(
                                      value: selectedGoal,
                                      items: selectedList.map((String goal) {
                                        return DropdownMenuItem<String>(
                                          value: goal,
                                          child: Text(goal),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedGoal = value.toString();
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        labelText: 'Select Goal',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20.0),
                                DropdownButtonFormField(
                                  value: eL,
                                  items: listEL.map((String level) {
                                    return DropdownMenuItem<String>(
                                      value: level,
                                      child: Text(level),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      eL = value.toString();
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    labelText:
                                        'Select Exercise Level', // Change the label to Exercise Level
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const Text("Password", //
                                    style: TextStyle(fontSize: 20)),
                                TextFormField(
                                  validator: RequiredValidator(
                                      errorText: "Please fill something!!!"),
                                  onSaved: (value) {
                                    print(password);
                                  },
                                  controller: password,
                                  obscureText: true,
                                ),
                                const Text("Confirm password",
                                    style: TextStyle(fontSize: 20)),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please fill something!!!";
                                    } else if (value != password.text) {
                                      return "Password not match";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (username) {},
                                  obscureText: true,
                                ),
                                SizedBox(
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
                                          child: const Text("Cancel",
                                              style: TextStyle(fontSize: 15)),
                                        ),
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
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ))),
                                          onPressed: () {
                                            update();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Profilepage(),
                                                ));
                                          },
                                          child: const Text("Confirm",
                                              style: TextStyle(fontSize: 15)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ]),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
