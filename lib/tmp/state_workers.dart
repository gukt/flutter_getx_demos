import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateWorkersPage extends StatelessWidget {
  StateWorkersPage({Key? key}) : super(key: key);
  final controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Workers")),
      body: GetBuilder<CounterController>(
        // GetBuilder 是继承自 StatefulWidget 的, 可以在 GetBuilder 中调用 StatefulWidget 的所有方法, 比如我们最常见的 : initState, dispose
        // 比这更好的方式是将 init 和 dispose 的逻辑写在 controller 的 onInit, onClose 方法里, 这样方便做到界面和逻辑的分离
        initState: (state) {
          debugPrint('GetBuilder: initState');
        },
        dispose: (state) {
          debugPrint('GetBuilder: dispose');
        },
        // 这个 builder 属性是 GetBuilder 自定义的
        //
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
  var count = 1.obs;

  @override
  void onInit() {
    // 每次变化时都调用
    ever(count, (_) => debugPrint("$_ has been changed"));
    Worker? worker;
    worker = debounce(count, (_) {
      debugPrint("$_ has been changed");
      worker?.dispose();
    });

    debugPrint('CounterController: onInit');
  }

  @override
  void onClose() {
    debugPrint('CounterController: onClose');

    super.onClose();
  }
}
