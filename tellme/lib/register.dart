import 'dart:async';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tellme/select_catalog.dart';

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
                  child: Column(children: [
                    Form(
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Username",
                                  style: TextStyle(fontSize: 20)),
                              TextFormField(
                                validator: RequiredValidator(
                                    errorText: "Please fill something!!!"),
                                onSaved: (username) {},
                              ),
                              const Text("Password",
                                  style: TextStyle(fontSize: 20)),
                              TextFormField(
                                validator: RequiredValidator(
                                    errorText: "Please fill something!!!"),
                                onSaved: (username) {},
                              ),
                              const Text("Confirm password",
                                  style: TextStyle(fontSize: 20)),
                              TextFormField(
                                validator: RequiredValidator(
                                    errorText: "Please fill something!!!"),
                                onSaved: (username) {},
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Text("Date of birth",
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
                                ],
                              ),
                              const Text("Height",
                                  style: TextStyle(fontSize: 20)),
                              TextFormField(
                                validator: RequiredValidator(
                                    errorText: "Please fill something!!!"),
                                onSaved: (lastname) {
                                  // profile.lastname = lastname!;
                                },
                              ),
                              const Text("Weight",
                                  style: TextStyle(fontSize: 20)),
                              TextFormField(
                                validator: RequiredValidator(
                                    errorText: "Please fill something!!!"),
                                onSaved: (lastname) {
                                  // profile.lastname = lastname!;
                                },
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
                              const RegisterpageButton()
                            ]),
                      ),
                    ),
                  ])),
            )
          ],
        ),
      ),
    );
  }
}

class RegisterpageButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const RegisterpageButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                            MaterialStateProperty.all(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel", style: TextStyle(fontSize: 15)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 50.0,
                  // ignore: deprecated_member_use
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const select_catalog(),
                          ));
                    },
                    child: const Text("Next", style: TextStyle(fontSize: 15)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
