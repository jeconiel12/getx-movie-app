import 'package:get/get.dart';
import 'package:getx_movie_app/domain/domain.dart';
import 'package:http/http.dart' as http;

import '../../infrastructure/infrastructure.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    // Core
    Get.lazyPut(() => http.Client());

    // Repository
    Get.lazyPut<IMovieRepository>(() => MovieReposity(Get.find()));
  }
}
