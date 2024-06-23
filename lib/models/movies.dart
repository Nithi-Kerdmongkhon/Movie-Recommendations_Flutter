class Movies {
  final String title;
  final String url;
  final String synopsis;
  final String creators;

  Movies(
      {required this.title,
      required this.url,
      required this.synopsis,
      required this.creators});

  factory Movies.fromJson(dynamic json) {
    return Movies(
        title: json['title'] as String,
        url: json['backgroundImage']['url'] as String,
        synopsis: json['contextualSynopsis']['text'] as String,
        creators: json['creators'].isEmpty
            ? ""
            : json['creators'][0]['name'] as String);
  }

  static List<Movies> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Movies.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe { title: $title, url: $url},synopsis:$synopsis,creators:$creators';
  }
}
