import 'package:get/get.dart';

import '../../presentation/pages/pages.dart';

class AppRouter {
  const AppRouter._();

  static final routes = [
    GetPage(
      name: HomePage.routeName,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: MovieDetailPage.routeName,
      page: () => const MovieDetailPage(),
      binding: MovieDetailBinding(),
    ),
    GetPage(
      name: MovieMediaPage.routeName,
      page: () => const MovieMediaPage(),
      binding: MovieMediaBinding(),
    ),
  ];
}
