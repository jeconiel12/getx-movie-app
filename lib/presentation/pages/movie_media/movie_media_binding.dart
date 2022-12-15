import 'package:get/get.dart';

import 'movie_media_controller.dart';

class MovieMediaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieMediaController(Get.find()));
  }
}
