import 'package:flutter/material.dart';

class ADPage extends StatelessWidget {
  const ADPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AD Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('广告也精彩!'),
          ],
        ),
      ),
    );
  }
}
