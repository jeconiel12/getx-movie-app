import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';
import '../movie_media/movie_media.dart';
import 'movie_detail_controller.dart';

part 'parts/movie_detail_poster.dart';
part 'parts/movie_detail_body.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  static const routeName = '/movie-detail';

  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: controller.obx(
        (state) => Stack(
          children: [
            MovieDetailPoster(posterPath: state!.posterPath),
            MovieDetailBody(movieDetail: state),
          ],
        ),
      ),
    );
  }
}
