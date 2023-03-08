import 'package:flutter/cupertino.dart';
import 'package:flutter_netease_music/constant/app_router.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  int index = 0;

  final pageViewController = PageController();

  void updateIndex(int index) {
    if (this.index == index) {
      return;
    }
    this.index = index;
    pageViewController.jumpToPage(index);
    update();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }
}
