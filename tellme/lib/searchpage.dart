// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';
import 'Components/button.dart';
import 'menudetail.dart';

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
          Expanded(
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
                        hintText: 'Menus name',
                        filled: true,
                        fillColor: Color.fromRGBO(255, 229, 229, 1),
                      ),
                      style: TextStyle(
                        fontSize: 24,
                      )),
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 217, 214, 1),
                  ),
                  child: Row(
                    children: [
                      const DecoratedBox(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 164, 158)),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 50,
                      ),
                      const Text(
                        "Sort by: ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 10,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Text(
                              'Calories',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 10,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Name',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SearchContainer(),
                const SearchContainer(),
                const SearchContainer(),
                const SearchContainer(),
                const backbutton(),
              ]),
            ),
          ),
        ],
      ),
    )));
  }
}

class SearchContainer extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const SearchContainer();

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
                  width: MediaQuery.of(context).size.width / 1.05,
                  height: 100,
                  // ignore: deprecated_member_use
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Menudetail()),
                      );
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    child: const Text(
                        "Name       Ckickenwings\nCalories    199  cals\nDistance   199  km\n",
                        style: TextStyle(fontSize: 15)),
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
