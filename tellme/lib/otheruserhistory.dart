// ignore_for_file: unnecessary_new, camel_case_types

import 'package:flutter/material.dart';
import 'package:tellme/Components/button.dart';
import 'package:tellme/homepage.dart';
import 'package:tellme/recommendedmenu.dart';

class otheruserhistory extends StatelessWidget {
  const otheruserhistory({Key? key}) : super(key: key);

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
            'Dish History',
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
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                      ),
                      Text(
                        "Username:  ",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 8, 41, 255)
                                .withOpacity(0.6),
                            fontSize: 24),
                      ),
                      Text(
                        "Bongtong",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.6),
                            fontSize: 24),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50, // <-- SEE HERE
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 20,
                        ),
                        const Text(
                          "Breakfast",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.2 + 50,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(255, 0, 0, 1),
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    scrollable: true,
                                    backgroundColor: Colors.transparent,
                                    content: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 50.0,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Homepage()),
                                                );
                                              },
                                              child: const Text('Breakfast'),
                                              style: ElevatedButton.styleFrom(
                                                  shape: const StadiumBorder()),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 40,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 50.0,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Homepage()),
                                                );
                                              },
                                              child: const Text('Lunch'),
                                              style: ElevatedButton.styleFrom(
                                                  shape: const StadiumBorder()),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 40,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 50.0,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Homepage()),
                                                );
                                              },
                                              child: const Text('Dinner'),
                                              style: ElevatedButton.styleFrom(
                                                  shape: const StadiumBorder()),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: const Text('Select'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.green, width: 2.0)),
                    child: const otheruserdishinfo(),
                  ),
                  const SizedBox(
                    height: 10, // <-- SEE HERE
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10, // <-- SEE HERE
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 20,
                            ),
                            const Text(
                              "Lunch",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                            Container(
                              width:
                                  MediaQuery.of(context).size.width / 2.2 + 80,
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
                                      builder: (context) =>
                                          const Recommendedmenu()),
                                );
                              },
                              child: const Text('Select'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: MediaQuery.of(context).size.height / 6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border:
                                Border.all(color: Colors.green, width: 2.0)),
                        child: const otheruserdishinfo(),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10, // <-- SEE HERE
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 20,
                            ),
                            const Text(
                              "Dinner",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                            Container(
                              width:
                                  MediaQuery.of(context).size.width / 2.2 + 72,
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
                                      builder: (context) =>
                                          const Recommendedmenu()),
                                );
                              },
                              child: const Text('Select'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: MediaQuery.of(context).size.height / 6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border:
                                Border.all(color: Colors.green, width: 2.0)),
                        child: const otheruserdishinfo(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.7,
                          ),
                          const Text("Consume               Kcal",
                              style: TextStyle(fontSize: 18))
                        ],
                      ),
                      const backbutton(),
                    ],
                  )
                ])),
          )
        ],
      ),
    )));
  }
}

class otheruserdishinfo extends StatelessWidget {
  const otheruserdishinfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(children: [
        const SizedBox(
          width: 15,
        ),
        Column(children: const [
          Text("Nigiri sushi", style: TextStyle(fontSize: 15)),
          SizedBox(
            height: 90,
          ),
          Text("Calories", style: TextStyle(fontSize: 15)),
        ]),
        SizedBox(
          height: 400,
          child: Column(
            children: [
              const Text("Dish information",
                  style: TextStyle(
                    fontSize: 14,
                  )),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 10,
                  ),
                  const Text('''
Cholesterol                                           mg
Sodium                                                 mg
Calcium                                                mg
Magnesium                                          mg
Potassium                                             mg
Iron                                                       mg''',
                      style: TextStyle(
                        fontSize: 14,
                      )),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
