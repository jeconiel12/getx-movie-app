part of '../movie_detail_page.dart';

class MovieDetailPoster extends StatelessWidget {
  final String posterPath;

  const MovieDetailPoster({
    Key? key,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          opacity: 0.5,
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            '${TMDBConfig.imageUrl}/original$posterPath',
          ),
        ),
      ),
    );
  }
}
