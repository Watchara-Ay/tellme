// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:tellme/recommendedmenu.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

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
            'Homepage',
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
          new Container(
            height: MediaQuery.of(context).size.height / 1.2,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: new Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    )),
                child: Column(children: [
                  Text(
                    "11 May, 2023",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6), fontSize: 24),
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
                          width: MediaQuery.of(context).size.width / 2 + 50,
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
                        border: Border.all(color: Colors.green, width: 2.0)),
                    child: const Text(
                      'Name',
                      style: TextStyle(fontSize: 24),
                    ),
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
                              width: MediaQuery.of(context).size.width / 2 + 80,
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
                        child: const Text(
                          'Name',
                          style: TextStyle(fontSize: 24),
                        ),
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
                              width: MediaQuery.of(context).size.width / 2 + 72,
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
                        child: const Text(
                          'Name',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ],
                  )
                ])),
          )
        ],
      ),
    )));
  }
}

class MyCustomForm {}

// Widget _buildtest(BuildContext context){
//   return c
// }

// Widget _buildmenuList(BuildContext context, List<Menuspage> menus) {
//   return Padding(
//     padding: const EdgeInsets.all(30.0),
//     child: ListView.builder(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 12,
//         vertical: 24,
//       ),
//       itemCount: menus.length,
//       itemBuilder: (context, index) {
//         var course = menus[index];
//         return Container(
//           height: 50,
//           child: ElevatedButton(
//             style: ButtonStyle(
//               padding: MaterialStateProperty.all(const EdgeInsets.only(
//                   left: 35, right: 35, top: 15, bottom: 15)),
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(40.0),
//                 ),
//               ),
//               backgroundColor: MaterialStateProperty.all(
//                   const Color.fromARGB(255, 0, 255, 204)),
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const Menuspage()),
//               );
//             },
//             child: Container(
//                 height: MediaQuery.of(context).size.height / 1.2,
//                 color: Colors.transparent,
//                 child: new Container(
//                   decoration: const BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(40.0),
//                         topRight: Radius.circular(40.0),
//                       )),
//                 )),
//             // child: Text(
//             //   course.name,
//             //   style: const TextStyle(fontSize: 16, color: Colors.black),
//             // ),
//           ),
//         );
//       },
//     ),
//   );
// }
