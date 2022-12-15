import 'package:get/get.dart';

import '../../../domain/domain.dart';

class MovieMediaController extends GetxController
    with StateMixin<MovieMediaModel> {
  final IMovieRepository movieRepository;

  MovieMediaController(this.movieRepository);

  @override
  void onInit() {
    super.onInit();
    getMovieImages(id: Get.arguments);
  }

  Future<void> getMovieImages({required int id}) async {
    change(null, status: RxStatus.loading());
    final result = await movieRepository.getMovieImages(id);
    result.fold(
      (error) => change(null, status: RxStatus.error(error.message)),
      (fetchedData) => change(fetchedData, status: RxStatus.success()),
    );
  }
}
