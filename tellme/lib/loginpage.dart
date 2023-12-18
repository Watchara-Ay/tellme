import 'package:flutter/material.dart';
import 'homepage.dart';
import 'register.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<void> writeToStorage(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> readFromStorage(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> deleteFromStorage(String key) async {
    await _storage.delete(key: key);
  }

  // Example: Storing and reading username and password
  Future<void> storeCredentials(String username, String password) async {
    await writeToStorage('username', username);
    await writeToStorage('password', password);
  }

  Future<String?> getUsername() async {
    return await readFromStorage('username');
  }

  Future<String?> getPassword() async {
    return await readFromStorage('password');
  }

  Future<void> clearCredentials() async {
    await deleteFromStorage('username');
    await deleteFromStorage('password');
  }
}

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
            width: MediaQuery.of(context).size.width / 1.3,
            height: 300,
            child: const login(),
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

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  // ignore: use_key_in_widget_constructors
  final formKey = GlobalKey<FormState>();

  Future<void> loginUser() async {
    String url = 'http://127.0.0.1:8000/login.php';

    final response = await http.post(Uri.parse(url), body: {
      'username': username.text,
      'password': password.text,
    });

    print({
      'username': username.text,
      'password': password.text,
    });

    var data = json.decode(response.body);
    if (data == "Error") {
      Navigator.pushNamed(context, 'login');
    } else {
      Navigator.pushNamed(context, 'Homepage');
    }
  }

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  // Future sign_in() async {
  //   String url = "";
  //   final respone = await http.post(Uri.parse(url),
  //       body: {'username': username.text, 'password': password.text});
  //   var data = json.decode(response.body);
  //   print(data);
  //   if (data == "Error") {
  //     Navigator.pushNamed(context, 'loginpage');
  //   } else {
  //     Navigator.pushNamed(context, 'homepage');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(40)),
        width: MediaQuery.of(context).size.width / 1.4,
        height: 250,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: username,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Username',
                filled: true,
                fillColor: Color.fromRGBO(255, 229, 229, 1),
              ),
              style: const TextStyle(
                fontSize: 24,
              ),
              onSaved: (username) {
                print(username);
              },
            ),
            Container(
              height: 10,
            ),
            TextFormField(
                controller: password,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Password',
                  filled: true,
                  fillColor: const Color.fromRGBO(255, 229, 229, 1),
                ),
                obscureText: true,
                onSaved: (password) {
                  print(password);
                }),
            ButtonTheme(
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
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))),
                          onPressed: () {
                            if (loginUser() == "error") {
                              print("error");
                            } else {
                              loginUser;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Homepage()),
                              );
                            }
                          },
                          child: const Text("Login",
                              style: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
