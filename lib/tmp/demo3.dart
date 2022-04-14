import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Person {
  var name = 'codedog996';
  var age = 18.obs;
}

class Demo3 extends StatelessWidget {
  const Demo3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyController());
    final Person p1 = Person();
    final Person p2 = Get.put(Person());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder(builder: (controller) {
              return const Text('');
            }),
            ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    "哈喽，我是一个 SnackBar，通过 Get 框架展现的", // title
                    "不可思议的是，我不需要 Context 对象，没有样本文件，没有 Scaffold，真棒 👍🏻", // message
                    icon: const Icon(Icons.alarm),
                    titleText: Text('fakjflafas'),
                    messageText: const Text('I am a message text'),
                    shouldIconPulse: true,
                    onTap: (snackbar) {
                      debugPrint('snackbar: $snackbar');
                    },
                    barBlur: 200,
                    isDismissible: false,
                    duration: const Duration(milliseconds: 800),
                  );
                },
                child: const Text('Snackbar')),

            Obx(() => Text('${p1.age}')),
            Obx(() => Text('${p2.age}')),
            Obx(() {
              Person person = Get.find();
              assert(p2 == person);

              return Text('${person.age}');
            }),

            ElevatedButton(
              onPressed: () {
                p1.age.value++;
              },
              child: const Text('Increment p1.age'),
            ),
            ElevatedButton(
              onPressed: () {
                p2.age.value++;
              },
              child: const Text('Increment p2.age'),
            ),

            const Text('使用 Obx 进行更新'),
            Obx(() {
              debugPrint('a rebuild');
              return Text('a = ${controller.a}');
            }),
            Obx(() {
              debugPrint('b rebuild');
              return Text('b = ${controller.b}');
            }),
            Obx(() {
              debugPrint('sum rebuild');
              // 支持对计算属性的更新
              return Text('sum = ${controller.sum}');
            }),
            Obx(() {
              debugPrint('product rebuild');
              // 如果调用的是方法，请加上括号
              return Text('product = ${controller.product()}');
            }),

            const Divider(),
            const Text('使用 GetBuilder 进行更新'),

            // 视图
            GetX<MyController>(
              builder: (controller) {
                debugPrint("a rebuild");
                return Text('a = ${controller.a.value}');
              },
            ),
            GetX<MyController>(
              builder: (controller) {
                debugPrint("b rebuild");
                return Text('b = ${controller.b.value}');
              },
            ),
            GetX<MyController>(
              builder: (controller) {
                debugPrint("sum rebuild");
                return Text('sum = ${controller.sum}');
              },
            ),
            GetX<MyController>(
              builder: (controller) {
                debugPrint("sum rebuild");
                return Text('product = ${controller.product()}');
              },
            ),

            ElevatedButton(
              onPressed: () {
                controller.a.value++;
              },
              child: const Text('Increment a'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.b.value++;
              },
              child: const Text('Increment b'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyController extends GetxController {
  final a = 0.obs;
  final b = 0.obs;

  // 定义一个计算属性 sum 表示两数之和，
  // 当 a 和 b 任意一个值发生变化时，引用该'计算属性'的组件也会同步刷新
  int get sum => a.value + b.value;

  // 定义一个方法 product 表示两个数的乘积
  // 当 a 和 b 任意一个值发生变化时，引用该'方法'的组件也会同步刷新
  int product() => a.value * b.value;
}
