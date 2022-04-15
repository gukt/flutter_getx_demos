import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 计算属性示例
void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CounterController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              debugPrint('rebuilding: a');
              return Text('a=${controller.a}');
            }),
            Obx(() {
              debugPrint('rebuilding: b');
              return Text('b=${controller.b}');
            }),
            Obx(() {
              debugPrint('rebuilding: sum');
              return Text('sum=${controller.sum}');
            }),
            ElevatedButton(
              onPressed: () => controller.a.value++,
              child: const Text('a++'),
            ),
            ElevatedButton(
              onPressed: () => controller.b.value++,
              child: const Text('b++'),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterController extends GetxController {
  final a = 1.obs;
  final b = 2.obs;
  // 定义一个计算属性，返回两数之和
  int get sum => a.value + b.value;

  // 定义一个便利属性，用以查找依赖
  static CounterController get to => Get.find<CounterController>();
}
