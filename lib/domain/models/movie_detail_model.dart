class MovieDetailModel {
  final int id;
  final String title;
  final String releaseYear;
  final String posterPath;
  final String homePage;
  final String productionCompanies;
  final String tagline;

  const MovieDetailModel({
    required this.id,
    required this.title,
    required this.releaseYear,
    required this.posterPath,
    required this.homePage,
    required this.productionCompanies,
    required this.tagline,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      id: json['id'],
      title: json['title'],
      releaseYear:
          DateTime.tryParse(json['release_date'] ?? '')?.year.toString() ?? '',
      posterPath: json['poster_path'] ?? '',
      homePage: json['homepage'] ?? '',
      productionCompanies: (json['production_companies'] as List)
          .map((company) => company['name'])
          .toList()
          .join(', '),
      tagline: json['tagline'] ?? '',
    );
  }
}
