part of '../home_page.dart';

class HomeSearchResult extends StatefulWidget {
  final List<MovieModel> searchedMovies;

  const HomeSearchResult({
    Key? key,
    required this.searchedMovies,
  }) : super(key: key);

  @override
  State<HomeSearchResult> createState() => _HomeSearchResultState();
}

class _HomeSearchResultState extends State<HomeSearchResult> {
  final HomeController controller = Get.find();

  late ScrollController _scrollController;

  void _loadMoreMovies() {
    /// Start loading next page when midway current page
    final scrollOffset = _scrollController.offset;
    final nextPageLoadOffset = _scrollController.position.maxScrollExtent / 2;

    if (scrollOffset >= nextPageLoadOffset) {
      // Only load more if movies end is not reached
      if (!controller.isAtEnd && !controller.isLoadingMore) {
        controller.loadMore();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_loadMoreMovies);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1 / 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemCount: widget.searchedMovies.length,
      itemBuilder: (_, index) => MovieCard(
        movie: widget.searchedMovies[index],
      ),
    );
  }
}
