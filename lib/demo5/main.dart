import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_binding.dart';
import 'home_view.dart';

/// Binding 示例
/// * 将 view、controller、binding 分别拆分到多个文件。
/// * 如何定义一个自定义的 Binding。
/// * 使用 Binding 后，View 中不用需要写注入 Controller 的代码了。
/// * 命名路由中如何配置 Bindings。
/// * 如果不想创建单独的 Binding 类，也可以使用 BindingBuilder（注释处）。
/// * 使用 GetView，可以让获取 Ctroller 的那还代码也不用写了，让 View 更干净。
void main() {
  runApp(GetMaterialApp(
    initialRoute: '/home',
    getPages: [
      GetPage(
        name: '/home',
        page: () => const HomeView(),
        binding: HomeBinding(),
        // 如果你觉得每个 View 都对应创建一个 Binding 太麻烦，
        // 你也可以使用 BindingBuilder
        // binding: BindingsBuilder(() => Get.lazyPut(() => HomeController())),
      )
    ],
  ));
}
