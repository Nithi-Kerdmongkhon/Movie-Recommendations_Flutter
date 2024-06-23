// ignore_for_file: unused_field, avoid_print, unused_local_variable, prefer_final_fields, unnecessary_this

import 'dart:developer' as dev;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/models/movies.api.dart';
import 'package:project/models/movies.dart';
import 'package:project/views/movies_card.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  User? user;
  late List<Movies> _recipes;
  bool _isLoading = true;

  void getCurrentUser() {
    user = FirebaseAuth.instance.currentUser;
    if (user == null) {
    } else {
      dev.log(user!.email.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await MoviesApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      "https://etstatic.tnn.in/photo/msid-103436136,width-100,height-200,resizemode-75/103436136.jpg",
      "https://images.thedirect.com/media/article_full/mcu-marvel-biggest-critcisms-after-avengers-endgame.jpg",
      "https://i.ytimg.com/vi/cQfo0HJhCnE/maxresdefault.jpg",
      "https://i.ytimg.com/vi/EWzLEZwrnnI/maxresdefault.jpg",
      "https://jediyuth.files.wordpress.com/2021/10/midnight-banner.jpg?w=1280",
      "https://i.ytimg.com/vi/QC8x2Hgd73s/maxresdefault.jpg",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/popcorn.png',
              width: 40,
              height: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'MOVIES',
              style: TextStyle(fontFamily: 'Instpiration'),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              // แสดงข้อมูลเป็น list
              itemCount: _recipes.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      //Imgae Slider
                      CarouselSlider(
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          autoPlay: true,
                        ),
                        items: imageList.map((e) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              e,
                              width: 450,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                          );
                        }).toList(),
                      ),
                      //Movies Card
                      MoviesCard(
                        title: _recipes[index].title,
                        thumbnailUrl: _recipes[index].url,
                        synopsis: _recipes[index].synopsis,
                        creators: _recipes[index].creators,
                      ),
                    ],
                  );
                } else {
                  return MoviesCard(
                    title: _recipes[index].title,
                    thumbnailUrl: _recipes[index].url,
                    synopsis: _recipes[index].synopsis,
                    creators: _recipes[index].creators,
                  );
                }
              },
            ),
    );
  }
}
