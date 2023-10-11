import 'package:flutter/material.dart';
import 'package:tellme/homepage.dart';

class Menudetail extends StatelessWidget {
  const Menudetail({Key? key}) : super(key: key);

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
                const Text(
                  "Chicken wing",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.deepPurple,
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset(
                          'assets/images/sliced-boiled-chicken.png',
                        ),
                      ),
                      Container(
                        child: Column(
                          children: const [
                            Text(''' 
Calories
Restaurant
Price
Serving ''',
                                style: TextStyle(
                                  fontSize: 18,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 400,
                  child: Column(
                    children: [
                      const Text("Dish information",
                          style: TextStyle(
                            fontSize: 24,
                          )),
                      Container(
                        child: Row(
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
                                  fontSize: 18,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Menubutton(),
              ]),
            ),
          ),
        ],
      ),
    )));
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
                            builder: (context) => const Homepage()),
                      );
                    },
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.black,
                    textColor: const Color.fromRGBO(255, 255, 255, 1),
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
