import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Demo6 extends StatelessWidget {
  const Demo6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 请见其他高级 API：https://github.com/jonataslaw/getx/blob/master/README.zh-cn.md#%E5%85%B6%E4%BB%96%E9%AB%98%E7%BA%A7api

            // 获取当前页面的 arguments（通过命名路由的 arguments 属性传入）
            Text('Get.arguments: ${Get.arguments}'),
            // 获取当前页面的 arguments（通过命名路由的名称带 URL 查询字符串传入）
            Text('Get.parameters: ${Get.parameters}'),
            // TODO 获取当前页面之前的路由
            Text('Get.routing: ${Get.routing}'),

            // 检查程序运行的平台信息
            Text('GetPlatform.isAndroid: ${GetPlatform.isAndroid}'),
            Text('GetPlatform.isIOS: ${GetPlatform.isIOS}'),
            Text('GetPlatform.isLinux: ${GetPlatform.isLinux}'),
            Text('GetPlatform.isWindows: ${GetPlatform.isWindows}'),
            Text('GetPlatform.isMacOS: ${GetPlatform.isMacOS}'),
            Text('GetPlatform.isFuchsia: ${GetPlatform.isFuchsia}'),
            Text('GetPlatform.isDesktop: ${GetPlatform.isDesktop}'),
            Text('GetPlatform.isMobile: ${GetPlatform.isMobile}'),
            Text('GetPlatform.isWeb: ${GetPlatform.isWeb}'),

            // 获取屏幕尺寸，只读属性，等效于:
            //  MediaQuery.of(context).size.width,
            //  MediaQuery.of(context).size.height
            Text('Screen size: w:${Get.width}, h:${Get.height}'),
            Text('Screen size: w:${context.width}, h:${context.height}'),
            Text('屏幕高度/2: ${context.heightTransformer(dividedBy: 2)}'),
            Text('屏幕高度的 46%: ${context.heightTransformer(reducedBy: 54)}'),

            Text('Get.isDialogOpen: ${Get.isDialogOpen}'),
            Text('Get.isBottomSheetOpen: ${Get.isBottomSheetOpen}'),
            Text('Get.isSnackbarOpen: ${Get.isSnackbarOpen}'),
//             // 获取当前上下文
            const Text('获取当前上下文: Get.context'),

            // TODO 可选的全局设置和手动配置：https://github.com/jonataslaw/getx/blob/master/README.zh-cn.md#%E5%8F%AF%E9%80%89%E7%9A%84%E5%85%A8%E5%B1%80%E8%AE%BE%E7%BD%AE%E5%92%8C%E6%89%8B%E5%8A%A8%E9%85%8D%E7%BD%AE

            // Get 对 BuilderContext 还扩展了其他很多方法（都很简单常用，用法略）

            // TODO desc here
            // TODO 这里放开就会报异常，具体这是做什么的？
            // Text('Get.overlayContext: ${Get.overlayContext}'),

            // TODO
            // Text('Get.arguments: ${Get.removeRoute()}'),
            // Text('Get.arguments: ${Get.Get.until()()}'),
            //反复返回，直到表达式返回真。
            // Get.until()

            // // 转到下一条路由，并删除所有之前的路由，直到表达式返回true。
            // Get.offUntil()

            // // 转到下一个命名的路由，并删除所有之前的路由，直到表达式返回true。
            // Get.offNamedUntil()
          ],
        ),
      ),
    );
  }
}
