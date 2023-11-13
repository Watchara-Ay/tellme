import 'dart:async';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tellme/select_catalog.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> listGen = <String>['Male', 'Female'];
const List<String> listGoal = <String>['Fit', 'Lose weight', 'Muscle gain'];
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
        selectedDate = picked;
      });
    }
  }

  @override
  final formKey = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  TextEditingController dateofbirth = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController Goal = TextEditingController();
  TextEditingController exercise_level = TextEditingController();

  Future sign_up() async {
    String url = "http://192.168.1.44/flutter_login/register.php";
    final respone = await http.post(Uri.parse(url), body: {
      'username': username.text,
      'password': password.text,
      'comfirm_password': confirm_password.text,
      'dateofbirth': dateofbirth.text,
      'height': height.text,
      'weight': weight.text,
      'Goal': Goal.text,
      'exercise_level': exercise_level.text
    });
    var data = json.decode(respone.body);
    if (data == "Error") {
      Navigator.pushNamed(context, 'register');
    } else {
      Navigator.pushNamed(context, 'loginpage');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Modify page',
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
            Container(
              height: MediaQuery.of(context).size.height / 1.1,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
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
                                  onSaved: (username) {},
                                  controller: username,
                                ),
                                const Text("Password", //
                                    style: TextStyle(fontSize: 20)),
                                TextFormField(
                                  validator: RequiredValidator(
                                      errorText: "Please fill something!!!"),
                                  onSaved: (username) {},
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
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const Text("Date of birth", //
                                        style: TextStyle(fontSize: 20)),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                          color: Color.fromRGBO(255, 0, 0, 1),
                                        ),
                                      ),
                                      onPressed: () => _selectDate(context),
                                      child: Text("${selectedDate.toLocal()}"
                                          .split(' ')[0]),
                                    ),
                                    TextFormField(
                                      onSaved: (selectedDate) {},
                                      controller: dateofbirth,
                                    )
                                  ],
                                ),
                                const Text("Height", //
                                    style: TextStyle(fontSize: 20)),
                                TextFormField(
                                  validator: RequiredValidator(
                                      errorText: "Please fill something!!!"),
                                  onSaved: (lastname) {
                                    // profile.lastname = lastname!;
                                  },
                                  controller: height,
                                ),
                                const Text("Weight", //
                                    style: TextStyle(fontSize: 20)),
                                TextFormField(
                                  validator: RequiredValidator(
                                      errorText: "Please fill something!!!"),
                                  onSaved: (lastname) {
                                    // profile.lastname = lastname!;
                                  },
                                  controller: weight,
                                ),
                                const Text("Gender",
                                    style: TextStyle(fontSize: 20)),
                                DropdownButton<String>(
                                  value: gen,
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      gen = value!;
                                    });
                                  },
                                  items: listGen.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                                const Text("Goal to archive",
                                    style: TextStyle(fontSize: 20)),
                                DropdownButton<String>(
                                  value: goal,
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      goal = value!;
                                    });
                                  },
                                  items: listGoal.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                                const Text("Exercise level",
                                    style: TextStyle(fontSize: 20)),
                                DropdownButton<String>(
                                  value: eL,
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      eL = value!;
                                    });
                                  },
                                  items: listEL.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
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
                                            //var formKey;
                                            /* bool pass = formKey.currentState!
                                                .validate();
                                            if (pass) {
                                              sign_up();
                                            }*/

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
