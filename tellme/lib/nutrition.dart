import 'package:flutter/material.dart';
import 'package:tellme/Components/button.dart';
import 'package:tellme/profilepage.dart';

class Nutritioninfo extends StatelessWidget {
  const Nutritioninfo({Key? key}) : super(key: key);

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
            'Nutrition Info ',
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
                  Column(
                    children: [
                      const Text(
                        "Body needs per day",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
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
                        '''
Calories                                                Cal/day
Cholesterol                                           mg/day
Sodium                                                 mg/day
Calcium                                                mg/day
Magnesium                                          mg/day
Potassium                                             mg/day
Iron                                                       mg/day''',
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
                  Column(
                    children: const [
                      SizedBox(
                        height: 10, // <-- SEE HERE
                      ),
                      Nutritionbutton(),
                    ],
                  )
                ])),
          )
        ],
      ),
    )));
  }
}

class Nutritionbutton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Nutritionbutton();

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
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(
                            color: Color.fromRGBO(0, 0, 0, 1))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.black,
                    textColor: const Color.fromRGBO(255, 255, 255, 1),
                    child: const Text("Back", style: TextStyle(fontSize: 15)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 50.0,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(
                            color: Color.fromRGBO(0, 0, 0, 1))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profilepage()),
                      );
                    },
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.black,
                    textColor: const Color.fromRGBO(255, 255, 255, 1),
                    child:
                        const Text("Profile", style: TextStyle(fontSize: 15)),
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