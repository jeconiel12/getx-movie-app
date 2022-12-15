part of '../home_page.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;

  const MovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        '${TMDBConfig.imageUrl}${TMDBConfig.posterSize}${movie.posterPath}';

    return GestureDetector(
      onTap: () => Get.toNamed(
        MovieDetailPage.routeName,
        arguments: movie.id,
      ),
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.contain,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  movie.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  movie.releaseYear.isNotEmpty ? movie.releaseYear : '-',
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
