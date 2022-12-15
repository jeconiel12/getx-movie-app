part of '../movie_media_page.dart';

class MovieImageHero extends StatelessWidget {
  final String imageUrl;

  const MovieImageHero({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          width: Get.width,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
