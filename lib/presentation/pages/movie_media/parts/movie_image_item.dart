part of '../movie_media_page.dart';

class MovieImageItem extends StatelessWidget {
  const MovieImageItem({
    Key? key,
    required this.size,
    required this.path,
  }) : super(key: key);

  final String size;
  final String path;

  @override
  Widget build(BuildContext context) {
    final imageUrl = '${TMDBConfig.imageUrl}$size$path';

    return InkWell(
      onTap: () => Get.to(
        () => MovieImageHero(
          imageUrl: imageUrl,
        ),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fill,
        placeholder: (_, __) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (_, __, ___) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
