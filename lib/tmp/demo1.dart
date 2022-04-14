import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 这是一个计数器示例
// 传统的实现要用到 StatefulWidget, 但用了 GetX 后，你不再需要 StatefulWidget 了。
class Demo1 extends StatelessWidget {
  const Demo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 使用 Get.put() 注入你的实例，使其对当下的所有子路由可用。
    final CounterController ctrl = Get.put(CounterController());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 使用 Obx，每次当 count 更新时，自动更新 Text 文本
            // Obx 是 GetX 框架中最简单的反应式组件
            // 通过 Controller 在不同路由之间共享变量值，并实时同步
            Obx(() => Text('You clicked ${ctrl.count} times.')),

            ElevatedButton(
              // 按钮点击会让 Controller 中定义的 count 变量值发生变更
              onPressed: () {
                ctrl.increment();
              },
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () {
                // 跳转到一个新的页面（子路由）
                // 使用 Get.to 的好处是简单且不需要 context
                // 传统的路由跳转实现方式是使用 Navigator.push，需要 8 行，冗长且需要传入 context 对象
                Get.to(const OtherPage());
              },
              child: const Text('Go to other route(page)'),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterController extends GetxController {
  // 只要简单地加上 .obs， 就可以使一个变量变成可观察的
  var count = 0.obs;

  // 将计数器累加 1
  increment() => count++;
}

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 你可以让 Get 找到一个正在被其他页面使用的 Controller，并将它返回给你。
    CounterController ctrl = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text('OtherPage')),
      // 从 Controller 实例中读取之前被改变过的变量，这就实现了页面之间信息的传递
      body: Text('Count: ${ctrl.count}'),
    );
  }
}
