// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/models/movies.dart';

class MoviesApi {
  static Future<List<Movies>> getRecipe() async {
    var uri = Uri.https('netflix54.p.rapidapi.com', '/search/', {
      'query': 'stranger',
      'offset': '0',
      'limit_titles': '50',
      'limit_suggestions': '20',
      'lang': 'en'
    });

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'd256adf5e0msh473de7d894198e2p15234djsned39a6fa9068',
      'X-RapidAPI-Host': 'netflix54.p.rapidapi.com'
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['titles']) {
      _temp.add(i['jawSummary']);
    }

    return Movies.recipesFromSnapshot(_temp);
  }
}
