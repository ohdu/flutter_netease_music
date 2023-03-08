import 'package:flutter_netease_music/page/discover/discover_page.dart';
import 'package:flutter_netease_music/page/music/music_page.dart';
import 'package:get/get.dart';

import '../main.dart';

class AppRouter {
  static const String mainPage = "/main_page";
  static const String discoverPage = "/discover_page";
  static const String musicPage = "/music_page";

  static List<GetPage> routers = [
    GetPage(name: mainPage, page: () => MainPage()),
    GetPage(name: discoverPage, page: () => const DiscoverPage()),
    GetPage(name: musicPage, page: () => const MusicPage())
  ];
}
