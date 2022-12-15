import 'package:get/get.dart';

import '../../../domain/domain.dart';

class HomeController extends GetxController {
  final IMovieRepository movieRepository;

  HomeController(this.movieRepository);

  @override
  void onInit() {
    super.onInit();
    debounce(
      _query,
      (_) => searchMovies(),
      time: const Duration(seconds: 1),
    );
  }

  final _searchedMovies = <MovieModel>[].obs;
  final _query = ''.obs;

  final _isLoading = false.obs;
  final _failure = Rxn<Failure>();
  final _isLoadingMore = false.obs;

  int _page = 1;
  int _totalPages = 0;

  List<MovieModel> get searchedMovies => _searchedMovies.toList();
  String get failureMessage => _failure.value!.message;
  bool get isLoading => _isLoading.value;
  bool get isFailure => _failure.value != null;
  bool get isLoadingMore => _isLoadingMore.value;
  bool get searchQueryIsEmpty => _query.trim().isEmpty;
  bool get isAtEnd => _totalPages <= _page;

  void onQueryChange(String query) {
    _query(query);
  }

  void resetQuery() {
    _query('');
  }

  Future<void> searchMovies() async {
    if (searchQueryIsEmpty) return;

    _page = 1;

    _isLoading(true);
    final result = await movieRepository.searchMovies(
      _query.value,
      _page,
    );
    result.fold(
      (error) => _failure(error),
      (fetchedData) {
        _totalPages = fetchedData.totalPages;
        _searchedMovies(fetchedData.movies);
      },
    );
    _isLoading(false);
  }

  Future<void> loadMore() async {
    if (searchQueryIsEmpty) return;
    _isLoadingMore(true);
    final result = await movieRepository.searchMovies(
      _query.value,
      _page + 1,
    );
    result.fold(
      (_) {},
      (fetchedData) {
        _page++;
        _searchedMovies.addAll(fetchedData.movies);
        _searchedMovies.refresh();
      },
    );
    _isLoadingMore(false);
  }
}
