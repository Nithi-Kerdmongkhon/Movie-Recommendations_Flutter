import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/registry_screen.dart';
import 'package:project/screens/sign_in_screen.dart';

import '../components/navigator_button.dart';

class MainScreen extends StatefulWidget {
  static const id = 'main_screen';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  late Animation animationColor;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      //upperBound: 100,
      // lowerBound: 20,
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);
    animationColor = ColorTween(
            begin: const Color.fromARGB(255, 254, 3, 3), end: Colors.amber)
        .animate(animationController);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {}
    });
    //animationController.reverse(from: 1);
    animationController.forward();
    animationController.addListener(() {
      //dev.log(animationController.value.toStringAsFixed(3));
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.red,
      Colors.yellow,
      Colors.blue,
      Colors.green,
      Colors.purple,
    ];
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: SizedBox(
              height: animationController.value * 150,
              width: 150.0,
              child: Hero(
                tag: 'logo',
                child: Image.asset('assets/images/logo2.png'),
              ),
            ),
          ),
          Center(
            child: AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'NTKMK MOVIES',
                  textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: animationColor.value,
                      fontFamily: 'Instpiration'),
                  colors: colorizeColors,
                )
              ],
            ),
          ),
          const SizedBox(height: 25),
          NavigationButton(
            label: "Sign-in",
            routeName: SignInScreen.id,
          ),
          NavigationButton(
            label: "Create an account",
            routeName: RegistryScreen.id,
          )
        ],
      ),
    );
  }
}
