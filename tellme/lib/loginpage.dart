import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'homepage.dart';
import 'register.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
            child: const Login(),
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

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  // ignore: use_key_in_widget_constructors
  final formKey = GlobalKey<FormState>();

  Future<Map<String, dynamic>> loginUser(
      String username, String password) async {
    final url = Uri.parse(
        'http://127.0.0.1:8000/login.php'); // Replace with your API endpoint

    final response = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // Successful login, return response body (might contain user data, token, etc.)
      return json.decode(response.body);
    } else {
      // Failed login, return an error message or handle as needed
      throw Exception('Failed to login');
    }
  }

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(40)),
        width: MediaQuery.of(context).size.width / 1.4,
        height: 300,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text("Username", //
                style: TextStyle(fontSize: 20)),
            TextFormField(
              validator:
                  RequiredValidator(errorText: "Please fill something!!!"),
              onSaved: (username) {},
              controller: username,
            ),
            const Text("Password", //
                style: TextStyle(fontSize: 20)),
            TextFormField(
              validator:
                  RequiredValidator(errorText: "Please fill something!!!"),
              onSaved: (value) {},
              controller: password,
              obscureText: true,
            ),
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
                              ),
                            ),
                          ),
                          onPressed: () async {
                            try {
                              final response = await loginUser(
                                  username.text.trim(), password.text.trim());
                              // Handle the response as needed, e.g., check for successful login
                              if (response["success"] == true) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Homepage(
                                        username: username.text,
                                        selectedFood: 1),
                                  ),
                                );

                                print("success");
                              } else {
                                print('Login failed');
                              }
                            } catch (e) {
                              // Handle exceptions or errors during login
                              print('Exception occurred: $e');
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
