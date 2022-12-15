import 'package:getx_movie_app/domain/domain.dart';

class MovieSearchResult {
  final List<MovieModel> movies;
  final int totalPages;

  MovieSearchResult({
    required this.movies,
    required this.totalPages,
  });

  factory MovieSearchResult.fromJson(Map<String, dynamic> json) {
    return MovieSearchResult(
      movies: (json['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList(),
      totalPages: json['total_pages'],
    );
  }
}
