import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

// 让 Home 继承自 GetView 抽象类，可以让我们少写一行获取 controller 的代码，仅此而已
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('counter-v4')),
      body: Center(
        child: Obx(() => Text('${controller.count}')),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: controller.increment,
      ),
    );
  }
}
