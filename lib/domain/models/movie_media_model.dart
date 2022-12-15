class MovieMediaModel {
  final int id;
  final List<String> backdropPaths;
  final List<String> posterPaths;

  const MovieMediaModel({
    required this.id,
    required this.backdropPaths,
    required this.posterPaths,
  });

  factory MovieMediaModel.fromJson(Map<String, dynamic> json) {
    return MovieMediaModel(
      id: json['id'],
      backdropPaths: (json['backdrops'] as List)
          .map((backdrop) => backdrop['file_path'] as String)
          .toList(),
      posterPaths: (json['posters'] as List)
          .map((poster) => poster['file_path'] as String)
          .toList(),
    );
  }
}
