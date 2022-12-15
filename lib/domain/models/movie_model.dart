class MovieModel {
  final int id;
  final String title;
  final String releaseYear;
  final String posterPath;

  const MovieModel({
    required this.id,
    required this.title,
    required this.releaseYear,
    required this.posterPath,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      releaseYear:
          DateTime.tryParse(json['release_date'] ?? '')?.year.toString() ?? '',
      posterPath: json['poster_path'] ?? '',
    );
  }
}
