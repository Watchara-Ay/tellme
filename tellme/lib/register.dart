import 'dart:async';
import 'package:dob_input_field/dob_input_field.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:tellme/select_catalog.dart';
import 'dart:async';
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

class Register extends StatefulWidget {
  const Register({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  final formKey = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  TextEditingController dateofbirth = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController Goal = TextEditingController();
  TextEditingController exercise_level = TextEditingController();
  TextEditingController isP = TextEditingController();

  Map<int, String> mappedGender = listGen.asMap();
  String? selectedGender;
  bool isPregnant = false;
  DateTime selectedDate = DateTime.now();
  String gen = listGen.first;
  String goal = listGoal.first;
  String eL = listEL.first;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        dateofbirth.text = selectedDate.toLocal().toString().split(' ')[0];
      });
    }
  }

  Future sign_up() async {
    String url = "http://192.168.1.44/flutter_login/register.php";
    final respone = await http.post(Uri.parse(url), body: {
      'username': username.text,
      'password': password.text,
      'comfirm_password': confirm_password.text,
      'dateofbirth': selectedDate.toIso8601String(),
      'height': height.text,
      'weight': weight.text,
      'gender': gender.text,
      'Goal': Goal.text,
      'exercise_level': exercise_level.text,
      'isPregnant': isPregnant.toString(),
    });
    var data = json.decode(respone.body);
    if (data == "Error") {
      Navigator.pushNamed(context, 'register');
    } else {
      Navigator.pushNamed(context, 'loginpage');
    }
  }

  @override
  Widget build(BuildContext context) {
    String? selectedGoal;
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
    List<String> goalsprag = ['Fit', 'Muscle gain'];
    List<String> selectedList =
        selectedGender == 'Female' && isPregnant == true ? goalsprag : goals;
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
                                  },
                                  controller: username,
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
                                                print(isPregnant);
                                              });
                                            }
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
                                            var formKey;
                                            bool pass = formKey.currentState!
                                                .validate();
                                            if (pass) {
                                              sign_up();
                                            }

                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const select_catalog(),
                                                ));
                                          },
                                          child: const Text("Next",
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
