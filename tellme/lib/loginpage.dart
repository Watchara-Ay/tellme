import 'package:flutter/material.dart';
import 'homepage.dart';
import 'register.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/logo-no-background.png', scale: 0.6),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(40)),
            width: MediaQuery.of(context).size.width / 1.4,
            height: 250,
            child: const MyCustomForm(),
          ),
          // TextField(
          //   obscureText: true,
          //   decoration: InputDecoration(
          //     border: OutlineInputBorder(),
          //     labelText: 'Password',
          //   ),
          // )
        ],
      ),
    )));
  }
}

class MyCustomForm extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyCustomForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Password',
              filled: true,
              fillColor: Color.fromRGBO(255, 229, 229, 1),
            ),
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        TextButtonExample(),
      ],
    );
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
                          builder: (context) => const Register(
                                title: '',
                              )),
                    );
                  },
                  child: const Text('Register'),
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
                            builder: (context) => const Homepage()),
                      );
                    },
                    child: const Text("Login", style: TextStyle(fontSize: 15)),
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
