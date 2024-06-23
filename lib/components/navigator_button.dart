// ignore_for_file: file_names, use_build_context_synchronously

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final String label;
  final String routeName;
  final AudioPlayer audioPlayer = AudioPlayer();
  NavigationButton({super.key, required this.label, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: TextButton(
            onPressed: () async {
              // Play the audio
              await audioPlayer.play(AssetSource("sounds/click.mp3"));

              // Navigate to the specified route
              Navigator.pushNamed(context, routeName);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(237, 207, 21, 64))),
            child: Text(
              label,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Instpiration'),
            )),
      ),
    );
  }
}
