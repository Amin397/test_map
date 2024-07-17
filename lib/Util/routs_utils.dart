import 'package:get/get.dart';
import 'package:test_mapp/View/Home/home_screen.dart';
import 'package:test_mapp/View/Splash/splash_screen.dart';


class NameRouts{
  static const String splash = '/splash';
  static const String home = '/home';
}

class PageRout {
  static List<GetPage> pages = [
    GetPage(
        name: NameRouts.splash,
        page: () => SplashScreen(),
        transition: Transition.topLevel,
        transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
        name: NameRouts.home,
        page: () => HomeScreen(),
        transition: Transition.topLevel,
        transitionDuration: const Duration(milliseconds: 500)
    ),
  ];
}