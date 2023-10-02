import 'package:flutter/material.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({Key? key}) : super(key: key);
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
            'Search menu',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 36,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30.0),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.2,
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Username',
                        filled: true,
                        fillColor: Color.fromRGBO(255, 229, 229, 1),
                      ),
                      style: TextStyle(
                        fontSize: 24,
                      )),
                ),
                const Text(
                  "chicken",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 7,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 80,
                        decoration: const BoxDecoration(color: Colors.black),
                      ),
                      Container(
                        width: 50,
                      ),
                      Column(children: [
                        Container(
                          height: 20,
                        ),
                        const Text(
                          "Name",
                          style: TextStyle(fontSize: 18),
                        ),
                        const Text(
                          "Calories",
                          style: TextStyle(fontSize: 18),
                        ),
                        const Text(
                          "Distance",
                          style: TextStyle(fontSize: 18),
                        ),
                      ]),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 7,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 80,
                        decoration: const BoxDecoration(color: Colors.black),
                      ),
                      Container(
                        width: 50,
                      ),
                      Column(children: [
                        Container(
                          height: 20,
                        ),
                        const Text(
                          "Name",
                          style: TextStyle(fontSize: 18),
                        ),
                        const Text(
                          "Calories",
                          style: TextStyle(fontSize: 18),
                        ),
                        const Text(
                          "Distance",
                          style: TextStyle(fontSize: 18),
                        ),
                      ]),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 7,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 80,
                        decoration: const BoxDecoration(color: Colors.black),
                      ),
                      Container(
                        width: 50,
                      ),
                      Column(children: [
                        Container(
                          height: 20,
                        ),
                        const Text(
                          "Name",
                          style: TextStyle(fontSize: 18),
                        ),
                        const Text(
                          "Calories",
                          style: TextStyle(fontSize: 18),
                        ),
                        const Text(
                          "Distance",
                          style: TextStyle(fontSize: 18),
                        ),
                      ]),
                    ],
                  ),
                ),
                const TextButtonExample(),
              ]),
            ),
          )
        ],
      ),
    )));
  }
}

class TextButtonExample extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const TextButtonExample();

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
