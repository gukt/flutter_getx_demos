import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Demo5 extends StatelessWidget {
  const Demo5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo5 Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Button: Open a snackbar
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  'Hi',
                  'i am a modern snackbar',
                  icon: const Icon(Icons.ac_unit_rounded),
                  duration: const Duration(seconds: 1),
                );
              },
              child: const Text('Open a snackbar'),
            ),
            // Button： Open a BottomSheet
            ElevatedButton(
              onPressed: () {
                // Get.bottomSheet 类似于 showModalBottomSheet，但不需要 context
                Get.bottomSheet(Container(
                  color: Colors.white,
                  child: Wrap(
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.music_note),
                        title: const Text('Music'),
                        onTap: () {},
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.videocam),
                        title: const Text('Video'),
                        onTap: () {},
                      ),
                    ],
                  ),
                ));
              },
              child: const Text('Open a BottomSheet'),
            ),
            // Button： Open a default dialog
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                    title: '立即登录？',
                    confirm: ElevatedButton(
                      onPressed: () {},
                      child: const Text('登录'),
                    ),
                    cancel: ElevatedButton(
                      onPressed: () {},
                      child: const Text('取消'),
                    ),
                    onConfirm: () => debugPrint("Ok"),
                    backgroundColor: Colors.amber,
                    middleText: "我是简单的对话框显示文本内容",
                    // content 会覆盖 middleText
                    content: const Text('你确定要登录吗？'));
              },
              child: const Text('Open a default dialog'),
            ),
            // Open a custom dialog
            ElevatedButton(
              onPressed: () {
                var dialogContentWidget = UnconstrainedBox(
                  child: Container(
                    color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FlutterLogo(size: 100),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          child: const Text('Show Dialog'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.teal,
                            onPrimary: Colors.white,
                            shadowColor: Colors.tealAccent,
                            textStyle: const TextStyle(
                              fontSize: 18,
                            ),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            minimumSize: const Size(120, 50),
                          ),
                          onPressed: () {
                            Get.defaultDialog();
                          },
                        ),
                      ],
                    ),
                  ),
                );
                // 打开对话框
                Get.dialog(dialogContentWidget);
              },
              child: const Text('Open a dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
