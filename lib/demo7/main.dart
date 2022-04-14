import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 更改主题示例
///
/// **Note:**
/// 1. 要将 MaterialApp 换成 GetMaterialApp，别搞半天发现没有起作用
/// 2. 使用了 GetX 切换主题，就别和其他方式切换主题混用了，因为完全没必要
void main() => runApp(const GetMaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('更改主题示例')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 明暗模式互换
            Get.changeTheme(
              Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
            );
          },
          child: const Text('Change theme'),
        ),
      ),
    );
  }
}
