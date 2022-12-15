part of '../movie_media_page.dart';

class MovieImagesGrid extends StatelessWidget {
  final List<String> paths;
  final String size;
  final double aspectRatio;

  const MovieImagesGrid({
    Key? key,
    required this.paths,
    required this.size,
    required this.aspectRatio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: aspectRatio,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: paths.length,
      itemBuilder: (_, index) => MovieImageItem(
        size: size,
        path: paths[index],
      ),
    );
  }
}
