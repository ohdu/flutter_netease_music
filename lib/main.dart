import 'package:flutter/material.dart';
import 'package:flutter_netease_music/constant/util.dart';
import 'package:flutter_netease_music/main_controller.dart';
import 'package:flutter_netease_music/page/discover/discover_page.dart';
import 'package:flutter_netease_music/page/home/home_page.dart';
import 'package:flutter_netease_music/page/music/music_page.dart';
import 'package:get/get.dart';

import 'constant/app_router.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: AppRouter.mainPage,
    getPages: AppRouter.routers,
    title: 'Netease Music',
    theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
  ));
}

class MainPage extends StatelessWidget {
  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Util.isPhone() ? _phoneBottomBar() : _padBottomBar();
  }

  Widget _body() {
    return GetBuilder(
        init: MainController(),
        builder: (controller) => PageView(
              controller: controller.pageViewController,
              physics: const NeverScrollableScrollPhysics(), //禁止ViewPager的左右滑动
              children: const [HomePage(), DiscoverPage(), MusicPage()],
            ));
  }

  Widget _phoneBottomBar() {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Netease Music"),
        ),
        body: _body(),
        bottomNavigationBar: GetBuilder(
            init: MainController(),
            builder: (controller) => NavigationBar(
                    destinations: const [
                      NavigationDestination(
                          icon: Icon(Icons.queue_music), label: '首页'),
                      NavigationDestination(
                          icon: Icon(Icons.find_in_page), label: '发现'),
                      NavigationDestination(
                          icon: Icon(Icons.library_music), label: '音乐库')
                    ],
                    selectedIndex: controller.index,
                    labelBehavior:
                        NavigationDestinationLabelBehavior.onlyShowSelected,
                    onDestinationSelected: (index) =>
                        controller.updateIndex(index))));
  }

  Widget _padBottomBar() {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Netease Music"),
        ),
        body: Row(
          children: [
            GetBuilder(
                init: MainController(),
                builder: (controller) => NavigationRail(
                        destinations: const [
                          NavigationRailDestination(
                              icon: Icon(Icons.queue_music), label: Text('首页')),
                          NavigationRailDestination(
                              icon: Icon(Icons.find_in_page),
                              label: Text('发现')),
                          NavigationRailDestination(
                              icon: Icon(Icons.library_music),
                              label: Text('音乐库'))
                        ],
                        selectedIndex: controller.index,
                        labelType: NavigationRailLabelType.selected,
                        onDestinationSelected: (index) =>
                            controller.updateIndex(index))),
            Expanded(child: _body())
          ],
        ));
  }
}
