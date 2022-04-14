import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_translations.dart';

/// 国际化示例
/// * 自定义 AppTranslations 类，并添加键值对翻译
/// * 如何配置国际化
/// * 如何进行语言切换
/// * 演示了语言切换失败回退效果
void main() {
  runApp(GetMaterialApp(
    // 使用的字典类
    translations: AppTranslations(),
    // 使用的本地语言
    locale: Get.deviceLocale,
    // 出错后的回退语言
    fallbackLocale: const Locale('en', 'US'),
    home: const Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('helloWorld'.tr),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.updateLocale(const Locale('zh', 'CN'));
                  },
                  child: const Text('中文'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Get.updateLocale(const Locale('en', 'US'));
                  },
                  child: const Text('English'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // 因为没有配置日文语言翻译，所以回退到 fallbackLocale 指定的语言
                    Get.updateLocale(const Locale('ja', 'JP'));
                  },
                  child: const Text('日本语'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
