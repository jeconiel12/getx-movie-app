import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/core.dart';
import '../../domain/domain.dart';

class MovieReposity implements IMovieRepository {
  static const _baseUrl = TMDBConfig.baseUrl;
  static const _apiKey = TMDBConfig.apiKey;

  final http.Client client;

  MovieReposity(this.client);

  @override
  Future<Either<Failure, MovieSearchResult>> searchMovies(
    String query,
    int page,
  ) async {
    try {
      final url = Uri.parse(
          '$_baseUrl/search/movie?api_key=$_apiKey&query=$query&page=$page');
      final response = await http.get(url);
      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        final searchResult = MovieSearchResult.fromJson(data);
        return right(searchResult);
      } else {
        return left(Failure(data['status_message']));
      }
    } on SocketException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, MovieDetailModel>> getMovieDetail(int id) async {
    try {
      final url = Uri.parse('$_baseUrl/movie/$id?api_key=$_apiKey');
      final response = await http.get(url);
      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        return right(MovieDetailModel.fromJson(data));
      } else {
        return left(Failure(data['status_message']));
      }
    } on SocketException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, MovieMediaModel>> getMovieImages(int id) async {
    try {
      final url = Uri.parse('$_baseUrl/movie/$id/images?api_key=$_apiKey');
      final response = await http.get(url);
      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        return right(MovieMediaModel.fromJson(data));
      } else {
        return left(Failure(data['status_message']));
      }
    } on SocketException catch (e) {
      return left(Failure(e.message));
    }
  }
}
