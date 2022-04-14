import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 计数器示例 - v3
/// * 演示了同时使用响应式状态管理器 GetX 和 Obx 对状态进行管理的区别
/// * 定义一个静态便利 getter，方便获取 CounterController 实例
void main() => runApp(GetMaterialApp(home: Home()));

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final controller = Get.put(CounterController());

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text('counter-v3')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<CounterController>(
              // GetX 的 builder 函数会自动帮我们从依赖管理器中获取合适的 Controller 实例作为参数传入
              // NOTE：这里也可以使用外部第一次注入的变量 controller
              builder: (ctrl) => Text('${ctrl.count}'),
            ),
            // Obx 在 builder 函数内部需要自己获取 controller
            Obx(() => Text('${controller.count}')),
            ElevatedButton(
              onPressed: () => Get.to(() => const Second()),
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
  const Second({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      body: Center(child: Text("${CounterController.to.count}")),
    );
  }
}

class CounterController extends GetxController {
  var count = 0.obs;

  void increment() => count++;

  // 定义一个静态便利 getter，方便获取 CounterController 实例
  static CounterController get to => Get.find();
}
