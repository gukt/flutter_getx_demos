import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Splash page'),
            ElevatedButton(
              onPressed: () {
                // 清空栈，并回到 /
                Get.offAllNamed('/');
              },
              child: const Text('Home'),
            )
          ],
        ),
      ),
    );
  }
}
