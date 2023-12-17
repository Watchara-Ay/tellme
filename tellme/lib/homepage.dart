import 'package:flutter/material.dart';
import 'package:tellme/profilepage.dart';
import 'package:tellme/recommendedmenu.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text(
                'Homepage',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.3,
              ),
              IconButton(
                icon: const Icon(Icons.account_circle),
                color: Colors.black,
                padding: EdgeInsets.zero,
                iconSize: 50,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profilepage()),
                  );
                },
              ),
            ],
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
                    height: 10, // <-- SEE HERE
                  ),
                  Text(
                    getCurrentDate(),
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
                          width: MediaQuery.of(context).size.width / 2.2 + 50,
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
                      '',
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
                              width:
                                  MediaQuery.of(context).size.width / 2.2 + 80,
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
                          '',
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
                              width:
                                  MediaQuery.of(context).size.width / 2.2 + 72,
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
                          '',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10,
                          ),
                          const Text("Today: consume              kcal",
                              style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10,
                          ),
                          const Text("You need: ",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.red)),
                        ],
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
