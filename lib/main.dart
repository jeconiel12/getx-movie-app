import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/core.dart';
import 'presentation/pages/pages.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      initialBinding: InitBinding(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      getPages: AppRouter.routes,
    );
  }
}
