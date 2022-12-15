part of '../movie_detail_page.dart';

class MovieDetailBody extends StatelessWidget {
  final MovieDetailModel movieDetail;

  const MovieDetailBody({
    Key? key,
    required this.movieDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(16, 32, 16, 24),
              padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieDetail.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 32),
                  _MovieInfo(
                    text: movieDetail.releaseYear,
                    icon: Icons.calendar_month,
                  ),
                  const SizedBox(height: 18),
                  _MovieInfo(
                    text: movieDetail.homePage,
                    icon: Icons.location_city,
                  ),
                  const SizedBox(height: 18),
                  _MovieInfo(
                    text: movieDetail.productionCompanies,
                    icon: Icons.language,
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'TAGLINE',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movieDetail.tagline.isNotEmpty ? movieDetail.tagline : '-',
                  ),
                ],
              ),
            ),
            Positioned(
              right: 24,
              child: FloatingActionButton(
                backgroundColor: Colors.teal[600],
                onPressed: () => Get.toNamed(
                  MovieMediaPage.routeName,
                  arguments: movieDetail.id,
                ),
                child: const Icon(Icons.image),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MovieInfo extends StatelessWidget {
  const _MovieInfo({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text.isNotEmpty ? text : '-',
            style: const TextStyle(height: 1.5),
          ),
        ),
      ],
    );
  }
}
