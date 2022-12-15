import 'package:dartz/dartz.dart';

import '../failure/failure.dart';
import '../models/models.dart';

abstract class IMovieRepository {
  Future<Either<Failure, MovieDetailModel>> getMovieDetail(int id);
  Future<Either<Failure, MovieMediaModel>> getMovieImages(int id);
  Future<Either<Failure, MovieSearchResult>> searchMovies(
    String query,
    int page,
  );
}
