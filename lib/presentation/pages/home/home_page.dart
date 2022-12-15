import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_movie_app/domain/domain.dart';

import '../../../core/core.dart';
import '../pages.dart';

part 'parts/home_search_field.dart';
part 'parts/home_search_result.dart';
part 'parts/movie_card.dart';

class HomePage extends GetView<HomeController> {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: const Text('TMDb'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: HomeSearchField(
            onPressed: controller.resetQuery,
            onChanged: controller.onQueryChange,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.isFailure) {
          return Center(
            child: Text(
              'A error occurred: ${controller.failureMessage}',
            ),
          );
        } else {
          return HomeSearchResult(
            searchedMovies: controller.searchedMovies,
          );
        }
      }),
    );
  }
}
