// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:tellme/Components/button.dart';
import 'package:tellme/homepage.dart';

class select_catalog extends StatelessWidget {
  const select_catalog({Key? key}) : super(key: key);

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
            'Select catalog',
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
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 10,
                    ),
                    SizedBox.fromSize(
                      size: const Size(200, 200), // button width and height
                      child: ClipOval(
                        child: Material(
                          color: Colors.transparent, // button color
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Homepage(),
                                  ));
                            }, // button pressed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('assets/images/Veg.png',
                                    fit: BoxFit.fill),
                                const Text("Vegetables"), // text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 15,
                    ),
                    SizedBox.fromSize(
                      size: const Size(200, 200), // button width and height
                      child: ClipOval(
                        child: Material(
                          color: Colors.transparent, // button color
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Homepage(),
                                  ));
                            }, // button pressed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('assets/images/Fruits.png',
                                    fit: BoxFit.fill),
                                const Text("Fruits"), // text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 10,
                    ),
                    SizedBox.fromSize(
                      size: const Size(200, 200), // button width and height
                      child: ClipOval(
                        child: Material(
                          color: Colors.transparent, // button color
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Homepage(),
                                  ));
                            }, // button pressed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('assets/images/Gain.png',
                                    fit: BoxFit.fill),
                                const Text("Gain&Beans&Nuts"), // text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 15,
                    ),
                    SizedBox.fromSize(
                      size: const Size(200, 200), // button width and height
                      child: ClipOval(
                        child: Material(
                          color: Colors.transparent, // button color
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Homepage(),
                                  ));
                            }, // button pressed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('assets/images/Meats.png',
                                    fit: BoxFit.fill),
                                const Text("Meats&Poultry"), // text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 10,
                    ),
                    SizedBox.fromSize(
                      size: const Size(200, 200), // button width and height
                      child: ClipOval(
                        child: Material(
                          color: Colors.transparent, // button color
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Homepage(),
                                  ));
                            }, // button pressed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('assets/images/Seafood.png',
                                    fit: BoxFit.fill),
                                const Text("Fish and Seafood"), // text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 15,
                    ),
                    SizedBox.fromSize(
                      size: const Size(200, 200), // button width and height
                      child: ClipOval(
                        child: Material(
                          color: Colors.transparent, // button color
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Homepage(),
                                  ));
                            }, // button pressed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('assets/images/Dairy.png',
                                    fit: BoxFit.fill),
                                const Text("Dairy"), // text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const backbutton(),
              ]),
            ),
          ),
        ],
      ),
    )));
  }
}
