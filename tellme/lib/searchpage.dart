// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';
import 'Components/button.dart';

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
                      FlatButton(
                        color: Colors.transparent,
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
                      FlatButton(
                        color: Colors.transparent,
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
                const ClickableContainer(),
                const ClickableContainer(),
                const ClickableContainer(),
                const backbutton(),
              ]),
            ),
          ),
        ],
      ),
    )));
  }
}
