import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:project/screens/home_screen.dart';
import 'dart:developer' as dev;
import '../components/input_with_error_text.dart';
import '../components/my_text_input_with_error_text.dart';
import '../components/mybutton.dart';

class SignInScreen extends StatefulWidget {
  static const id = 'sing_in_screen';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  get child => null;
  // ignore: prefer_final_fields
  InputWithErrorText _email = InputWithErrorText();
  // ignore: prefer_final_fields
  InputWithErrorText _password = InputWithErrorText();
  // late String email;
  // late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Image(
              image: AssetImage('assets/images/login.png'),
              width: 40,
              height: 40,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'SIGN IN',
              style: TextStyle(fontFamily: 'Instpiration'),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ProgressHUD(
        child: Builder(
            builder: (context) => Column(
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
                            'Sign In',
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
                    MyTextInputWithErrorText(
                        input: _email,
                        hintText: "Enter Email",
                        keyboardType: TextInputType.emailAddress,
                        icon: const Icon(Icons.email)),
                    MyTextInputWithErrorText(
                      input: _password,
                      hintText: "Enter Password",
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      icon: const Icon(Icons.password),
                    ),
                    Mybutton(
                      label: 'Next',
                      onPressed: () async {
                        final progress = ProgressHUD.of(context);
                        progress?.showWithText("Loading...");
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _email.valueText,
                                  password: _password.valueText);
                          if (!mounted) return;
                          Navigator.pushNamed(context, HomeScreen.id);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            _email.errorText = ("error not found");
                          } else if (e.code == 'wrong-password') {
                            _password.errorText =
                                "wrong password ${_password.valueText}";
                          }

                          dev.log(e.toString());
                        }
                        setState(() {});
                        progress?.dismiss();
                      },
                    )
                  ],
                )),
      ),
    );
  }
}
