// ignore_for_file: camel_case_types
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:class15/homeview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'loginview.dart';

class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  TextEditingController emailController1 = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();

  registerUser() async {
    try {
      // final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController1.text,
        password: passwordController1.text,
      );
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Login_View(),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
            msg: "Error: $e",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.black,
            textColor: Colors.white);
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "Error: $e",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.black,
            textColor: Colors.white);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Error: $e",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.black,
          textColor: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/register.png"), fit: BoxFit.fill)),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(children: [
                Container(
                  padding: const EdgeInsets.only(top: 100, left: 45),
                  child: const Text(
                    "Create \nAccount",
                    style: TextStyle(color: Colors.white, fontSize: 46),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 45,
                        right: 45,
                        top: MediaQuery.of(context).size.height * 0.35),
                    child: Column(children: [
                      TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Name",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Phone Number",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: emailController1,
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
                        controller: passwordController1,
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
                      TextField(
                        // controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: " Confirm Password",
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 50,
                        width: 180,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            registerUser();
                          },
                          icon: const Icon(
                            Icons.login,
                            size: 35,
                          ),
                          label: const Text("Sign Up"),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login_View(),
                              ));
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.black), // Set the text color to black
                        ),
                        child: const Text("Have an account , Login Here"),
                      )
                    ]),
                  ),
                )
              ]))),
    );
  }
}
