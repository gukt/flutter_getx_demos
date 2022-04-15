import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MaterialApp(home:Home()));
}

class Home extends GetView<CounterController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CounterController>(
        // GetBuilder 是继承自 StatefulWidget 的, 可以在 GetBuilder 中调用 StatefulWidget 的所有方法, 比如我们最常见的 : initState, dispose
        // 比这更好的方式是将 init 和 dispose 的逻辑写在 controller 的 onInit, onClose 方法里, 这样方便做到界面和逻辑的分离
        initState: (state) {
          debugPrint('GetBuilder: initState');
        },
        dispose: (state) {
          debugPrint('GetBuilder: dispose');
        },
        builder: (controller) {
          return Column(
            children: [
              Text('${controller.count}'),
              ElevatedButton(
                onPressed: () {
                  controller.count++;
                  controller.update();
                },
                child: const Text('Add'),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CounterController extends GetxController {
  var count = 0.obs;
  var b = 0.obs;
  var c = 0.obs;

  @override
  void onInit() {
    super.onInit();

    ever(count, (_) {
      debugPrint("[ever worker] count = $_");
    });

    interval(count, (_) {
      debugPrint("[interval worker] count = $_");
    });

    debounce(count, (_) {
      debugPrint("[debounce worker] count = $_");
    });

    everAll([count, b], (_) {
      debugPrint("[a, b] has been changed: $_");
    });

    // 在满足 condition 的情况下只执行一次，并在此之后取消对 listener 流的订阅。
    // condition 定义了何时调用 callback，可以是 bool 或 bool 函数。
    once(c, (_) {
      debugPrint("c has been changed: $_");
    });

    // // 监听 count 变量， 当 count 每次变化时都调用
    // ever(count, (_) => debugPrint("$_ has been changed"));
    // // 定义一个 worker 变量，用于在 callback 内部调用 dispose，以释放这个 worker
    // Worker? worker;
    // worker = debounce(count, (_) {
    //   debugPrint("$_ has been changed");
    //   worker?.dispose();
    // });
    // debugPrint('CounterController: onInit');

    // everAll([count, count], (_) {});
  }
}
