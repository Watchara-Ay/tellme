import 'package:flutter/material.dart';
import 'package:tellme/homepage.dart';

class Menudetail extends StatelessWidget {
  final Map<String, dynamic> foods;

  const Menudetail({Key? key, required this.foods}) : super(key: key);

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
            'Menu detail',
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
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      )),
                  child: Column(children: [
                    Row(children: [
                      const SizedBox(
                        width: 20,
                        height: 200,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 1.2,
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    foods['foodname'],
                                    style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Dish Information",
                                    style: TextStyle(
                                      fontSize: 24.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  const Text(
                                    'Energy:',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                  ),
                                  Text(
                                    '${foods['Energy']}  kcal',
                                    style: const TextStyle(fontSize: 24.0),
                                  ),
                                ]),
                                Row(children: [
                                  const Text(
                                    'Fat:',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width /
                                        2.15,
                                  ),
                                  Text(
                                    '${foods['Fat']}  mg',
                                    style: const TextStyle(fontSize: 24.0),
                                  ),
                                ]),
                                Row(children: [
                                  const Text(
                                    'Carbohydrate: ',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width /
                                        3.55,
                                  ),
                                  Text(
                                    '${foods['Carbohydrate']}  mg',
                                    style: const TextStyle(fontSize: 24.0),
                                  ),
                                ]),
                                Row(children: [
                                  const Text(
                                    'Protein:',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width /
                                        2.52,
                                  ),
                                  Text(
                                    '${foods['Protein']}  mg',
                                    style: const TextStyle(fontSize: 24.0),
                                  ),
                                ]),
                                Row(children: [
                                  const Text(
                                    'Calcium:',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.6,
                                  ),
                                  Text(
                                    '${foods['Calcium']}  mg',
                                    style: const TextStyle(fontSize: 24.0),
                                  ),
                                ]),
                                Row(children: [
                                  const Text(
                                    'Magnesium:',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3.1,
                                  ),
                                  Text(
                                    '${foods['Magnesium']}  mg',
                                    style: const TextStyle(fontSize: 24.0),
                                  ),
                                ]),
                                Row(children: [
                                  const Text(
                                    'Sodium:',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width /
                                        2.57,
                                  ),
                                  Text(
                                    '${foods['Sodium']}  mg',
                                    style: const TextStyle(fontSize: 24.0),
                                  ),
                                ]),
                                Row(children: [
                                  const Text(
                                    'Potassium:',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width /
                                        2.85,
                                  ),
                                  Text(
                                    '${foods['Potassium']}  mg',
                                    style: const TextStyle(fontSize: 24.0),
                                  ),
                                ]),
                                Row(children: [
                                  const Text(
                                    'Iron:',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.2,
                                  ),
                                  Text(
                                    '${foods['Iron']}  mg',
                                    style: const TextStyle(fontSize: 24.0),
                                  ),
                                ]),
                              ],
                            )),
                          ],
                        ),
                      ),
                    ]),
                    const Menubutton(),
                  ])))
        ]))));
  }
}

class Menubutton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Menubutton();

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
                    child: const Text("Back", style: TextStyle(fontSize: 15)),
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
                            builder: (context) => const Homepage()),
                      );
                    },
                    child:
                        const Text("Confirm", style: TextStyle(fontSize: 15)),
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
