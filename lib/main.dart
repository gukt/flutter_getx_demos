import 'package:flutter/material.dart';
// import 'package:flutter_getx_demos/demo2/main.dart';
// import 'package:flutter_getx_demos/demo4/ad_page.dart';
// import 'package:flutter_getx_demos/demo4/home_view.dart';
// import 'package:flutter_getx_demos/demo4/first_page.dart';
// import 'package:flutter_getx_demos/demo4/login_page.dart';
// import 'package:flutter_getx_demos/demo4/profile_page.dart';
// import 'package:flutter_getx_demos/demo4/second_page.dart';
// import 'package:flutter_getx_demos/demo4/splash_page.dart';
// import 'package:flutter_getx_demos/demo4/thrid_page.dart';
// import 'package:flutter_getx_demos/demo5/demo5.dart';
// import 'package:flutter_getx_demos/demo6/demo6.dart';
import 'package:get/get.dart';
// import 'package:get/instance_manager.dart';

// import 'tmp/demo0.dart';
// import 'tmp/demo3.dart';
// import 'demo4/unknown_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 将原来的 MaterialApp 变为 GetMaterialApp,
    // GetMaterialApp 并不是修改过的 它只是一个预先配置的 Widget，子组件还是原来的 MaterialApp
    // GetMaterialApp会创建路由，注入它们，注入翻译，注入你需要的一切路由导航。
    // 如果你只用 Get来进行状态管理或依赖管理，就没有必要使用 GetMaterialApp。
    // 反之，如果你需要支持路由、Snackbar、国际化、BottomSheet、对话框、或路由相关的高级 API，请使用 GetMaterialApp。
    return const GetMaterialApp(
      // 定义 404 未知路由，所有找不到名称的路由都指向这里定义的路由
      // unknownRoute: GetPage(name: '/404', page: () => const UnknownPage()),

      // getPages: [
      //   // // GetPage(name: '/', page: () => const Demo4()),
      //   // GetPage(name: '/first', page: () => const FirstPage()),
      //   // GetPage(name: '/second', page: () => const SecondPage()),
      //   // GetPage(name: '/third', page: () => const ThridPage()),
      //   // GetPage(name: '/login', page: () => const LoginPage()),
      //   // GetPage(name: '/splash', page: () => const SplashPage()),
      //   // GetPage(name: '/ad', page: () => const ADPage()),

      //   // // 命名路由可以带参数，我们可以同时指定一个带参数的路由，和一个不带参数的路由
      //   // // 不带参数的
      //   // GetPage(name: '/profile', page: () => const ProfilePage()),
      //   // // 带参数的
      //   // GetPage(name: '/profile/:userId', page: () => const ProfilePage()),

      //   //
      // ],
      // Get 还提供了一个 Routing 回调，我们可以做很多事情，比如：权限验证，弹出广告等
      // routingCallback: (routing) {
      //   if (routing?.current == '/second') {
      //     Get.toNamed('/ad');
      //   }
      // },

//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('GetX Demos'),
//         ),
//         body: Column(children: [
//           ListTile(
//             title: const Text('Demo0'),
//             subtitle: const Text('''
// 本例演示了响应式自动刷新计数器变量的极致简单的方法，步骤为：
// 1. 定义变量，并让变量变为可观察的 (只需结尾加 .obs)
// 2. 在显示 UI 处，将包含可观察变量的显示 Widget 套在 Obx Widget 中，即可实现自动刷新。
// '''),
//             onTap: () {
//               Get.to(const Demo0());
//             },
//           ),
//           const Divider(),
//           ListTile(
//             title: const Text('Demo1'),
//             subtitle: const Text('''
// 本例演示了：
// 1. 通过 .obs 扩展方法, 快速地将一个普通变量转换为“反应式(Reactive)”变量。
// 1. 使用 Obx 组件来自动更新一个反应式变量。
// 2. 使用 Get.put 注入一个 Controller。
// 3. 使用 Get.find 找到之前页面里正在使用的 Controller。
// '''),
//             onTap: () {
//               Get.to(const Demo1());
//             },
//           ),
//           const Divider(),
//           ListTile(
//             title: const Text('Demo3'),
//             subtitle: const Text('''
// 本例演示：计算属性
// '''),
//             onTap: () {
//               Get.to(const Demo3());
//             },
//           ),
//           const Divider(),
//           ListTile(
//             title: const Text('Demo2'),
//             onTap: () {
//               debugPrint('Go to Demo2');
//             },
//           ),
//           const Divider(),
//           ListTile(
//             title: const Text('Demo2'),
//             onTap: () {
//               debugPrint('Go to Demo2');
//             },
//           ),
//         ]),
//       ),
      home: MyHomePage(title: 'aaa'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
