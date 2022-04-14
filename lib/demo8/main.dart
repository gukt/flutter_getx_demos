import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// GetxService 示例
///
/// 如果你希望某个类实例在你的应用程序的生命周期内一直存在，请使用 GetxService
Future<void> main() async {
  // 服务初始化
  await initServices();
  runApp(const GetMaterialApp(home: Home()));
}

// 运行应用之前，让你的服务初始化是一个明智之举。
//
initServices() async {
  debugPrint('>>> Initializing Services...');

  await Get.putAsync(() => DataService().init());
  await Get.putAsync(() => SettingsService().init());
  await Get.putAsync(() => StorageService().init());

  debugPrint('<<< All services are ready.');

  var dataService = Get.find<DataService>();
  var settingsService = Get.find<SettingsService>();
  var storageService = Get.find<StorageService>();

  print(dataService);
  print(settingsService);
  print(storageService);
}

class DataService extends GetxService {
  Future<DataService> init() async {
    debugPrint('Initializing $runtimeType');
    await 2.delay();
    debugPrint('$runtimeType is ready.');
    return this;
  }
}

class SettingsService extends GetxService {
  Future<SettingsService> init() async {
    debugPrint('Init $runtimeType');
    await 2.delay();
    debugPrint('$runtimeType is ready.');
    return this;
  }
}

class StorageService extends GetxService {
  Future<StorageService> init() async {
    debugPrint('Init $runtimeType');
    await 2.delay();
    debugPrint('$runtimeType is ready.');
    return this;
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Hello GetX!')));
  }
}
