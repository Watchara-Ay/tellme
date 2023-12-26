import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:tellme/Modifypage.dart';
import 'package:tellme/calculateinfo.dart';
import 'package:tellme/historypage.dart';
import 'package:tellme/userdish.dart';
import 'package:tellme/loginpage.dart';
import 'package:tellme/select_catalog.dart';
import 'package:http/http.dart' as http;

class Profilepage extends StatefulWidget {
  final String username;

  const Profilepage({Key? key, required this.username}) : super(key: key);

  @override
  _ProfilepageState createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  late Future<Map<String, dynamic>> userData;

  @override
  void initState() {
    super.initState();
    userData = fetchUserData(widget.username);
  }

  Future<Map<String, dynamic>> fetchUserData(String username) async {
    final apiUrl = 'http://127.0.0.1:8000/profile.php?username=$username';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Exception occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final userData = snapshot.data!;
            return buildProfileUI(userData);
          } else {
            return const Center(child: Text('No data available '));
          }
        },
      ),
    );
  }

  Widget buildProfileUI(Map<String, dynamic> userData) {
    return Scaffold(
        body: Center(
            child: SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Profile',
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
            child: SingleChildScrollView(
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
                                color: Color.fromRGBO(255, 172, 194, 1),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Historypage(username: widget.username),
                                ),
                              );
                            },
                            child: const Text('History'),
                          ),
                          const Expanded(
                              child: Row(
                            children: [Text("")],
                          )),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(255, 212, 212, 1),
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
                          const SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: const Color.fromARGB(255, 255, 200, 207),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              const Text(
                                'username: ',
                                style: TextStyle(fontSize: 20),
                              ),
                              const Expanded(
                                  child: Row(
                                children: [Text("")],
                              )),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Text(
                                  '${userData['username']}',
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              const Text(
                                'Age: ',
                                style: TextStyle(fontSize: 20),
                              ),
                              const Expanded(
                                  child: Row(
                                children: [Text("")],
                              )),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Text(
                                  '${userData['Age']} years old',
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              const Text(
                                'Height: ',
                                style: TextStyle(fontSize: 20),
                              ),
                              const Expanded(
                                  child: Row(
                                children: [Text("")],
                              )),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Text(
                                  '${userData['height']} Cm',
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              const Text(
                                'Weight: ',
                                style: TextStyle(fontSize: 20),
                              ),
                              const Expanded(
                                  child: Row(
                                children: [Text("")],
                              )),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Text(
                                  '${userData['weight']} Kg',
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              const Text(
                                'Goal: ',
                                style: TextStyle(fontSize: 20),
                              ),
                              const Expanded(
                                  child: Row(
                                children: [Text("")],
                              )),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Text(
                                  '${userData['goal']}',
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              const Text(
                                'Gender: ',
                                style: TextStyle(fontSize: 20),
                              ),
                              const Expanded(
                                  child: Row(
                                children: [Text("")],
                              )),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Text(
                                  '${userData['gender']}',
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              const Text(
                                'Exercise Level: ',
                                style: TextStyle(fontSize: 20),
                              ),
                              const Expanded(
                                  child: Row(
                                children: [Text("")],
                              )),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Text(
                                  '${userData['exercise_level']}',
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              if (userData["gender"] == "Female") ...[
                                const SizedBox(width: 10),
                                const Text(
                                  'isPregnant: ',
                                  style: TextStyle(fontSize: 20),
                                ),
                                const Expanded(
                                    child: Row(
                                  children: [Text("")],
                                )),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Text(
                                    '${userData['isPregnent']}',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                              ]
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
                              Text(
                                '${userData['preference']}',
                                style: const TextStyle(fontSize: 24),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
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
                                          builder: (context) => SelectCatalog(
                                            username: widget.username,
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text('Select'),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              )
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
                              const Spacer(), // This will occupy the available space
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
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: const Row(
                                  children: [
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                      'BMR:',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '${userData['bmrPoint']}    Cal/day',
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: const Row(
                                  children: [
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                      'TDEE:',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '${userData['tdeePoint']}    Cal/day',
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: const Row(
                                  children: [
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                      'Goal Point:',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '${userData['goalPoint']}    Cal/day',
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const Expanded(
                        child: Column(
                      children: [Text("")],
                    )),
                    const Profilebutton(),
                  ])),
            ),
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
          padding: EdgeInsets.zero,
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 50.0,
                  // ignore: deprecated_member_use
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Back", style: TextStyle(fontSize: 15)),
                  ),
                ),
                const Spacer(), // Adds space between buttons
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 50.0,
                  // ignore: deprecated_member_use
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
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
