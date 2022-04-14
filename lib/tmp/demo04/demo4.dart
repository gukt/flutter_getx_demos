import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'first_page.dart';
import 'thrid_page.dart';

class Demo4 extends StatelessWidget {
  const Demo4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // 不建议 Get.to(Page()) 这种写法，请使用 Get.to(() => Page()) 代替
              // WARNING, consider using: "Get.to(() => Page())" instead of "Get.to(Page())".
              // Get.to(const FirstPage());

              Get.to(() => const FirstPage());
            },
            child: const Text('Go to first page.'),
          ),
          ElevatedButton(
            onPressed: () {
              // 可以使用命名路由，命名路由要在 GetMaterialApp 的 getPages 属性中配置
              Get.toNamed('/second');
            },
            child: const Text('Go to second page.'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const ThridPage());
            },
            child: const Text('Go to third page.'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/not-exist-page');
            },
            child: const Text('Go to unknown page.'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/profile');
            },
            child: const Text('Go to profile page.'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/profile/1');
            },
            child: const Text('Go to profile/1 page.'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/profile/1?sign=foo');
            },
            child: const Text('Go to profile/1?sign=foo page.'),
          ),
        ],
      )),
    );
  }
}
