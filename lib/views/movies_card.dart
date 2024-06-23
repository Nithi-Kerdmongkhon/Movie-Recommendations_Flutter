// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class MoviesCard extends StatelessWidget {
  final String title;
  final String thumbnailUrl;
  final String synopsis;
  final String creators;
  const MoviesCard({
    super.key,
    required this.title,
    required this.thumbnailUrl,
    required this.synopsis,
    required this.creators,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      width: MediaQuery.of(context).size.width,
      height: 220,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: const Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4), BlendMode.dstATop),
          image: NetworkImage(thumbnailUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Instpiration',
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: const Alignment(0, -0.8),
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                synopsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Instpiration',
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: const Alignment(0, -0.2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    'Creators :',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Instpiration',
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    textAlign: TextAlign.center,
                  ),
                ),
                alignment: Alignment(0, 0.3),
              ),
              Align(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    creators,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Instpiration',
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    textAlign: TextAlign.center,
                  ),
                ),
                alignment: const Alignment(0, 0.3),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                child: TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        backgroundColor: const Color.fromARGB(255, 190, 0, 0),
                        textStyle: const TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Instpiration')),
                    icon: const Icon(Icons.play_arrow_rounded),
                    label: const Text(
                      'PLAY',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Instpiration',
                      ),
                    )),
                alignment: const Alignment(0, 0.9),
              ),
              const SizedBox(
                width: 10,
              ),
              Align(
                child: TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        backgroundColor: const Color.fromARGB(255, 84, 84, 84),
                        textStyle: const TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Instpiration')),
                    icon: const Icon(Icons.add),
                    label: const Text(
                      'MY LIST',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Instpiration'),
                    )),
                alignment: const Alignment(0, 0.9),
              )
            ],
          )
        ],
      ),
    );
  }
}
