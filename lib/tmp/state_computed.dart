import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateComputedPage extends StatelessWidget {
  StateComputedPage({Key? key}) : super(key: key);

  final controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Computed'),
      ),
      body: Column(
        children: [
          Obx(() {
            debugPrint('rebuilding: a');
            return Text('${controller.a}');
          }),
          Obx(() {
            debugPrint('rebuilding: b');
            return Text('${controller.b}');
          }),
          Obx(() {
            debugPrint('rebuilding: sum');
            return Text('${controller.sum}');
          }),
          ElevatedButton(
            onPressed: () {
              Get.to(NextPage());
            },
            child: const Text('Next page'),
          ),
          // GetX<MyController>(
          //   builder: (controller) {
          //     debugPrint('rebuilding: a');
          //     return Text('${controller.a}');
          //   },
          // ),
          // GetX<MyController>(
          //   builder: (controller) {
          //     debugPrint('rebuilding: b');
          //     return Text('${controller.b}');
          //   },
          // ),
          // GetX<MyController>(
          //   builder: (controller) {
          //     debugPrint('rebuilding: sum');
          //     return Text('${controller.sum}');
          //   },
          // ),
          ElevatedButton(
            onPressed: () {
              controller.a.value++;
            },
            child: const Text('a++'),
          ),
          ElevatedButton(
            onPressed: () {
              controller.b.value++;
            },
            child: const Text('b++'),
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // 这里使用 MyController.to 来找到之前被注入的 MyController 实例,
          // 然后读取它里面的值
          Obx(() => Text('${MyController.to.sum}')),
          // 上面的调用方法等效于下面的写法
          Obx(() => Text('${Get.find<MyController>().sum}')),
          // 等效于下面使用 GetX 的写法
          // 但这种写法的好处是:
          // 不用手写对依赖(MyController)的查找(Get.find<MyController>)
          GetX<MyController>(
            builder: (controller) {
              return Text('${controller.sum}');
            },
          ),
          GetX<MyAnotherController>(
            builder: (controller) {
              return Text('${controller.sum}');
            },
          )
        ],
      ),
    );
  }
}

class MyAnotherController extends MyController {}

class MyController extends GetxController {
  final a = 1.obs;
  final b = 2.obs;
  // 定义一个计算属性 sum, 始终返回 a + b 的值
  int get sum => a.value + b.value;

  // 定义一个便利方法用以找到依赖
  static MyController get to => Get.find<MyController>();

  MyController() {
    a.firstRebuild = false;
    b.firstRebuild = false;
  }

  @override
  void onInit() {
    debugPrint('MyController: onInit');
    super.onInit();
  }

  @override
  void onReady() {
    debugPrint('MyController: onReady');
    super.onReady();
  }

  @override
  InternalFinalCallback<void> get onDelete {
    debugPrint('MyController: onDelete');
    return super.onDelete;
  }

  @override
  void onClose() {
    debugPrint('MyController: onClose');
    super.onClose();
  }
}
