import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 计算器示例 -v1
/// * 演示了如何使用响应式状态管理器 Obx 进行状态管理
/// * 演示了利用 GetX 改写的计数器和传统方式对比的不同，它更简洁，且不需要 StatefulWidget
void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final count = 0.obs;

    return Scaffold(
      appBar: AppBar(title: const Text('counter-v1')),
      body: Center(
        child: Obx(() => Text('$count')),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => count.value++,
      ),
    );
  }
}
