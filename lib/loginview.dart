// ignore_for_file: camel_case_types, unused_local_variable

import 'package:class15/homeview.dart';
import 'package:class15/signnup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login_View extends StatefulWidget {
  const Login_View({super.key});

  @override
  State<Login_View> createState() => _Login_ViewState();
}

class _Login_ViewState extends State<Login_View> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  loginUser() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeView(),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: "Error: $e",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.black,
            textColor: Colors.white);
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: "Error: $e",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.black,
            textColor: Colors.white);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/login.png"), fit: BoxFit.fill)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(children: [
              Container(
                padding: const EdgeInsets.only(top: 159, left: 45),
                child: const Text(
                  "Login  \n    Here",
                  style: TextStyle(color: Colors.white, fontSize: 46),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      left: 45,
                      right: 45,
                      top: MediaQuery.of(context).size.height * 0.45),
                  child: Column(children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Email",
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Password",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 50,
                      width: 180,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          loginUser();
                        },
                        icon: const Icon(
                          Icons.login,
                          size: 35,
                        ),
                        label: const Text("Sign In"),
                      ),
                    ),
                    const SizedBox(
                      height: 190,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const sign_up())));
                        },
                        child:
                            const Text("Don't have an account , Sign Up Here"))
                  ]),
                ),
              )
            ])));
  }
}
