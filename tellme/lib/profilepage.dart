import 'package:flutter/material.dart';
import 'package:tellme/Modifypage.dart';
import 'package:tellme/calculateinfo.dart';
import 'package:tellme/historypage.dart';
import 'package:tellme/userdish.dart';
import 'package:tellme/loginpage.dart';
import 'package:tellme/select_catalog.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({Key? key}) : super(key: key);

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
            'Profile',
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
                                  builder: (context) => const Historypage()),
                            );
                          },
                          child: const Text('History'),
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
                                  builder: (context) => const userdish()),
                            );
                          },
                          child: const Text('Users dish'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color.fromARGB(255, 255, 171, 182),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            SizedBox(width: 10),
                            Text(
                              'Username',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            SizedBox(width: 10),
                            Text(
                              'Age',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            SizedBox(width: 10),
                            Text(
                              'Height',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            SizedBox(width: 10),
                            Text(
                              'Weight',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            SizedBox(width: 10),
                            Text(
                              'Target',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            SizedBox(width: 10),
                            Text(
                              'Gender',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            SizedBox(width: 10),
                            Text(
                              'Exercise level',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10, // <-- SEE HERE
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 20,
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
                                      builder: (context) => const Modifypage(
                                            title: '',
                                          )),
                                );
                              },
                              child: const Text('Modify'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 20,
                            ),
                            const Text(
                              'Main type',
                              style: TextStyle(fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 20,
                            ),
                            const Text(
                              'Meat and Paultry',
                              style: TextStyle(fontSize: 24),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.35,
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
                                          const select_catalog()),
                                );
                              },
                              child: const Text('Select'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 20,
                            ),
                            const Text(
                              'Calories intake',
                              style: TextStyle(fontSize: 24),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
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
                                          const Calculateinfo()),
                                );
                              },
                              child: const Text('Info'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 20,
                            ),
                            const Text(
                              'BMR:',
                              style: TextStyle(fontSize: 24),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.75,
                            ),
                            const Text(
                              '1,771.25       Cal/day',
                              style: TextStyle(fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 20,
                            ),
                            const Text(
                              'TDEE:',
                              style: TextStyle(fontSize: 24),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.8,
                            ),
                            const Text(
                              '1,771.25       Cal/day',
                              style: TextStyle(fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Profilebutton(),
                ])),
          )
        ],
      ),
    )));
  }
}

class Profilebutton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Profilebutton();

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
                            builder: (context) => const Loginpage()),
                      );
                    },
                    child: const Text("Logout", style: TextStyle(fontSize: 15)),
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
