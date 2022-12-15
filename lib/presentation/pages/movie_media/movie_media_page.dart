import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import 'movie_media_controller.dart';

part 'parts/movie_images_grid.dart';
part 'parts/movie_image_item.dart';
part 'parts/movie_image_hero.dart';

class MovieMediaPage extends GetView<MovieMediaController> {
  static const routeName = '/movie-media';

  const MovieMediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Gallery'),
        ),
        body: controller.obx(
          (state) => Column(
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                child: const TabBar(
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(text: 'BACKDROPS'),
                    Tab(text: 'POSTERS'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    MovieImagesGrid(
                      paths: state!.backdropPaths,
                      size: TMDBConfig.backdropSize,
                      aspectRatio: 5 / 3,
                    ),
                    MovieImagesGrid(
                      paths: state.posterPaths,
                      size: TMDBConfig.posterSize,
                      aspectRatio: 3 / 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
