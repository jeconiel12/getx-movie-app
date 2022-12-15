import 'package:get/get.dart';

import '../../../domain/domain.dart';

class MovieDetailController extends GetxController
    with StateMixin<MovieDetailModel> {
  final IMovieRepository movieRepository;

  MovieDetailController(this.movieRepository);

  @override
  void onInit() {
    super.onInit();
    getMovieDetail(id: Get.arguments);
  }

  Future<void> getMovieDetail({required int id}) async {
    change(null, status: RxStatus.loading());
    final result = await movieRepository.getMovieDetail(id);
    result.fold(
      (error) => change(null, status: RxStatus.error(error.message)),
      (fetchedData) => change(fetchedData, status: RxStatus.success()),
    );
  }
}
