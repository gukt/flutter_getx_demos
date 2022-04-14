import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/second');
              },
              child: const Text('Go to second page.'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/third');
              },
              child: const Text('Go to third page.'),
            ),
          ],
        ),
      ),
    );
  }
}
