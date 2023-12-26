// ignore_for_file: unnecessary_new, camel_case_types

import 'package:flutter/material.dart';
import 'package:tellme/Components/button.dart';

import 'otheruserhistory.dart';

class userdish extends StatelessWidget {
  const userdish({Key? key}) : super(key: key);

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
            'User dish',
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
            child: new Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    )),
                child: Column(children: [
                  const SizedBox(
                    height: 50, // <-- SEE HERE
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 20,
                      ),
                      const Text(
                        "Similar to user",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.8,
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
                                builder: (context) => const otheruserhistory()),
                          );
                        },
                        child: const Text('View'),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.green, width: 2.0)),
                    child: const Column(
                      children: [
                        userdishinfo(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10, // <-- SEE HERE
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 20,
                      ),
                      const Text(
                        "Random same target",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.25,
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
                                builder: (context) => const otheruserhistory()),
                          );
                        },
                        child: const Text('View'),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.green, width: 2.0)),
                    child: const Column(
                      children: [
                        userdishinfo(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10, // <-- SEE HERE
                  ),
                  const backbutton(),
                ])),
          )
        ],
      ),
    )));
  }
}

class userdishinfo extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const userdishinfo();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Name       Ckickenwings\nCalories    199  cals",
            style: TextStyle(fontSize: 15)),
        SizedBox(
          height: 10,
        ),
        Text("Name       Ckickenwings\nCalories    199  cals",
            style: TextStyle(fontSize: 15)),
        SizedBox(
          height: 10,
        ),
        Text("Name       Ckickenwings\nCalories    199  cals",
            style: TextStyle(fontSize: 15)),
      ],
    );
  }
}
