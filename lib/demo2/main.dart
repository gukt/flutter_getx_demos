import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 计算器示例 -v2
/// * 演示了使用简单状态管理器（GetBuilder）进行手动状态更新。
/// * 演示了如何使用 Get.put，Get.find 进行依赖注入和依赖查找。
/// * 将代码逻辑移到 Controller 中，让界面和逻辑的解耦。
/// * 使用了 GetX 的路由跳转功能。
void main() {
  // 注意：本例需要使用路由跳转功能，所以这里需要将 MaterialApp 改为 GetMaterialApp
  runApp(const GetMaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    // 使用 Get.put() 注入你的实例，使其对所有子路由可用。
    // NOTE: 实例化 controller 不应该放在 build 外面
    final controller = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(title: const Text('counter-v2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CounterController>(
              builder: (ctrl) => Text('${ctrl.count}'),
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => Second()),
              child: const Text('Go to second page'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => controller.increment(),
      ),
    );
  }
}

class Second extends StatelessWidget {
  Second({Key? key}) : super(key: key);

  final CounterController ctrl = Get.find();

  @override
  Widget build(context) {
    return Scaffold(body: Center(child: Text("${ctrl.count}")));
  }
}

class CounterController extends GetxController {
  // 定义一个计数变量，
  // 注意：这里没有加 .obs 意味着它不是响应式的
  var count = 0;

  void increment() {
    count++;
    // 这里需要显式手动调用 update() 以重建 GetBuilder
    update();
  }
}
