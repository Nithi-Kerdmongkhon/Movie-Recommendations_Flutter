import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/home_screen.dart';
import 'dart:developer' as dev;
import '../components/my_text_input.dart';
import '../components/mybutton.dart';

class RegistryScreen extends StatefulWidget {
  static const id = 'registry_screen';
  const RegistryScreen({super.key});

  @override
  State<RegistryScreen> createState() => _RegistryScreenState();
}

class _RegistryScreenState extends State<RegistryScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Image(
              image: AssetImage('assets/images/register.png'),
              width: 40,
              height: 40,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'REGISTER',
              style: TextStyle(fontFamily: 'Instpiration'),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Row(children: [
                SizedBox(
                  height: 100.0,
                  width: 120.0,
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset('assets/images/logo2.png'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Text(
                    'Create a new account',
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Instpiration'),
                  ),
                )
              ]),
            ),
            const SizedBox(height: 25),
            //Username
            MyTextInput(
              hintText: " Enter Username",
              keyboardType: TextInputType.text,
              onChanged: (value) {
                username = value;
              },
            ),
            MyTextInput(
              hintText: " Enter email",
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
            ),
            //Password
            MyTextInput(
              hintText: " Enter password",
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) {
                password = value;
              },
            ),
            //Next Button
            Mybutton(
              label: "Next",
              onPressed: () async {
                try {
                  UserCredential userCredential =
                      await _auth.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  if (userCredential.user != null) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, HomeScreen.id);
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == "weak-password") {
                    dev.log("The password provided is too weak.");
                  } else if (e.code == "email-already-in-use") {
                    dev.log("The account already exists for that email");
                  } else {
                    dev.log(e.toString());
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
