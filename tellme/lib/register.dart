import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tellme/loginpage.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formkey = GlobalKey<FormState>();
  // Profile profile = Profile(
  //     username: '',
  //     firstname: '',
  //     lastname: '',
  //     gender: '',
  //     email: '',
  //     password: '');
  // final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // future: firebase,
        builder: (context, snapshot) {
      return Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: const Text("Register Page"),
        //   backgroundColor: Color.fromARGB(255, 255, 110, 110),
        // ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Username", style: TextStyle(fontSize: 20)),
                    TextFormField(
                      validator: RequiredValidator(
                          errorText: "Please fill something!!!"),
                      onSaved: (username) {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Firstname", style: TextStyle(fontSize: 20)),
                    TextFormField(
                      validator: RequiredValidator(
                          errorText: "Please fill something!!!"),
                      onSaved: (firstname) {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Lastname", style: TextStyle(fontSize: 20)),
                    TextFormField(
                      validator: RequiredValidator(
                          errorText: "Please fill something!!!"),
                      onSaved: (lastname) {
                        // profile.lastname = lastname!;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Gender", style: TextStyle(fontSize: 20)),
                    TextFormField(
                      validator: RequiredValidator(
                          errorText: "Please fill something!!!"),
                      onSaved: (gender) {
                        // profile.gender = gender!;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Email", style: TextStyle(fontSize: 20)),
                    TextFormField(
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Please fill email"),
                        EmailValidator(errorText: "Wrong email formation")
                      ]),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (email) {
                        // profile.email = email!;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Password", style: TextStyle(fontSize: 20)),
                    TextFormField(
                      validator: RequiredValidator(
                          errorText: "Please fill something!!!"),
                      obscureText: true,
                      onSaved: (password) {
                        // profile.password = password!;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 255, 110, 110)),
                        ),
                        child: const Text("Submit"),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();
                            // print("username = ${profile.username} "
                            //     "firstname = ${profile.firstname} "
                            //     "lastname = ${profile.lastname} "
                            //     "gender = ${profile.gender} "
                            //     "email = ${profile.email} "
                            //     "password = ${profile.password}");
                            formkey.currentState!.reset();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const Loginpage();
                            }));
                          }
                        },
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      );
    });
  }
}
