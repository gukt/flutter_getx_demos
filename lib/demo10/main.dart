import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Worker 示例
void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends GetView<CounterController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CounterController());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('${controller.count}')),
            ElevatedButton(
              onPressed: () {
                controller.count++;
              },
              child: const Text('count++'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.b++;
              },
              child: const Text('b++'),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterController extends GetxController {
  var count = 0.obs;
  var b = 100.obs;
  late Worker worker;

  @override
  void onInit() {
    super.onInit();

    // ever 示例 1： 每次都执行 callback
    // ever(count, (_) {
    //   debugPrint("[ever worker] count = $_");
    // });

    // ever 示例 2： 只有在 count > 5 时才执行 callback
    // ever(
    //   count,
    //   (_) => debugPrint("[ever worker] count = $_"),
    //   // 只有在 count > 5 时才执行 callback,
    //   // 注意：这里要指定返回 bool 值的函数
    //   condition: () => count > 5,
    // );

    // ever 示例 3： 只有在 count > 5 时才执行 callback，且 count 为 10 时销毁 worker
    // worker = ever(
    //   count,
    //   (_) {
    //     debugPrint("[ever worker] count = $_");
    //     if (count.value == 10) {
    //       worker.dispose();
    //     }
    //   },
    //   condition: () => count > 5,
    // );

    // 和 ever 唯一不同的是，它仅在变量值发生变更时执行一次
    once(count, (_) => {debugPrint('[ever worker] =$_')});

    // 监听多个变量的变更，只要任意一个发生了变更，就调用 callback
    // 它也可以指定 condition
    everAll([count, b], (_) {
      return {debugPrint('[ever worker] value=$_')};
    });

    interval(count, (_) {
      debugPrint("[interval worker] count = $_");
    });

    debounce(count, (_) {
      debugPrint("[debounce worker] count = $_");
    });
  }
}
