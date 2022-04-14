import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// ValueBuilder 和 ObxValue 使用示例
/// * 提供了一个传统方式使用 Switch 的代码（下面注释处）
/// * 分别使用 ValueBuilder 和 ObxValue 实现 Switch 的切换
void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 使用 ValueBuilder 更新 Switch
            // ValueBuilder 类似于 Obx, 不同的是：它不用像 Obx 那样需要事先定义一个响应式变量，它可以直接传一个值，这个值就成了响应式的。
            ValueBuilder<bool?>(
              initialValue: false,
              builder: (value, updateFn) => Switch(
                value: value!,
                onChanged: updateFn,
              ),
            ),
            // 使用 ObxValue 更新 Switch
            // ObxValue 也不用事先定义响应变量，而是直接传一个 RX 值，本例传入的是 false.obs
            ObxValue<RxBool>((data) {
              return Switch(
                value: data.value,
                onChanged: (_) => data.toggle(),
              );
            }, false.obs)
          ],
        ),
      ),
    );
  }
}

// 以下是传统方式实现 Switch 状态变更的完整代码

// // 因为要调用 setState 进行状态变更，所以必须是 StatefulWidget
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   var _checked = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Switch(
//           value: _checked,
//           onChanged: (bool value) {
//             debugPrint('switched: $value');
//             // 调用 setState 进行状态变更
//             setState(() => _checked = value);
//           },
//         ),
//       ),
//     );
//   }
// }
