import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThridPage extends StatelessWidget {
  const ThridPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('''
接收到传入的数据: arguments: ${Get.arguments}, parameters: ${Get.parameters}
Note: Get 可以传入数据给别名路由，方式有两种：
1. 通过 toNamed 方法的 arguments 传入。
2. 通过名称后面接 URL 查询字符串方式传入。
'''),
            ElevatedButton(
              onPressed: () {
                // off 或 offNamed 作用是替换栈顶页面，而 to 或 toNamed 是向栈里 push 一个新页面
                Get.offNamed('/login');

                // Get.until((route) => !(Get.isDialogOpen ?? false));
              },
              child: const Text('Go to login page.'),
            ),
            ElevatedButton(
              onPressed: () {
                // 先清空栈中所有的页面，并压入 splash 页面，因此，在进入的 Splash 页面中不会显示后退按钮。
                Get.offAllNamed('/splash');
              },
              child: const Text('Go to splash page.'),
            ),
          ],
        ),
      ),
    );
  }
}
