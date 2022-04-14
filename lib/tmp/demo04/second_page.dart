import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // 通过 arguments，可传入参数给新页面，数据可以为任意类型（dynamic）
                Get.toNamed('/third', arguments: {'id': 1});
              },
              child:
                  const Text('Go to third page. 通过 arguments 属性传入参数: {id:1}'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/third?q=foo');
              },
              child:
                  const Text('Go to third page. 通过类似 url 中的 query string 方式传值'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Back'),
            )
          ],
        ),
      ),
    );
  }
}
