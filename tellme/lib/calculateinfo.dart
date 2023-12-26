import 'package:flutter/material.dart';

class Calculateinfo extends StatelessWidget {
  const Calculateinfo({Key? key}) : super(key: key);

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
            'Calculate Info',
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 7,
                      ),
                      const Text(
                        "Basal Metabolic Rate(BMR)",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 7,
                      ),
                      const Text(
                        '''BMR is number of calories your body
needs to fuel for per day''',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 7,
                      ),
                      const Text(
                        '''BMR for man = 10 x weight (kg) 
+ 6.25 x height (cm) – 5 x age (y) + 5''',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 7,
                      ),
                      const Text(
                        '''BMR for woman = 10 x weight (kg) 
+ 6.25 x height (cm) – 5 x age (y) – 161 ''',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 7,
                      ),
                      const Text(
                        '''Total daily energy expenditure(TDEE)''',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 7,
                      ),
                      const Text(
                        '''Exercise level 5 levels
Sedentary                   BMR X 1.2
Light activity               BMR X 1.375
Moderate activity       BMR X 1.55
Very activity                BMR X 1.725
Extremely activity       BMR X 1.9''',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const Expanded(
                      child: Column(
                    children: [Text("")],
                  )),
                  const Infobutton(),
                ])),
          )
        ],
      ),
    )));
  }
}

class Infobutton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Infobutton();

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
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 181, 255, 235)),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
